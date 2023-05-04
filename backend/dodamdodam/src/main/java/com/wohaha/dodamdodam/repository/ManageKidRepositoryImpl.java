package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KidListResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import static com.wohaha.dodamdodam.domain.QKid.kid;
import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;


import java.util.List;

public class ManageKidRepositoryImpl implements ManageKidRepositoryCustom{

    @Autowired
    private JPAQueryFactory query;

    @Override
    public List<KidListResponseDto> kidList() {

        return query
                .select(Projections.fields(KidListResponseDto.class,
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
    public void updateKidWithPhoto(UpdateKidRequestDto updateKidRequestDto) {
        query
                .update(kid)
                .set(kid.name,updateKidRequestDto.getKidName())
                .set(kid.birth,updateKidRequestDto.getBirth())
                .set(kid.photo, updateKidRequestDto.getPhoto())
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
