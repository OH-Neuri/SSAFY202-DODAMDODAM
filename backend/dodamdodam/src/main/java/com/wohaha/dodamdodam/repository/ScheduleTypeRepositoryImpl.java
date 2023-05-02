package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Expression;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.request.ScheduleTypeRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleTypeResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.wohaha.dodamdodam.domain.QScheduleType.scheduleType;

public class ScheduleTypeRepositoryImpl implements ScheduleTypeRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;
    @Override
    public List<ScheduleTypeResponseDto> findScheduleTypeByKindergartenSeq(Long kindergartenSeq) {
        return query
                .select(
                        Projections.constructor(ScheduleTypeResponseDto.class,
                                scheduleType.scheduleTypeSeq, scheduleType.name))
                .from(scheduleType)
                .where(scheduleType.kindergartenSeq.eq(kindergartenSeq)
                        .and(scheduleType.isValid.eq(true)))
                .fetch();
    }

    @Override
    public Long deleteScheduleTypeById(Long scheduleTypeSeq) {
        return query
                .update(scheduleType)
                .set(scheduleType.isValid, false)
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
