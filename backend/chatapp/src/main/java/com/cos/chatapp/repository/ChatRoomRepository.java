package com.cos.chatapp.repository;

import com.cos.chatapp.domain.ChatRoom;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface ChatRoomRepository extends ReactiveMongoRepository<ChatRoom, String> {
    @Query("{'userIdx': ?0}")
    Flux<ChatRoom> findByUserIdx(Long userSeq); //Flux (흐름) response를 유지하면서 데이터를 계속 흘려 보내기

    @Query("{'roomId':  ?0 }")
    Mono<ChatRoom> findByRoomNumber(String roomId);

    Mono<ChatRoom> findByUserSeqIn(Long userSeq1, Long userSeq2);
}
