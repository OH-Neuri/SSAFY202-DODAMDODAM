package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;

import java.sql.Time;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface AttendanceRepositoryCustom {
    List<AttendanceListResponseDto> getAttendanceList(Long classSeq, LocalDate day);

    Optional<AttendanceDetailResponseDto> getAttendanceDetail(Long attendanceSeq);

    Optional<AttendanceInfoResponseDto> getAttendanceInfo(Long kidSeq, LocalDate day);

    Long updateAttendanceForm(Long attendanceSeq, Time forthTimeCheck, Time backTimeCheck);
}
