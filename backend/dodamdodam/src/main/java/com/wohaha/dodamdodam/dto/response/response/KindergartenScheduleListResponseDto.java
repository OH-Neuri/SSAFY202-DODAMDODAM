package com.wohaha.dodamdodam.dto.response.response;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Map;

@Getter
@Setter
public class KindergartenScheduleListResponseDto {
    private String year;
    private String month;
    private List<Integer> dateNumber;
    private Map<Integer, List<ScheduleListResponseDto>> schedule;

    public KindergartenScheduleListResponseDto(String year, String month) {
        this.year = year;
        this.month = month;
    }
}
