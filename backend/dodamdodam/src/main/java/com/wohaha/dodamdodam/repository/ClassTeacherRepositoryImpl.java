package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.ClassInfoResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;
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

    @Override
    public List<ClassInfoResponseDto> findClassListByUserSeq(Long userSeq) {
        return query
                .select(Projections.constructor(ClassInfoResponseDto.class,
                        classTeacher.classSeq, classInfo.name))
                .from(classTeacher)
                .join(classInfo).on(classTeacher.classSeq.eq(classInfo.classSeq))
                .where(classTeacher.userSeq.eq(userSeq))
                .fetch();
    }

}
