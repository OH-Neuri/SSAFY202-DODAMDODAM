package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.LoginUserRequestDto;
import com.wohaha.dodamdodam.dto.response.request.RegisterUserRequestDto;
import com.wohaha.dodamdodam.dto.response.response.LoginUserResponseDto;
import com.wohaha.dodamdodam.dto.response.response.RegisterUserResponseDto;

public interface UserService {

  RegisterUserResponseDto registerUser(RegisterUserRequestDto registerUserRequestDto);
  LoginUserResponseDto loginUser(LoginUserRequestDto loginUserRequestDto);

}
