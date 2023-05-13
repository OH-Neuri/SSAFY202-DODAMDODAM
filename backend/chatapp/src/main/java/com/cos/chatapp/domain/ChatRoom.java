package com.cos.chatapp.domain;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.aggregation.AccumulatorOperators;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Data
@Document(collection = "chatRoom")
public class ChatRoom {
    @Id
    private String roomId;
    private Long []userSeq = new Long[]{0L, 0L};
    private Long []readNotCnt = new Long[]{0L,0L};
    private Boolean [] userActive = new Boolean[]{false, false};
    private String [] name = new String[2];
    private String lastContent;
    //시간도 같이 보내야함
    private LocalDateTime createdAt;

}
