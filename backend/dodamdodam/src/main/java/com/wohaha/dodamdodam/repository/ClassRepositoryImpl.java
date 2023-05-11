package com.wohaha.dodamdodam.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import org.jetbrains.annotations.Nullable;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;
public class ClassRepositoryImpl implements ClassRepositoryCustom {
    @Autowired
    JPAQueryFactory query;
    @Override
    public Optional<String> findNameById(Long classSeq) {
        return Optional.ofNullable(query
                .select(classInfo.name)
                .from(classInfo)
                .where(classInfo.classSeq.eq(classSeq))
                .fetchOne());
    }
}
