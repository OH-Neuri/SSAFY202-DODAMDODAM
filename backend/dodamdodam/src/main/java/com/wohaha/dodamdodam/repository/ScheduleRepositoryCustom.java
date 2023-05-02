package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.response.ClassScheduleResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;

import java.util.List;

public interface ScheduleRepositoryCustom {
    List<Integer> findScheduleDateList(Long kindergartenSeq, String year, String month);

    List<ScheduleResponseDto> findScheduleListByDate(Long kindergartenSeq, String year, String month, Integer date);

    Long deleteScheduleById(Long scheduleSeq);

    // class
    List<ClassScheduleResponseDto> findClassScheduleByClassSeq(Long kindergartenSeq, Long classSeq, Integer year, Integer month, Integer day);
}
