package com.wohaha.dodamdodam.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class ManageKidRepositoryImpl implements ManageKidRepositoryCustom{
    private final JPAQueryFactory queryFactory;

}
