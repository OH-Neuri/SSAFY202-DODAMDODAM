package com.wohaha.dodamdodam.dto.response.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ScheduleListResponseDto {
    private String type;
    private String content;

    public ScheduleListResponseDto(String type, String content) {
        this.type = type;
        this.content = content;
    }
}
