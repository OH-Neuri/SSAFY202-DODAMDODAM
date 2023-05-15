package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.AttendanceInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.KidInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.KidParentResponseDto;
import com.wohaha.dodamdodam.dto.response.KidResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;
import static com.wohaha.dodamdodam.domain.QKid.kid;
import static com.wohaha.dodamdodam.domain.QUser.user;

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
                query
                        .select(Projections.constructor(KidInfoResponseDto.class,
                                kid.kidSeq, kid.name, kid.photo, kid.classSeq, classInfo.name))
                        .from(kid).join(classInfo).on(kid.classSeq.eq(classInfo.classSeq))
                        .where(kid.kidSeq.eq(kidSeq))
                        .fetchOne()
        );
    }

    @Override
    public List<KidInfoResponseDto> findKidListByUserSeq(Long userSeq) {
        return query.select(Projections.constructor(KidInfoResponseDto.class,
                        kid.kidSeq, kid.name, kid.classSeq, classInfo.name))
                .from(kid).join(classInfo).on(kid.classSeq.eq(classInfo.classSeq))
                .where(kid.userSeq.eq(userSeq))
                .fetch();
    }

    @Override
    public List<KidParentResponseDto> getKidParentList(Long classSeq) {
        return query.select(Projections.constructor(KidParentResponseDto.class,
                        kid.name, kid.photo, kid.userSeq, user.name))
                .from(kid).join(user).on(kid.userSeq.eq(user.userSeq))
                .where(kid.classSeq.eq(classSeq))
                .fetch();
    }

    @Override
    public AttendanceInfoResponseDto getKidInfo(Long kidSeq) {
        return query.select(Projections.constructor(AttendanceInfoResponseDto.class,
                kid.name, kid.photo))
                .from(kid)
                .where(kid.kidSeq.eq(kidSeq))
                .fetchOne();
    }


}
