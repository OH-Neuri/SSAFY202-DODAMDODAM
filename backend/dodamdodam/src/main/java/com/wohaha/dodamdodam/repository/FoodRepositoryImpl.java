package com.wohaha.dodamdodam.repository;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.dto.response.request.FoodRequestDto;
import com.wohaha.dodamdodam.dto.response.response.FoodResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static com.wohaha.dodamdodam.domain.QFood.food;

public class FoodRepositoryImpl implements FoodRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    @Override
    public Optional<Long> findFoodSeq(Long kindergartenSeq, LocalDate date) {
        return Optional.ofNullable(
                query
                        .select(food.foodSeq)
                        .from(food)
                        .where(food.kindergartenSeq.eq(kindergartenSeq)
                                .and(food.date.eq(date)))
                        .fetchOne()
        );
    }

    @Override
    public Optional<FoodResponseDto> findFoodByKindergartenSeq(Long kindergartenSeq, Integer year, Integer month, Integer day) {
        return Optional.ofNullable(
            query
                .select(
                        Projections.constructor(FoodResponseDto.class,
                                food.foodSeq, food.rice, food.soup,
                                food.dish1, food.dish2, food.dish3,
                                food.morningSnack1, food.morningSnack2,
                                food.afternoonSnack1, food.afternoonSnack2))
                .from(food)
                .where(food.kindergartenSeq.eq(kindergartenSeq)
                        .and(food.date.year().eq(year))
                        .and(food.date.month().eq(month))
                        .and(food.date.dayOfMonth().eq(day)))
                .fetchOne()
        );
    }

    @Override
    public List<Integer> findFoodScheduleList(Long kindergartenSeq, Integer year, Integer month) {
        return query
                .selectDistinct(food.date.dayOfMonth())
                .from(food)
                .where(food.kindergartenSeq.eq(kindergartenSeq)
                        .and(food.date.year().eq(year))
                        .and(food.date.month().eq(month)))
                .fetch();
    }

    @Override
    public Long updateFood(Long foodSeq, FoodRequestDto foodRequestDto) {
        return query
                .update(food)
                .set(food.rice, foodRequestDto.getRice())
                .set(food.soup, foodRequestDto.getSoup())
                .set(food.dish1, foodRequestDto.getDish1())
                .set(food.dish2, foodRequestDto.getDish2())
                .set(food.dish3, foodRequestDto.getDish3())
                .set(food.morningSnack1, foodRequestDto.getMorningSnack1())
                .set(food.morningSnack2, foodRequestDto.getMorningSnack2())
                .set(food.afternoonSnack1, foodRequestDto.getAfternoonSnack1())
                .set(food.afternoonSnack2, foodRequestDto.getAfternoonSnack2())
                .where(food.foodSeq.eq(foodSeq))
                .execute();
    }
}
