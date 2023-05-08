package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.AttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceFormResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;

import java.util.List;

public interface AttendanceService {
    List<AttendanceListResponseDto> getAttendanceList(AttendanceRequestDto classAttendanceRequestDto);

    AttendanceDetailResponseDto getAttendanceDetail(Long attendanceSeq);

    AttendanceFormResponseDto getAttendanceForm(AttendanceRequestDto kidAttendanceRequestDto);
}
