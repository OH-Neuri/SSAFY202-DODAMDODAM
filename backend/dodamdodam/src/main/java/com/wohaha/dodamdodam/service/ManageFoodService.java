package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.FoodRequestDto;
import com.wohaha.dodamdodam.dto.response.response.FoodListResponseDto;
import com.wohaha.dodamdodam.dto.response.response.FoodResponseDto;

public interface ManageFoodService {
    String modifyFood(FoodRequestDto foodRequestDto);

    FoodResponseDto getFood(String year, String month, String day);

    FoodListResponseDto getFoodList(String year, String month);
}
