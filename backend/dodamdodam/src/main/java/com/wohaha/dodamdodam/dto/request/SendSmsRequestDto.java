package com.wohaha.dodamdodam.dto.request;

import lombok.Getter;

@Getter
public class SendSmsRequestDto {
  private String phone;
  private Integer role;
}
