package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.response.ClassScheduleResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;

import java.util.List;

public interface ScheduleRepositoryCustom {
    List<Integer> findScheduleDateList(Long kindergartenSeq, String year, String month);

    List<ScheduleResponseDto> findScheduleListByKindergartenSeq(Long kindergartenSeq, Integer year, Integer month, Integer day);
    Long deleteScheduleById(Long scheduleSeq);

    // class
    List<Integer> findScheduleDateList(Long kindergartenSeq, Long classSeq, String year, String month);
    List<ClassScheduleResponseDto> findClassScheduleByClassSeq(Long kindergartenSeq, Long classSeq, Integer year, Integer month, Integer day);
}
