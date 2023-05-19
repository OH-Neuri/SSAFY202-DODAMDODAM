package com.cos.chatapp.repository;

import com.cos.chatapp.domain.ChatRoom;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface ChatRoomRepository extends ReactiveMongoRepository<ChatRoom, String> {
    @Query("{'userSeq':  ?0}")
    Flux<ChatRoom> findByUserSeq(Long userSeq); //Flux (흐름) response를 유지하면서 데이터를 계속 흘려 보내기

    @Query("{'roomId':  ?0 }")
    Mono<ChatRoom> findByRoomId(String roomId);

    Mono<ChatRoom> findByUserSeq(Long[] userSeq);


}
