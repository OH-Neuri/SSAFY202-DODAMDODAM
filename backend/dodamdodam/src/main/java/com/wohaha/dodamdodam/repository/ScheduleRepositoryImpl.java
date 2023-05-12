package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.ClassScheduleResponseDto;
import com.wohaha.dodamdodam.dto.response.ScheduleResponseDto;
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
    public List<ScheduleResponseDto> findScheduleListByKindergartenSeq(Long kindergartenSeq, Integer year, Integer month, Integer day) {
        return query
                .select(
                        Projections.constructor(ScheduleResponseDto.class,
                                schedule.scheduleSeq, schedule.content, scheduleType.name))
                .from(schedule)
                .join(schedule.scheduleType, scheduleType)
                .where(schedule.kindergartenSeq.eq(kindergartenSeq)
                        .and(schedule.classSeq.isNull())
                        .and(schedule.date.year().eq(year))
                        .and(schedule.date.month().eq(month))
                        .and(schedule.date.dayOfMonth().eq(day)))
                .fetch();
    }

    @Override
    public Long deleteScheduleById(Long scheduleSeq) {
        return query
                .delete(schedule)
                .where(schedule.scheduleSeq.eq(scheduleSeq))
                .execute();
    }

    @Override
    public List<Integer> findScheduleDateList(Long kindergartenSeq, Long classSeq, String year, String month) {
        return query
                .selectDistinct(schedule.date.dayOfMonth())
                .from(schedule)
                .where(schedule.classSeq.eq(classSeq)
                        .or(schedule.kindergartenSeq.eq(kindergartenSeq))
                        .and(schedule.date.month().eq(Integer.valueOf(month)))
                        .and(schedule.date.year().eq(Integer.valueOf(year))))
                .fetch();
    }

    @Override
    public List<ClassScheduleResponseDto> findClassScheduleByClassSeq(Long kindergartenSeq, Long classSeq, Integer year, Integer month, Integer day) {
        return query
                .select(
                        Projections.constructor(ClassScheduleResponseDto.class,
                                schedule.scheduleSeq, schedule.content, scheduleType.name, schedule.classSeq))
                .from(schedule)
                .join(schedule.scheduleType, scheduleType)
                .where(schedule.classSeq.eq(classSeq)
                        .or(schedule.kindergartenSeq.eq(kindergartenSeq))
                        .and(schedule.date.year().eq(year))
                        .and(schedule.date.month().eq(month))
                        .and(schedule.date.dayOfMonth().eq(day)))
                .orderBy(schedule.classSeq.asc())
                .fetch();
    }
}