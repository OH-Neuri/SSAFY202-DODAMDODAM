package com.wohaha.dodamdodam.repository;

import static com.wohaha.dodamdodam.domain.QUser.user;

import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.domain.User;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;

public class UserRepositoryImpl implements UserRepositoryCustom {
    @Autowired
    private JPAQueryFactory query;

    @Override
    public boolean isSignedUp(String phone, Integer role) {
        BooleanExpression predicate = user.phoneNumber.eq(phone)
            .and(user.role.eq(role));
        return query.selectOne()
            .from(user)
            .where(predicate)
            .fetchFirst() != null;
    }

    @Override
    public Optional<User> findUserByIdAndRole(String id, Integer role) {
        BooleanExpression predicate = user.id.eq(id)
            .and(user.role.eq(role));

        return Optional.ofNullable((
            query
                .selectFrom(user)
                .where(predicate)
                .fetchFirst() != null;
            
    }


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
