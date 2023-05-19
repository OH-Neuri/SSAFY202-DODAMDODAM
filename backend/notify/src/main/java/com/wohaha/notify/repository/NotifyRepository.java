package com.wohaha.notify.repository;


import com.wohaha.notify.domain.Notify;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.data.mongodb.repository.Tailable;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;


@Repository
public interface NotifyRepository extends ReactiveMongoRepository<Notify, String> {

  //알림을 읽지 않았을때, 최신순
  @Tailable
  @Query("{ $and: [ { receiveUserSeq: ?0 }, { readState: { $eq: false } } ] }")
  Flux<Notify> findByReceiveUserSeq (Long receiveUserSeq);


}
