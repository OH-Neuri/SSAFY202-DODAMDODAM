package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.response.FoodListResponseDto;
import com.wohaha.dodamdodam.dto.response.response.FoodResponseDto;

public interface ManageFoodService {
    String modifyFood(String date);

    FoodResponseDto getFood(String year, String month, String day);

    FoodListResponseDto getFoodList(String year, String month);
}
