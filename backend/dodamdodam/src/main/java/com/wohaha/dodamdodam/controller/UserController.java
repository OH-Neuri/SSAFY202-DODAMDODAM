package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.LoginUserRequestDto;
import com.wohaha.dodamdodam.dto.request.RegisterUserRequestDto;
import com.wohaha.dodamdodam.dto.response.LoginUserResponseDto;
import com.wohaha.dodamdodam.dto.response.RegisterUserResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {

  @Autowired
  private UserService userService;

  @PostMapping("")
  public BaseResponseDto<RegisterUserResponseDto> registerUser(@RequestBody RegisterUserRequestDto registerUserRequestDto) {
    try {
      RegisterUserResponseDto result = userService.registerUser(registerUserRequestDto);
      return new BaseResponseDto<>(result);
    } catch (Exception e) {
      e.printStackTrace();
      if (e instanceof BaseException) {
        throw e;
      } else {
        throw new BaseException(BaseResponseStatus.FAIL);
      }
    }
  }

  @PostMapping("/login")
  public BaseResponseDto<LoginUserResponseDto> login(@RequestBody LoginUserRequestDto loginUserRequestDto) {
    try {
      LoginUserResponseDto result = userService.loginUser(loginUserRequestDto);
      return new BaseResponseDto<>(result);
    } catch (Exception e) {
      e.printStackTrace();
      if (e instanceof BaseException) {
        throw e;
      } else {
        throw new BaseException(BaseResponseStatus.FAIL);
      }
    }
  }

}
