package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.*;
import com.wohaha.dodamdodam.dto.response.ClassNameResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import com.wohaha.dodamdodam.service.SmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
  public BaseResponseDto<Boolean> checkUserSms(@RequestBody SmsCheckRequestDto smsCheckRequestDto) {
    try {
      boolean result = smsService.checkUserSms(smsCheckRequestDto);
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
  public BaseResponseDto<ClassNameResponseDto> checkTeacherSms(@RequestBody SmsCheckRequestDto smsCheckRequestDto) {
    try {
      Long userSeq = ((CustomAuthenticatedUser)SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
      ClassNameResponseDto classNameResponseDto = smsService.checkTeacherSms(smsCheckRequestDto, userSeq);
      return new BaseResponseDto<>(classNameResponseDto);
    } catch (Exception e) {
      e.printStackTrace();
      if (e instanceof BaseException) {
        throw e;
      } else {
        throw new BaseException(BaseResponseStatus.FAIL);
      }
    }
  }

  @PostMapping("/parent")
  public BaseResponseDto<Boolean> sendParentSms(@RequestBody SmsSendParentRequestDto smsSendParentRequestDto) {
    try {
      boolean result = smsService.sendParentSms(smsSendParentRequestDto);
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

  @PostMapping("/parent/check")
  public BaseResponseDto<Boolean> checkParentSms(@RequestBody SmsCheckRequestDto smsCheckRequestDto) {
    try {
      Long userSeq = ((CustomAuthenticatedUser)SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
      boolean result = smsService.checkParentSms(smsCheckRequestDto, userSeq);
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
