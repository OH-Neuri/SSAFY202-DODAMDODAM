package com.cos.chatapp.repository;

import com.cos.chatapp.domain.Chat;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.data.mongodb.repository.Tailable;
import reactor.core.publisher.Flux;

import java.time.LocalDateTime;

public interface ChatRepository extends ReactiveMongoRepository<Chat, String> {
//    @Tailable // 커서를 안닫고 계속 유지한다 -> select해서 한번 찾아도 관련 데이터가 Flux로 흘러들어옴
//    @Query("{'sender': ?0, 'receiver': ?1}")
//    Flux<Chat> mFindBySender(String sender, String receiver); // Flux(흐름) : response를 유지하면서 데이터를 계속 흘려보내기

    @Tailable
    @Query("{'roomId': ?0}")
    Flux<Chat> findByRoomId(String roomId); //Flux (흐름) response를 유지하면서 데이터를 계속 흘려 보내기

    @Tailable
    @Query("{'receiverSeq': ?0, 'createdAt': {$gt: ?1}}")
    Flux<Chat> mFindByReceiver(Long receiverSeq, LocalDateTime queryTime);


}
