package com.wohaha.dodamdodam.repository;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.wohaha.dodamdodam.domain.User;
import com.wohaha.dodamdodam.dto.request.UpdateUserRequestDto;
import com.wohaha.dodamdodam.dto.response.LoginParentResponseDto;
import com.wohaha.dodamdodam.dto.response.LoginTeacherResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

import static com.wohaha.dodamdodam.domain.QClassInfo.classInfo;
import static com.wohaha.dodamdodam.domain.QClassTeacher.classTeacher;
import static com.wohaha.dodamdodam.domain.QKid.kid;
import static com.wohaha.dodamdodam.domain.QKindergarten.kindergarten;
import static com.wohaha.dodamdodam.domain.QUser.user;

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
                .set(user.name, updateUserRequestDto.getName())
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
        Tuple tuple = query
                .select(classTeacher.classSeq, classInfo.name)
                .from(classTeacher).join(classInfo).on(classTeacher.classSeq.eq(classInfo.classSeq))
                .where(classTeacher.userSeq.eq(userSeq))
                .fetchFirst();
        if (tuple == null) return new LoginTeacherResponseDto();
        return new LoginTeacherResponseDto(tuple.get(classTeacher.classSeq), tuple.get(classInfo.name));
    }


    @Override
    public LoginParentResponseDto findKidInfoByUserSeq(Long userSeq) {
        Tuple tuple = query
                .select(kid.kidSeq, kid.name, kid.photo, kid.classSeq, classInfo.name)
                .from(kid).join(classInfo).on(kid.classSeq.eq(classInfo.classSeq))
                .where(kid.userSeq.eq(userSeq))
                .fetchFirst();
        if (tuple == null) return new LoginParentResponseDto();
        return new LoginParentResponseDto(tuple.get(kid.kidSeq), tuple.get(kid.name), tuple.get(kid.photo), tuple.get(kid.classSeq), tuple.get(classInfo.name));
    }

    @Override
    public int findUserIdCntByUserId(String id) {
        return query
                .selectFrom(user)
                .where(user.id.eq(id))
                .fetch().size();
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
