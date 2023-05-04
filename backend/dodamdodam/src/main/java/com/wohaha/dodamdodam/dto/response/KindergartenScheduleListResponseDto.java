package com.wohaha.dodamdodam.dto.response;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Map;

@Getter
@Setter
public class KindergartenScheduleListResponseDto {
    private String year;
    private String month;
    private List<Integer> dateNumber;
    private Map<Integer, List<ScheduleResponseDto>> schedule;

    public KindergartenScheduleListResponseDto(String year, String month) {
        this.year = year;
        this.month = month;
    }
}
