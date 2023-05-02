package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;

import java.util.List;

public interface ScheduleService {
    List<ScheduleResponseDto> getDayScheduleList(Long classSeq, String year, String month, String day);
}
