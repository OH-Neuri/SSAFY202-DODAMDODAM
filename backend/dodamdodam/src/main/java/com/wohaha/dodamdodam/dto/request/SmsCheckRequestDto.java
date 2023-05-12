package com.wohaha.dodamdodam.dto.request;

import lombok.Getter;

@Getter
public class SmsCheckRequestDto {
  private String phone;
  private String code;
}
