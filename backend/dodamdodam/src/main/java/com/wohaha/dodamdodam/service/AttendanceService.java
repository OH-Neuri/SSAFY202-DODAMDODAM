package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.AttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;

import java.util.List;

public interface AttendanceService {
    List<AttendanceListResponseDto> kidAttendanceList(AttendanceRequestDto classAttendanceRequestDto);

    AttendanceDetailResponseDto getKidAttendanceDetail(Long attendanceSeq);
}
