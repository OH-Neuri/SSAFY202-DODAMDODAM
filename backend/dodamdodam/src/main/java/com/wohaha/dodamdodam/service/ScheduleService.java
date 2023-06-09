package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassScheduleListResponseDto;
import com.wohaha.dodamdodam.dto.response.ClassScheduleResponseDto;

import java.util.List;

public interface ScheduleService {
    boolean createClassSchedule(Long classSeq, CreateScheduleRequestDto createScheduleRequestDto);

    List<ClassScheduleResponseDto> getDayScheduleList(Long classSeq, String year, String month, String day);

    ClassScheduleListResponseDto getMonthScheduleList(Long classSeq, String year, String month);

}
