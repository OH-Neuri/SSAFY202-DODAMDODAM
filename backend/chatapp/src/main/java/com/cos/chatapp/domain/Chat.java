package com.cos.chatapp.domain;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Data
@Document(collection = "chat")
public class Chat {
    @Id
    private String id;
    private String msg;
    // 사진 추가해야함 아마 LIST로?
    private Long receiverSeq; // 받는 사람 PK
    private Long senderSeq; //보내는 사람 PK
    private String receiverName;
    private String senderName;
    private String roomId; // 방 번호
    private LocalDateTime createdAt;
}

