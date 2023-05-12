package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.TeacherInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.TeacherInfoWithClassResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.wohaha.dodamdodam.domain.QClassTeacher.classTeacher;
import static com.wohaha.dodamdodam.domain.QUser.user;
import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;
import static com.wohaha.dodamdodam.domain.QKid.kid;

public class ManageTeacherRepositoryImpl implements ManageTeacherRepositoryCustom{
    @Autowired
    private JPAQueryFactory query;

    @Override
    public List<TeacherInfoWithClassResponseDto> teacherList(Long kindergartenSeq) {

        return query
                .select(Projections.fields(TeacherInfoWithClassResponseDto.class,
                        classTeacher.userSeq.as("teacherSeq"),
                        classInfo.name.as("className"),
                        user.name.as("teacherName")))
                .from(classTeacher)
                .join(classInfo).on(classTeacher.classSeq.eq(classInfo.classSeq).and(classInfo.kindergartenSeq.eq(kindergartenSeq)))
                .join(user).on(classTeacher.userSeq.eq(user.userSeq))
                .fetch();
    }

    @Override
    public List<TeacherInfoResponseDto> getTeacherList(Long kidSeq) {
        return query.select(Projections.constructor(TeacherInfoResponseDto.class,
                classTeacher.userSeq, user.name))
                .from(classTeacher)
                .join(user).on(classTeacher.userSeq.eq(user.userSeq))
                .join(kid).on(classTeacher.classSeq.eq(kid.classSeq))
                .where(kid.kidSeq.eq(kidSeq))
                .fetch();
    }

}
