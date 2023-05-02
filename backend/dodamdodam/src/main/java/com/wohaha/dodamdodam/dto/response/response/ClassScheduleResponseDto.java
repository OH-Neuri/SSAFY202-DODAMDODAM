package com.wohaha.dodamdodam.dto.response.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ClassScheduleResponseDto {
    private Long scheduleSeq;
    private String type;
    private String content;
    private Long classSeq;
}
