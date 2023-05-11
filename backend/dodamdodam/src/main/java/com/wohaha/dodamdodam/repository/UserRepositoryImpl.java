package com.wohaha.dodamdodam.repository;

import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;
import static com.wohaha.dodamdodam.domain.QClassTeacher.classTeacher;
import static com.wohaha.dodamdodam.domain.QUser.user;
import static com.wohaha.dodamdodam.domain.QKindergarten.kindergarten;

import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.domain.User;
import java.util.Optional;

import com.wohaha.dodamdodam.dto.request.UpdateUserRequestDto;
import com.wohaha.dodamdodam.dto.response.LoginParentResponseDto;
import com.wohaha.dodamdodam.dto.response.LoginTeacherResponseDto;
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
                .fetchOne()));
    }

    @Override
    public void updateUser(UpdateUserRequestDto updateUserRequestDto) {
        query
                .update(user)
                .set(user.name,updateUserRequestDto.getName())
                .set(user.id, updateUserRequestDto.getId())
                .set(user.password, updateUserRequestDto.getPassword())
                .set(user.phoneNumber, updateUserRequestDto.getPhone())
                .where(user.userSeq.eq(updateUserRequestDto.getUserSeq()))
                .execute();
    }

    @Override
    public Long findKindergartenSeq(Long userSeq) {
        return query
                .select(kindergarten.kindergartenSeq)
                .from(kindergarten)
                .where(kindergarten.userSeq.eq(userSeq))
                .fetchOne();
    }

    @Override
    public LoginTeacherResponseDto findClassInfoByUserSeq(Long userSeq) {

//        return query.select(Projections.fields(LoginTeacherResponseDto.class),
//                classTeacher.classSeq, );
        return null;
    }



    @Override
    public LoginParentResponseDto findKidInfoByUserSeq(Long userSeq) {
        return null;
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
