package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.SmsCheckTeacherRequestDto;
import com.wohaha.dodamdodam.dto.request.SmsCheckUserRequestDto;
import com.wohaha.dodamdodam.dto.request.SmsSendTeacherRequestDto;
import com.wohaha.dodamdodam.dto.request.SmsSendUserRequestDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import com.wohaha.dodamdodam.service.SmsService;
import com.wohaha.dodamdodam.util.JwtTokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.net.http.HttpRequest;

@RestController
@RequestMapping("/sms")
public class SmsController {

  @Autowired
  private SmsService smsService;

  @PostMapping("/user")
  public BaseResponseDto<Boolean> sendUserSms(@RequestBody SmsSendUserRequestDto smsSendUserRequestDto) {
    try {
      boolean result = smsService.sendUserSms(smsSendUserRequestDto);
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

  @PostMapping("/user/check")
  public BaseResponseDto<Boolean> checkUserSms(@RequestBody SmsCheckUserRequestDto smsCheckUserRequestDto) {
    try {
      boolean result = smsService.checkUserSms(smsCheckUserRequestDto);
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

  @PostMapping("/teacher")
  public BaseResponseDto<Boolean> sendTeacherSms(@RequestBody SmsSendTeacherRequestDto smsSendTeacherRequestDto) {
    try {
      boolean result = smsService.sendTeacherSms(smsSendTeacherRequestDto);
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

  @PostMapping("/teacher/check")
  public BaseResponseDto<Boolean> checkTeacherSms(@RequestBody SmsCheckTeacherRequestDto smsCheckTeacherRequestDto) {
    try {
      Long userSeq = ((CustomAuthenticatedUser)SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
      boolean result = smsService.checkTeacherSms(smsCheckTeacherRequestDto, userSeq);
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
