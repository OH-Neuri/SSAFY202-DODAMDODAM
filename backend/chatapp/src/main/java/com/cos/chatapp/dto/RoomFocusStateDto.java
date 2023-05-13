package com.cos.chatapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomFocusStateDto {

    private Long userSeq;
    private String roomId;
    private Boolean focusOn;

}
