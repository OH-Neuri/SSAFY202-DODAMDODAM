package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.FoodListResponseDto;
import com.wohaha.dodamdodam.dto.response.FoodResponseDto;
import com.wohaha.dodamdodam.dto.request.FoodRequestDto;

public interface ManageFoodService {
    String modifyFood(FoodRequestDto foodRequestDto);
    //원장쌤이 보는 웹용 하루 식단
    FoodResponseDto getFood(String year, String month, String day);
    //앱용 하루 식단
    FoodResponseDto getFoodForApp(long classSeq,String year, String month, String day);

    FoodListResponseDto getFoodList(String year, String month);
}
