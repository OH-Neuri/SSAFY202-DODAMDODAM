package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Schedule;
import com.wohaha.dodamdodam.dto.response.response.ScheduleListResponseDto;

import java.util.List;

public interface ScheduleRepositoryCustom {
    List<Integer> findScheduleDateList(Long kindergartenSeq, String year, String month);
    List<ScheduleListResponseDto> findScheduleListByDate(Long kindergartenSeq, String year, String month, Integer date);
}
