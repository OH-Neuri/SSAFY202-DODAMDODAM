package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.request.UpdateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassListResponseDto;
import com.wohaha.dodamdodam.dto.response.TeacherInfoResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import static com.wohaha.dodamdodam.domain.QUser.user;
import static com.wohaha.dodamdodam.domain.QClassTeacher.classTeacher;
import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;

import java.util.List;

public class ManageClassRepositoryImpl implements ManageClassRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    @Override
    public List<ClassListResponseDto> classInfoList(long kindergartenSeq){
        return query
                .select(Projections.fields(ClassListResponseDto.class,
                        classInfo.classSeq, classInfo.name.as("className"), classInfo.age))
                .from(classInfo)
                .where(classInfo.kindergartenSeq.eq(kindergartenSeq))
                .fetch();
    }

    @Override
    public List<TeacherInfoResponseDto> teacherInfo(long classSeq) {
        return query
                .select(Projections.fields(TeacherInfoResponseDto.class,
                        classTeacher.classTeacherSeq.as("classTeacherSeq"), user.name.as("teacherName")))
                .from(user)
                .join(classTeacher).on(classTeacher.userSeq.eq(user.userSeq))
                .where(classTeacher.classSeq.eq(classSeq))
                .fetch();
//
//        user.userSeq.in(
//                JPAExpressions.select(classTeacher.userSeq)
//                        .from(classTeacher)
//                        .where(classTeacher.classSeq.eq(classSeq))
    }

    @Override
    public void updateClass(UpdateClassRequestDto updateClassRequestDto) {
        query
            .update(classInfo)
            .set(classInfo.name,updateClassRequestDto.getName())
            .set(classInfo.age,updateClassRequestDto.getAge())
            .where(classInfo.classSeq.eq(updateClassRequestDto.getClassSeq()))
            .execute();

    }

    @Override
    public void deleteClass(long classSeq) {
         query
                 .delete(classInfo)
                 .where(classInfo.classSeq.eq(classSeq))
                 .execute();
    }


}

