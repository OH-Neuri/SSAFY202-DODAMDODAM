package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.KidAttendanceListResponseDto;

import java.time.LocalDate;
import java.util.List;

public interface AttendanceRepositoryCustom {
    List<KidAttendanceListResponseDto> getKidAttendanceList(Long classSeq, LocalDate day);

}
