package com.cos.chatapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomDto {
    private Long[] userSeq = new Long[2];
    private String [] name = new String[2];
}
