package com.wohaha.dodamdodam.repository;

import static com.wohaha.dodamdodam.domain.QFood.food;
import static com.wohaha.dodamdodam.domain.QKindergartenInfo.kindergartenInfo;

import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.domain.KindergartenInfo;
import com.wohaha.dodamdodam.dto.response.FoodResponseDto;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;

public class KindergartenInfoRepositoryImpl implements KindergartenInfoRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    public List<KindergartenInfo> searchByKeyword(String keyword) {
        return query.selectFrom(kindergartenInfo)
            .where(kindergartenInfo.name.like("%" + keyword + "%"))
            .fetch();
    }

}
