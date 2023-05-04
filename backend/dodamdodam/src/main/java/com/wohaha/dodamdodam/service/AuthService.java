package com.wohaha.dodamdodam.service;

import com.google.inject.spi.Message;
import com.wohaha.dodamdodam.dto.response.request.CheckSmsRequestDto;
import com.wohaha.dodamdodam.dto.response.request.SendSmsRequestDto;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

public interface AuthService {

  //휴대폰 인증
  boolean sendSms(SendSmsRequestDto sendSmsRequestDto);

  SingleMessageSentResponse sendOneMessage(String toNumber, String randomNumber);

  boolean checkSms(CheckSmsRequestDto checkSmsRequestDto);

  String generateRandomSixDigitCode();

  boolean isCheckedUser(String phone);

}
