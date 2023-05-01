package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Kindergarten;

import java.util.Optional;

public interface KindergartenRepositoryCustom {
    Optional<Long> findKindergartenSeqByUserSeq(Long userSeq);

}
