package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.response.ClassScheduleResponseDto;

import java.util.List;

public interface ScheduleService {
    List<ClassScheduleResponseDto> getDayScheduleList(Long classSeq, String year, String month, String day);
}
