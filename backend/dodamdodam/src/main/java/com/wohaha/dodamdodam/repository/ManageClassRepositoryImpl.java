package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import static com.wohaha.dodamdodam.domain.QUser.user;
import static com.wohaha.dodamdodam.domain.QClassTeacher.classTeacher;
import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;

import java.util.List;

public class ManageClassRepositoryImpl implements ManageClassRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    public List<ClassListResponseDto> classList(long kindergartenSeq){
        return query
                .select(Projections.fields(ClassListResponseDto.class),
                        classInfo.classSeq,classInfo.)
    }



}
