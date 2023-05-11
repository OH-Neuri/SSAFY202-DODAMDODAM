package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.domain.QClassTeacher;
import com.wohaha.dodamdodam.dto.request.FoodRequestDto;
import com.wohaha.dodamdodam.dto.response.FoodResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import static com.wohaha.dodamdodam.domain.QFood.food;
import static com.wohaha.dodamdodam.domain.QUser.user;
import static com.wohaha.dodamdodam.domain.QClassTeacher.classTeacher;

public class ClassTeacherRepositoryImpl implements ClassTeacherRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;


    @Override
    public boolean isExist(Long classSeq, Long userSeq) {
        BooleanExpression predicate = classTeacher.classSeq.eq(classSeq)
                .and(classTeacher.userSeq.eq(userSeq));

        return query.selectOne()
                .from(classTeacher)
                .where(predicate)
                .fetchFirst() != null;
    }

    @Override
    public void deleteClassTeacher(Long classTeacherSeq) {
        query.delete(classTeacher)
                .where(classTeacher.classTeacherSeq.eq(classTeacherSeq))
                .execute();

    }

}
