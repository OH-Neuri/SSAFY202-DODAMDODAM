package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KindergartenScheduleListResponseDto;

public interface ManageScheduleService {
    boolean createSchedule(CreateScheduleRequestDto createScheduleRequestDto);

    KindergartenScheduleListResponseDto getScheduleList(String year, String month);
}
