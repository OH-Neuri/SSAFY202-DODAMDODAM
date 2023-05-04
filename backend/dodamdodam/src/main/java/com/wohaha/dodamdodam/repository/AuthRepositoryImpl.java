package com.wohaha.dodamdodam.repository;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.domain.Auth;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;

import static com.wohaha.dodamdodam.domain.QAuth.auth;

public class AuthRepositoryImpl implements AuthRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

//    @Override
//    public Optional<Auth> findAuthByPhone(String phone) {
//        return Optional.ofNullable(
//            query
//                .selectFrom(auth)
//                .where(auth.phone.eq(phone))
//                .fetchOne()
//        );
//    }
}
