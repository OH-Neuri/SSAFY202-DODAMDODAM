package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Kindergarten;
import com.wohaha.dodamdodam.dto.request.KindergartenReqeustDto;

import java.util.Optional;

public interface KindergartenRepositoryCustom {
    Optional<Long> findKindergartenSeqByUserSeq(Long userSeq);

    Long updateKindergarten(Long kindergartenSeq, KindergartenReqeustDto kindergartenReqeustDto);
}
