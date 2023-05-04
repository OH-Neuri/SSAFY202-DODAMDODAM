package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Food;
import com.wohaha.dodamdodam.dto.request.FoodRequestDto;
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
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class ManageFoodServiceImpl implements ManageFoodService {
    private final KindergartenRepository kindergartenRepository;
    private final FoodRepository foodRepository;

    @Override
    public String modifyFood(FoodRequestDto foodRequestDto) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
        Optional<Long> foodSeq = foodRepository.findFoodSeq(kindergartenSeq, foodRequestDto.getDate());

        if (foodSeq.isPresent()) {
            // update
            if (foodRepository.updateFood(foodSeq.get(), foodRequestDto) > 0)
                return "UPDATE FOOD";
        } else {
            // create
            Food food = Food.builder()
                    .kindergartenSeq(kindergartenSeq)
                    .date(foodRequestDto.getDate())
                    .rice(foodRequestDto.getRice()).soup(foodRequestDto.getSoup())
                    .dish1(foodRequestDto.getDish1()).dish2(foodRequestDto.getDish2()).dish3(foodRequestDto.getDish3())
                    .morningSnack1(foodRequestDto.getMorningSnack1()).morningSnack2(foodRequestDto.getMorningSnack2())
                    .afternoonSnack1(foodRequestDto.getAfternoonSnack1()).afternoonSnack2(foodRequestDto.getAfternoonSnack2())
                    .build();
            System.out.println(food.toString());
            foodRepository.save(food);

            return "CREATE FOOD";
        }
        return "UPDATE NOTHING";
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
        for (Integer date : dateNumber) {
            food.put(date, foodRepository.findFoodByKindergartenSeq(kindergartenSeq, Integer.valueOf(year), Integer.valueOf(month), date)
                    .orElseThrow(() -> new BaseException(BaseResponseStatus.FOOD_NULL_FAIl)));
        }
        foodList.setFood(food);
        return foodList;
    }
}
