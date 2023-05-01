package com.wohaha.dodamdodam.dto.response.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ScheduleListResponseDto {
    private Long scheduleSeq;
    private String type;
    private String content;

    public ScheduleListResponseDto(Long scheduleSeq, String type, String content) {
        this.scheduleSeq = scheduleSeq;
        this.type = type;
        this.content = content;
    }
}
