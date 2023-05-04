package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.FoodListResponseDto;
import com.wohaha.dodamdodam.dto.response.FoodResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.FoodRepository;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class ManageFoodServiceImpl implements ManageFoodService {
    private final KindergartenRepository kindergartenRepository;
    private final FoodRepository foodRepository;

    @Override
    public String modifyFood(String date) {
        return null;
    }

    @Override
    public FoodResponseDto getFood(String year, String month, String day) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
        return foodRepository.findFoodByKindergartenSeq(kindergartenSeq,
                Integer.valueOf(year), Integer.valueOf(month), Integer.valueOf(day))
                .orElseThrow(() -> new BaseException(BaseResponseStatus.FOOD_NULL_FAIl));
    }

    @Override
    public FoodListResponseDto getFoodList(String year, String month) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
        FoodListResponseDto foodList = new FoodListResponseDto(year, month);
        // 식단 있는 날짜 가져옴
        List<Integer> dateNumber = foodRepository.findFoodScheduleList(kindergartenSeq, Integer.valueOf(year), Integer.valueOf(month));
        foodList.setDateNumber(dateNumber);
        // 식단 있는 날의 식단 가져옴
        Map<Integer, FoodResponseDto> food = new HashMap<>();
        for(Integer date : dateNumber) {
            food.put(date, foodRepository.findFoodByKindergartenSeq(kindergartenSeq, Integer.valueOf(year), Integer.valueOf(month), date)
                    .orElseThrow(() -> new BaseException(BaseResponseStatus.FOOD_NULL_FAIl)));
        }
        foodList.setFood(food);
        return foodList;
    }
}
