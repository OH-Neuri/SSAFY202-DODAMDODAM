package com.wohaha.dodamdodam.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.request.ScheduleTypeRequestDto;
import org.springframework.beans.factory.annotation.Autowired;

import static com.wohaha.dodamdodam.domain.QScheduleType.scheduleType;

public class ScheduleTypeRepositoryImpl implements ScheduleTypeRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    @Override
    public Long deleteScheduleTypeById(Long scheduleTypeSeq) {
        return query
                .delete(scheduleType)
                .where(scheduleType.scheduleTypeSeq.eq(scheduleTypeSeq))
                .execute();
    }

    @Override
    public Long updateScheduleType(ScheduleTypeRequestDto scheduleTypeRequestDto) {
        return query
                .update(scheduleType)
                .set(scheduleType.name, scheduleTypeRequestDto.getContent())
                .where(scheduleType.scheduleTypeSeq.eq(scheduleTypeRequestDto.getScheduleTypeSeq()))
                .execute();
    }
}
