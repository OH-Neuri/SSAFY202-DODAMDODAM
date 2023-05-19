package com.cos.chatapp.controller;

import com.cos.chatapp.domain.Chat;
import com.cos.chatapp.domain.ChatRoom;
import com.cos.chatapp.dto.ChatRoomDto;
import com.cos.chatapp.dto.RoomFocusStateDto;
import com.cos.chatapp.repository.ChatRepository;
import com.cos.chatapp.repository.ChatRoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import java.time.LocalDateTime;
import java.util.Objects;

@RestController // 데이터 리턴 서버
@RequiredArgsConstructor
public class ChatController {
    private final ChatRepository chatRepository;
    private final ChatRoomRepository chatRoomRepository;


    //채팅방 최초 생성 로직 :: 메인 서버에서 바꾸 승낙을 하게 되면 프론트에서 userIdxA,userIdxB를 보내준다.
    //이미 생성된 채팅방이 있는 상태라면 해당 채팅방 반환 -> 수정해야함
    //chatRoomRepository에 채팅방 정보 저장.
    @CrossOrigin
    @PostMapping("/chatRoom")
    public Mono<ChatRoom> createChatRoom(@RequestBody ChatRoomDto chatRoomDto) {
        Long[] sortedUserSeq = chatRoomDto.getUserSeq().clone();
        String[] sortedUserName = chatRoomDto.getName().clone();
        if (chatRoomDto.getUserSeq()[0] > chatRoomDto.getUserSeq()[1]) {
            // 순서 정렬
            Long tempSeq = chatRoomDto.getUserSeq()[0];
            sortedUserSeq[0] = chatRoomDto.getUserSeq()[1];
            sortedUserSeq[1] = tempSeq;

            String tempName = chatRoomDto.getName()[0];
            sortedUserName[0] = chatRoomDto.getName()[1];
            sortedUserName[1] = tempName;
        }
        Mono<ChatRoom> existRoom = chatRoomRepository.findByUserSeq(sortedUserSeq);
        return existRoom.hasElement()
                .flatMap(hasValue -> {
                    if (hasValue) {
                        System.out.println("Room is Exist");
                        return existRoom;
                    } else {
                        ChatRoom chatRoom = new ChatRoom();
                        chatRoom.setUserSeq(sortedUserSeq);
                        chatRoom.setName(sortedUserName);

                        chatRoom.setCreatedAt(LocalDateTime.now());
                        chatRoom.setLastContent("채팅방이 개설되었습니다.");
                        return chatRoomRepository.save(chatRoom);
                    }
                })
                .switchIfEmpty(Mono.error(new RuntimeException("Room not found")));

    }

        //채팅 보내기 :: 채팅을 하게 되면 각 유저의 채팅방 리스트를 업데이트하고 채팅 DB에 저장한다.
    // Mono : 데이터 한 건 return //save한 데이터가 잘 저장된지 확인 -> 싫으면 void로 해도됨
    @CrossOrigin
    @PostMapping("/chat")
    public Mono<Chat> setMsg(@RequestBody Chat chat) {
        chat.setCreatedAt(LocalDateTime.now());
        return chatRepository.save(chat);
    }

    //채팅방 업데이트 :: 채팅이 날라가면 수신자가 채팅방 out 상태면 readNotCnt 증가. in 상태면 상태 변화 없음. 채팅방 미리보기 메세지 수정.
    //만약 채팅방 정보가 없다면 error 처리
    //만약 채탕방 정보가 있다면 LastContent에 현재 발송된 메세지를 미리보기로 보여준다.
    //현재 사용자가 채팅방에 입장하지 않았다면 채팅방 리스트에서 전달받은 채팅 수 만큼 갱신한다.
    @CrossOrigin
    @PostMapping("/chatList")
    public Mono<ChatRoom> chatRoomListUpdate(@RequestBody Chat chat) {
        return chatRoomRepository.findByRoomId(chat.getRoomId())
                .flatMap(chatRoom -> {
                    chatRoom.setCreatedAt(chat.getCreatedAt());
                    chatRoom.setLastContent(chat.getMsg());
                    Long[] arr = chatRoom.getReadNotCnt();
                    if (Objects.equals(chat.getReceiverSeq(), chatRoom.getUserSeq()[0])) {
                        if (!chatRoom.getUserActive()[0]) arr[0]++;
                    } else {
                        if (!chatRoom.getUserActive()[1]) arr[1]++;
                    }
                    chatRoom.setReadNotCnt(arr);
                    return chatRoomRepository.save(chatRoom);
                })
                .switchIfEmpty(Mono.error(new RuntimeException("Room not found")));

}

    //현재 포커스에 따른 읽기 변경
    //브라우저의 FocusOn이 바뀔 때마다 api 요청을 하게된다. 해당 요청을 받아서 방에 입장한 사용자 in/out 갱신.
    @CrossOrigin
    @PostMapping("/focusState")
    private Mono<ChatRoom> updateUserActive(@RequestBody RoomFocusStateDto roomFocusStateDto) {
        String roomId = roomFocusStateDto.getRoomId();
        Long userSeq = roomFocusStateDto.getUserSeq();
        Boolean focusOn = roomFocusStateDto.getFocusOn();
        return chatRoomRepository.findByRoomId(roomId).map(b -> {
            Boolean[] userActive = b.getUserActive();
            Long[] readNotCnt = b.getReadNotCnt();

            if (Objects.equals(userSeq, b.getUserSeq()[0])) {
                if (focusOn) {
                    userActive[0] = true;
                    readNotCnt[0] = 0L;
                } else userActive[0] = false;
            } else {
                if (focusOn) {
                    userActive[1] = true;
                    readNotCnt[1] = 0L;
                } else userActive[1] = false;
            }
            b.setUserActive(userActive);
            b.setReadNotCnt(readNotCnt);
            return b;
        }).flatMap(chatRoomRepository::save);
    }

    //채팅방 안으로 들어가기 :: 채팅방에서 채팅했던 내역들을 모두 불러오고 실시간 채팅을 flux한다.
    @CrossOrigin
    @GetMapping(value = "/chatRoom/{roomId}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<Chat> findByRoomNum(@PathVariable String roomId) {

        return chatRepository.findByRoomId(roomId).subscribeOn(Schedulers.boundedElastic());
    }

    //최초 채팅방 리스트 불러오기 :: 유저가 채팅방 리스트 페이지로 오면 해당 유저의 채팅방 리스트 받아온다.
    //TEXT_EVENT_STREAM_VALUE", 즉 응답 본문이 텍스트 이벤트 스트림된다. 클라이언트에 실시간으로 데이터를 스트리밍하는데 유용
    //이를 통해 Server-Sent Events(SSE)형태로 응답 반환 -> 클라이언트와 서버 간의 실시간 양방향 통신
    @CrossOrigin
    @GetMapping(value = "/{userSeq}/chatRoomList", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<ChatRoom> findByChatRoomList(@PathVariable Long userSeq) {

        return chatRoomRepository.findByUserSeq(userSeq);
    }

    //현재 요청한 회원이 채팅방 리스트에 입장한 시간 기준으로 채팅이 오는 것을 채팅방 리스트에서 감지한다.
    //채팅방 리스트에 입장 후 해당 url로 flux 한다.
    //리턴 타입은 flux인데 플럭스는 0~n개의 요소를 비동기적으로 나타내는 리액티브 프로그래밍 타입이다.
    //이 메서드는 bounded elastic scheduler에서 플럭스를 구독하도록 설정되어 있고 이는 병렬 연산의 수가 제한됨을 의미한다.
    //@GetMapping 주석의 products 특성은 "MediaType"으로 설정된다. TEXT_E
    // VENT_STREAM_VALUE", 즉 응답 본문이 텍스트 이벤트 스트림된다. 클라이언트에 실시간으로 데이터를 스트리밍하는데 유용
    //@CrossOrigin 주석은 교차 오리진 리소스 공유를 허용하는 데 사용된다. 즉, 다른 도메인의 요청이 허용.
    //이 기능은 웹 서비스가 다른 도메인에서 실행 중인 클라이언트 응용프로그램을 서비스하는 경우에 유용.
    @CrossOrigin
    @GetMapping(value = "/{userSeq}/chatRoom", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<Chat> findByRecentChatList(@PathVariable Long userSeq) {
        LocalDateTime queryTime = LocalDateTime.now();
        return chatRepository.mFindByReceiver(userSeq, queryTime).subscribeOn(Schedulers.boundedElastic());
    }

    //채팅방 리스트 새로 받아오기 :: 프론트 측에서 갱신된 내용을 api 요청을 통해 다시 받아온다.(채팅방 리스트 변경 감지될 때마다)
    @CrossOrigin
    @GetMapping("/chatRoomUpdate/{roomId}")
    public Mono<ChatRoom> getChatRoomInfo(@PathVariable("roomId") String roomId) {

        return chatRoomRepository.findByRoomId(roomId);
    }


}
