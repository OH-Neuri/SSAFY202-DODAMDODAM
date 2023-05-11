package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.User;
import com.wohaha.dodamdodam.dto.request.LoginUserRequestDto;
import com.wohaha.dodamdodam.dto.request.RegisterUserRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateUserRequestDto;
import com.wohaha.dodamdodam.dto.response.RegisterUserResponseDto;

public interface UserService {

  RegisterUserResponseDto registerUser(RegisterUserRequestDto registerUserRequestDto);
  Object loginUser(LoginUserRequestDto loginUserRequestDto);
  User getUser(Long userSeq);
  boolean updateUser(UpdateUserRequestDto updateUserRequestDto, Long userSeq);
  boolean isExist(Long userSeq);
  Boolean checkIdDuplicate(String id);

}
