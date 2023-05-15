package com.wohaha.dodamdodam.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NotifyResponseDto {

    private String content;

    private int type;

    private long typeSeq;

    private long sendUserSeq;

    private long receiveUserSeq;
}
