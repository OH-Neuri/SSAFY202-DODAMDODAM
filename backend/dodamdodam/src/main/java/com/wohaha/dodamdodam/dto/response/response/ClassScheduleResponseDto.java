package com.wohaha.dodamdodam.dto.response.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ClassScheduleResponseDto {
    private Long scheduleSeq;
    private String content;
    private String type;
    private Long classSeq;
}
