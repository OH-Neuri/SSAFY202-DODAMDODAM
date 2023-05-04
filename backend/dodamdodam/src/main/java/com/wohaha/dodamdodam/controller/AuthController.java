package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.CheckSmsRequestDto;
import com.wohaha.dodamdodam.dto.request.SendSmsRequestDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
public class AuthController {

  @Autowired
  private AuthService authService;

  @PostMapping("/sms")
  public BaseResponseDto<Boolean> postSms(@RequestBody SendSmsRequestDto sendSmsRequestDto) {
    try {
      boolean result = authService.sendSms(sendSmsRequestDto);
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

  @PostMapping("/check")
  public BaseResponseDto<Boolean> checkSms(@RequestBody CheckSmsRequestDto checkSmsRequestDto) {
    try {
      boolean result = authService.checkSms(checkSmsRequestDto);
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
