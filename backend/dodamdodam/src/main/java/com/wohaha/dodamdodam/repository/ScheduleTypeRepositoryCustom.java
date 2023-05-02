package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.request.ScheduleTypeRequestDto;

public interface ScheduleTypeRepositoryCustom {
    Long deleteScheduleTypeById(Long scheduleTypeSeq);

    Long updateScheduleType(ScheduleTypeRequestDto scheduleTypeRequestDto);
}
