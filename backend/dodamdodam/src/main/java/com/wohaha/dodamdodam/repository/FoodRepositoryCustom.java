package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.request.FoodRequestDto;
import com.wohaha.dodamdodam.dto.response.response.FoodResponseDto;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface FoodRepositoryCustom {
    Optional<Long> findFoodSeq(Long kindergartenSeq, LocalDate date);
    Optional<FoodResponseDto> findFoodByKindergartenSeq(Long kindergartenSeq, Integer year, Integer month, Integer day);
    List<Integer> findFoodScheduleList(Long kindergarten, Integer year, Integer month);

    Long updateFood(Long foodSeq, FoodRequestDto foodRequestDto);
}
