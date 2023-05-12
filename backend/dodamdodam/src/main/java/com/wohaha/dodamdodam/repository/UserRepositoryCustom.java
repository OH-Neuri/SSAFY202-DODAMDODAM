package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.User;
import com.wohaha.dodamdodam.dto.request.UpdateUserRequestDto;
import com.wohaha.dodamdodam.dto.response.LoginParentResponseDto;
import com.wohaha.dodamdodam.dto.response.LoginTeacherResponseDto;

import java.util.Optional;

public interface UserRepositoryCustom {

  boolean isSignedUp(String phone, Integer role);

  Optional<User> findUserByIdAndRole(String id, Integer role);

  void updateUser(UpdateUserRequestDto updateUserRequestDto);

  Long findKindergartenSeq(Long userSeq);

  // 선생님시퀀스로 반정보
  void findClassInfoByUserSeq(LoginTeacherResponseDto loginTeacherResponseDto, Long userSeq);

  // 부모시퀀스로 아이정보, 아이의반정보
  void findKidInfoByUserSeq(LoginParentResponseDto loginParentResponseDto, Long userSeq);

  int findUserIdCntByUserId(String id);

}
