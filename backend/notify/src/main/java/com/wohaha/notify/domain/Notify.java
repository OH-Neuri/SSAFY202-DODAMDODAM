package com.wohaha.notify.domain;


import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Data
@Document(collection = "tbl_notify")
public class Notify {

  @Id
  private String notifySeq;
  private String content;
  private int type; //1. 알림장  2 투약  3. 등하원
  private Long typeSeq; //알림장seq, 투약seq...
  private Long sendUserSeq;
  private Long receiveUserSeq;
  private boolean readState = false;
  private LocalDateTime createdAt;

  public Notify(String content, int type, Long typeSeq, Long sendUserSeq, Long receiveUserSeq) {
    this.content = content;
    this.type = type;
    this.typeSeq = typeSeq;
    this.sendUserSeq = sendUserSeq;
    this.receiveUserSeq = receiveUserSeq;
    this.createdAt = LocalDateTime.now();
  }

}
