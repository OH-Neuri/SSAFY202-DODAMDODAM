package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.AttendanceRequestDto;
import com.wohaha.dodamdodam.dto.request.AttendanceTimeRequestDto;
import com.wohaha.dodamdodam.dto.request.CreateAttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;
import com.wohaha.dodamdodam.dto.response.NotifyResponseDto;

import java.util.List;

public interface AttendanceService {
    boolean createAttendance(CreateAttendanceRequestDto createAttendanceRequestDto);
    List<AttendanceListResponseDto> getAttendanceList(AttendanceRequestDto classAttendanceRequestDto);

    AttendanceDetailResponseDto getAttendanceDetail(Long attendanceSeq);

    AttendanceInfoResponseDto getAttendanceInfo(AttendanceRequestDto kidAttendanceRequestDto);

    NotifyResponseDto updateAttendanceTime(Long attendanceSeq, AttendanceTimeRequestDto attendanceTimeRequestDto);
}
