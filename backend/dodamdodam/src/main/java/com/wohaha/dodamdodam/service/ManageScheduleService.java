package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.request.ScheduleTypeRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KindergartenScheduleListResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleTypeResponseDto;

import java.util.List;

public interface ManageScheduleService {
    // 일정 관리
    boolean createSchedule(CreateScheduleRequestDto createScheduleRequestDto);

    KindergartenScheduleListResponseDto getMonthScheduleList(String year, String month);
    List<ScheduleResponseDto> getDayScheduleList(String year, String month, String day);

    boolean deleteSchedule(Long scheduleSeq);

    // 일정분류 관리
    boolean createScheduleType(String content);
    List<ScheduleTypeResponseDto> getScheduleTypeList();
    boolean updateScheduleType(ScheduleTypeRequestDto scheduleTypeRequestDto);
    boolean deleteScheduleType(Long scheduleTypeSeq);

}
