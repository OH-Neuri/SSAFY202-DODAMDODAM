package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.LoginUserRequestDto;
import com.wohaha.dodamdodam.dto.request.RegisterUserRequestDto;
import com.wohaha.dodamdodam.dto.response.LoginUserResponseDto;
import com.wohaha.dodamdodam.dto.response.RegisterUserResponseDto;

public interface UserService {

  RegisterUserResponseDto registerUser(RegisterUserRequestDto registerUserRequestDto);
  LoginUserResponseDto loginUser(LoginUserRequestDto loginUserRequestDto);

}
