package com.wohaha.dodamdodam.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public class MedicineRepositoryImpl implements MedicineRepositoryCustom{

    @Autowired
    private JPAQueryFactory query;


}
