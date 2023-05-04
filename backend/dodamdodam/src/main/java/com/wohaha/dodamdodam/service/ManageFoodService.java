package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.FoodListResponseDto;
import com.wohaha.dodamdodam.dto.response.FoodResponseDto;
import com.wohaha.dodamdodam.dto.request.FoodRequestDto;

public interface ManageFoodService {
    String modifyFood(FoodRequestDto foodRequestDto);

    FoodResponseDto getFood(String year, String month, String day);

    FoodListResponseDto getFoodList(String year, String month);
}
