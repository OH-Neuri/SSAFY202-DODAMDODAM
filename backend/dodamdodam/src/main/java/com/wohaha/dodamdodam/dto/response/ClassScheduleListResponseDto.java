package com.wohaha.dodamdodam.dto.response;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Map;

@Getter
@Setter
public class ClassScheduleListResponseDto {
    private final String year;
    private final String month;
    private List<Integer> dateNumber;
    private Map<Integer, List<ClassScheduleResponseDto>> schedule;

    public ClassScheduleListResponseDto(String year, String month) {
        this.year = year;
        this.month = month;
    }
}
