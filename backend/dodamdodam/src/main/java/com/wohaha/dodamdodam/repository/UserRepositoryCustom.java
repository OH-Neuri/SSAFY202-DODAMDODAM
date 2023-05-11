package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.User;
import com.wohaha.dodamdodam.dto.request.UpdateUserRequestDto;

import java.util.Optional;

public interface UserRepositoryCustom {

  boolean isSignedUp(String phone, Integer role);

  Optional<User> findUserByIdAndRole(String id, Integer role);

  void updateUser(UpdateUserRequestDto updateUserRequestDto);

  Long findKindergartenSeq(Long userSeq);

}
