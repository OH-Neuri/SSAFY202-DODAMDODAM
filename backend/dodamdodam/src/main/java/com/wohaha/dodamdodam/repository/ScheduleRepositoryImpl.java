package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.wohaha.dodamdodam.domain.QSchedule.schedule;
import static com.wohaha.dodamdodam.domain.QScheduleType.scheduleType;

public class ScheduleRepositoryImpl implements ScheduleRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    @Override
    public List<Integer> findScheduleDateList(Long kindergartenSeq, String year, String month) {
        return query
                .selectDistinct(schedule.date.dayOfMonth())
                .from(schedule)
                .where(schedule.kindergartenSeq.eq(kindergartenSeq)
                        .and(schedule.date.month().eq(Integer.valueOf(month)))
                        .and(schedule.date.year().eq(Integer.valueOf(year))))
                .fetch();
    }

    @Override
    public List<ScheduleResponseDto> findScheduleListByDate(Long kindergartenSeq, String year, String month, Integer date) {
        return query
                .select(
                        Projections.constructor(ScheduleResponseDto.class,
                                schedule.scheduleSeq, schedule.content, scheduleType.name))
                .from(schedule)
                .join(schedule.scheduleType, scheduleType)
                .where(schedule.kindergartenSeq.eq(kindergartenSeq)
                        .and(schedule.date.year().eq(Integer.valueOf(year)))
                        .and(schedule.date.month().eq(Integer.valueOf(month)))
                        .and(schedule.date.dayOfMonth().eq(date)))
                .fetch();
    }

    @Override
    public Long deleteScheduleById(Long scheduleSeq) {
        return query
                .delete(schedule)
                .where(schedule.scheduleSeq.eq(scheduleSeq))
                .execute();
    }
}