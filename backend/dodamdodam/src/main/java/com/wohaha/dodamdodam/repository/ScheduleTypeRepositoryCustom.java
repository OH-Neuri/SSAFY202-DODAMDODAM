package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.request.ScheduleTypeRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleTypeResponseDto;

import java.util.List;

public interface ScheduleTypeRepositoryCustom {
    List<ScheduleTypeResponseDto> findScheduleTypeByKindergartenSeq(Long kindergartenSeq);
    Long deleteScheduleTypeById(Long scheduleTypeSeq);

    Long updateScheduleType(ScheduleTypeRequestDto scheduleTypeRequestDto);
}
