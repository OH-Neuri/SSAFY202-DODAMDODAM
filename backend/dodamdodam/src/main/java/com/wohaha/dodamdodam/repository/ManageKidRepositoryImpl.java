package com.wohaha.dodamdodam.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class ManageKidRepositoryImpl implements ManageKidRepositoryCustom{

    @Autowired
    private JPAQueryFactory query;

}
