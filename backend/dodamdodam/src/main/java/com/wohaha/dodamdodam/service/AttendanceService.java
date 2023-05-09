package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.AttendanceRequestDto;
import com.wohaha.dodamdodam.dto.request.AttendanceTimeRequestDto;
import com.wohaha.dodamdodam.dto.request.CreateAttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceFormResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;

import java.util.List;

public interface AttendanceService {
    boolean createAttendance(CreateAttendanceRequestDto createAttendanceRequestDto, String uploadUrl);
    List<AttendanceListResponseDto> getAttendanceList(AttendanceRequestDto classAttendanceRequestDto);

    AttendanceDetailResponseDto getAttendanceDetail(Long attendanceSeq);

    AttendanceFormResponseDto getAttendanceForm(AttendanceRequestDto kidAttendanceRequestDto);

    boolean updateAttendanceTime(Long attendanceSeq, AttendanceTimeRequestDto attendanceTimeRequestDto);
}
