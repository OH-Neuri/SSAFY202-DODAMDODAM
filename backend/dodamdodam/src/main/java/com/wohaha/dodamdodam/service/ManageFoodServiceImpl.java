package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.response.FoodResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.FoodRepository;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
