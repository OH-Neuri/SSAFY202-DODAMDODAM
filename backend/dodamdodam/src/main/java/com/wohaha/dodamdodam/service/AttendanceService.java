package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.ClassAttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.KidAttendanceListResponseDto;

import java.util.List;

public interface AttendanceService {
    List<KidAttendanceListResponseDto> getKidAttendanceList(ClassAttendanceRequestDto classAttendanceRequestDto);
}
