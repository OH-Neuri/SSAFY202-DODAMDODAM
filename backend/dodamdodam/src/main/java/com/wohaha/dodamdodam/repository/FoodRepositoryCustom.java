package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.response.FoodResponseDto;

import java.util.Optional;

public interface FoodRepositoryCustom {
    Optional<FoodResponseDto> findFoodByKindergartenSeq(Long kindergartenSeq, Integer year, Integer month, Integer day);

}
