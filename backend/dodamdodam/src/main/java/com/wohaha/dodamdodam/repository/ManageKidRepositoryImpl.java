package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.KidInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.KidResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;
import static com.wohaha.dodamdodam.domain.QKid.kid;

public class ManageKidRepositoryImpl implements ManageKidRepositoryCustom {

    @Autowired
    private JPAQueryFactory query;

    @Override
    public List<KidResponseDto> kidList() {

        return query
                .select(Projections.fields(KidResponseDto.class,
                        kid.kidSeq, kid.name.as("kidName"),
                        kid.birth,
                        kid.photo, kid.gender, kid.classSeq,
                        Expressions.cases()
                                .when(kid.userSeq.isNull())
                                .then(0L)
                                .otherwise(kid.userSeq)
                                .as("parentSeq"),
                        classInfo.name.as("className")))
                .from(kid)
                .join(classInfo)
                .on(kid.classSeq.eq(classInfo.classSeq))
                .fetch();

    }

    @Override
    public KidResponseDto kidInfo(long kidSeq) {
        return query
                .select(Projections.fields(KidResponseDto.class,
                        kid.kidSeq, kid.name.as("kidName"),
                        kid.birth,
                        kid.photo, kid.gender, kid.classSeq,
                        Expressions.cases()
                                .when(kid.userSeq.isNull())
                                .then(0L)
                                .otherwise(kid.userSeq)
                                .as("parentSeq"),
                        classInfo.name.as("className")))
                .from(kid)
                .join(classInfo)
                .on(kid.classSeq.eq(classInfo.classSeq))
                .where(kid.kidSeq.eq(kidSeq))
                .fetchOne();
    }

    @Override
    public void updateKidNotPhoto(UpdateKidRequestDto updateKidRequestDto) {
        query
                .update(kid)
                .set(kid.name, updateKidRequestDto.getKidName())
                .set(kid.birth, updateKidRequestDto.getBirth())
                .set(kid.gender, updateKidRequestDto.getGender())
                .set(kid.classSeq, updateKidRequestDto.getClassSeq())
                .where(kid.kidSeq.eq(updateKidRequestDto.getKidSeq()))
                .execute();

    }


    @Override
    public void updateKidWithPhoto(UpdateKidRequestDto updateKidRequestDto, String uploadUrl) {
        query
                .update(kid)
                .set(kid.name, updateKidRequestDto.getKidName())
                .set(kid.birth, updateKidRequestDto.getBirth())
                .set(kid.photo, uploadUrl)
                .set(kid.gender, updateKidRequestDto.getGender())
                .set(kid.classSeq, updateKidRequestDto.getClassSeq())
                .where(kid.kidSeq.eq(updateKidRequestDto.getKidSeq()))
                .execute();
    }

    @Override
    public void deleteKid(long kidSeq) {
        query
                .delete(kid)
                .where(kid.kidSeq.eq(kidSeq))
                .execute();

    }

    @Override
    public Optional<KidInfoResponseDto> findKidInfoByKidSeq(Long kidSeq) {
        return Optional.ofNullable(
                query.select(Projections.constructor(KidInfoResponseDto.class,
                        kid.kidSeq, kid.name, kid.classSeq, classInfo.name))
                        .from(kid).join(classInfo).on(kid.classSeq.eq(classInfo.classSeq))
                        .where(kid.kidSeq.eq(kidSeq))
                        .fetchOne()
        );
    }
}
