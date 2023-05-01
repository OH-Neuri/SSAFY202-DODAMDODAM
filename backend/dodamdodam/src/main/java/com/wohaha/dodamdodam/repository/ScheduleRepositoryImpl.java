package com.wohaha.dodamdodam.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.response.ScheduleListResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ScheduleRepositoryImpl implements ScheduleRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    @Override
    public List<Integer> findScheduleDateList(String year, String month) {
        return null;
    }

    @Override
    public List<ScheduleListResponseDto> findScheduleListByDate(String year, String month, Integer date) {
        return null;
    }
}
