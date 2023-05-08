package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;

import java.time.LocalDate;
import java.util.List;

public interface AttendanceRepositoryCustom {
    List<AttendanceListResponseDto> getAttendanceList(Long classSeq, LocalDate day);

    AttendanceDetailResponseDto getAttendanceDetail(Long attendanceSeq);
}
