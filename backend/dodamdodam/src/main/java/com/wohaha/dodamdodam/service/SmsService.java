package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.SmsCheckTeacherRequestDto;
import com.wohaha.dodamdodam.dto.request.SmsCheckUserRequestDto;
import com.wohaha.dodamdodam.dto.request.SmsSendTeacherRequestDto;
import com.wohaha.dodamdodam.dto.request.SmsSendUserRequestDto;

public interface SmsService {

  //휴대폰 인증
  boolean sendUserSms(SmsSendUserRequestDto smsSendUserRequestDto);

  boolean sendTeacherSms(SmsSendTeacherRequestDto smsSendTeacherRequestDto);

//  SingleMessageSentResponse sendOneMessage(String toNumber, String randomNumber);
//
  boolean checkUserSms(SmsCheckUserRequestDto smsCheckUserRequestDto);
  boolean checkTeacherSms(SmsCheckTeacherRequestDto checkTeacherSms, Long userSeq);

  String generateRandomSixDigitCode();

  boolean isCheckedUser(String phone);
  void deleteCheckedUser(String phone);

}
