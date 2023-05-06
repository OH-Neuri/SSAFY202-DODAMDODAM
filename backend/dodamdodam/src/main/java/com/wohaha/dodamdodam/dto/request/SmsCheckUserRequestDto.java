package com.wohaha.dodamdodam.dto.request;

import lombok.Getter;

@Getter
public class SmsCheckUserRequestDto {
  private String phone;
  private String code;
}
