package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Kindergarten;
import com.wohaha.dodamdodam.dto.request.KindergartenReqeustDto;

import java.util.Optional;

public interface KindergartenRepositoryCustom {
    Optional<Long> findKindergartenSeqByUserSeq(Long userSeq);
    //clasSeq로 어린이집 정보 찾기
    Optional<Long> findKindergartenSeqByClassSeq(Long classSeq);

    Long updateKindergarten(Long kindergartenSeq, KindergartenReqeustDto kindergartenReqeustDto);
}
