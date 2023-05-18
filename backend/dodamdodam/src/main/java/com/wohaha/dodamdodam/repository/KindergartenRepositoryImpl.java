package com.wohaha.dodamdodam.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.request.KindergartenReqeustDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

import static com.wohaha.dodamdodam.domain.QKindergarten.kindergarten;
import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;

public class KindergartenRepositoryImpl implements KindergartenRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    @Override
    public Optional<Long> findKindergartenSeqByUserSeq(Long userSeq) {

        return Optional.ofNullable(
            query
                    .select(kindergarten.kindergartenSeq)
                    .from(kindergarten)
                    .where(kindergarten.userSeq.eq(userSeq))
                    .fetchOne()
        );
    }

    @Override
    public Optional<Long> findKindergartenSeqByClassSeq(Long classSeq) {
        return Optional.ofNullable(
                query
                        .select(classInfo.kindergartenSeq)
                        .from(classInfo)
                        .where(classInfo.classSeq.eq(classSeq))
                        .fetchOne()
        );
    }

    @Override
    public Long updateKindergarten(Long kindergartenSeq, KindergartenReqeustDto kindergartenReqeustDto) {
        return query.update(kindergarten)
                .set(kindergarten.name, kindergartenReqeustDto.getName())
                .set(kindergarten.address, kindergartenReqeustDto.getAddress())
                .where(kindergarten.kindergartenSeq.eq(kindergartenSeq))
                .execute();
    }

}
