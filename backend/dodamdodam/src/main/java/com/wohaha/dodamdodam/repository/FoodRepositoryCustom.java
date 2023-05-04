package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.FoodResponseDto;

import java.util.List;
import java.util.Optional;

public interface FoodRepositoryCustom {
    Optional<FoodResponseDto> findFoodByKindergartenSeq(Long kindergartenSeq, Integer year, Integer month, Integer day);
    List<Integer> findFoodScheduleList(Long kindergarten, Integer year, Integer month);
}
