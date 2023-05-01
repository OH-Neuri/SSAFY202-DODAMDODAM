package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.request.ScheduleTypeRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KindergartenScheduleListResponseDto;

public interface ManageScheduleService {
    // 일정 관리
    boolean createSchedule(CreateScheduleRequestDto createScheduleRequestDto);

    KindergartenScheduleListResponseDto getScheduleList(String year, String month);

    boolean deleteSchedule(Long scheduleSeq);

    // 일정분류 관리
    boolean createScheduleType(String content);

    boolean deleteScheduleType(Long scheduleTypeSeq);

    boolean updateScheduleType(ScheduleTypeRequestDto scheduleTypeRequestDto);
}
