package com.wohaha.dodamdodam.dto.response.request;

import lombok.Getter;

@Getter
public class SendSmsRequestDto {
  private String phone;
  private Integer role;
}
