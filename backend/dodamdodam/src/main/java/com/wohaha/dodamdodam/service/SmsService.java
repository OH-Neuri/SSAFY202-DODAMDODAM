package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.*;
import com.wohaha.dodamdodam.dto.response.ClassNameResponseDto;

public interface SmsService {

  //휴대폰 인증
  boolean sendUserSms(SmsSendUserRequestDto smsSendUserRequestDto);

  boolean sendTeacherSms(SmsSendTeacherRequestDto smsSendTeacherRequestDto);

//  SingleMessageSentResponse sendOneMessage(String toNumber, String randomNumber);
//
  boolean checkUserSms(SmsCheckRequestDto smsCheckRequestDto);
  ClassNameResponseDto checkTeacherSms(SmsCheckRequestDto smsCheckRequestDto, Long userSeq);

  String generateRandomSixDigitCode();

  boolean isCheckedUser(String phone);
  void deleteCheckedUser(String phone);

  boolean sendParentSms(SmsSendParentRequestDto smsSendParentRequestDto);

  boolean checkParentSms(SmsCheckRequestDto smsCheckRequestDto, Long userSeq);

}
