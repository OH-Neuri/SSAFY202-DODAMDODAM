package com.wohaha.dodamdodam.dto.response.response;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ScheduleResponseDto {
    private Long scheduleSeq;
    private String type;
    private String content;

    public ScheduleResponseDto(Long scheduleSeq, String type, String content) {
        this.scheduleSeq = scheduleSeq;
        this.type = type;
        this.content = content;
    }
}
