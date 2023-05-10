package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.KidResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import static com.wohaha.dodamdodam.domain.QKid.kid;
import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;


import java.util.List;

public class ManageKidRepositoryImpl implements ManageKidRepositoryCustom{

    @Autowired
    private JPAQueryFactory query;

    @Override
    public List<KidResponseDto> kidList() {

        return query
                .select(Projections.fields(KidResponseDto.class,
                        kid.kidSeq, kid.name.as("kidName"),
                        kid.birth,
                        kid.photo, kid.gender, kid.classSeq,
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
                .set(kid.name,updateKidRequestDto.getKidName())
                .set(kid.birth,updateKidRequestDto.getBirth())
                .set(kid.gender,updateKidRequestDto.getGender())
                .set(kid.classSeq,updateKidRequestDto.getClassSeq())
                .where(kid.kidSeq.eq(updateKidRequestDto.getKidSeq()))
                .execute();

    }


    @Override
    public void updateKidWithPhoto(UpdateKidRequestDto updateKidRequestDto, String uploadUrl) {
        query
                .update(kid)
                .set(kid.name,updateKidRequestDto.getKidName())
                .set(kid.birth,updateKidRequestDto.getBirth())
                .set(kid.photo, uploadUrl)
                .set(kid.gender,updateKidRequestDto.getGender())
                .set(kid.classSeq,updateKidRequestDto.getClassSeq())
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
}
