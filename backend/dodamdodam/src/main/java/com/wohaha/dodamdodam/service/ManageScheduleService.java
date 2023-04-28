package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;

public interface ManageScheduleService {
    boolean createSchedule(CreateScheduleRequestDto createScheduleRequestDto);
}
