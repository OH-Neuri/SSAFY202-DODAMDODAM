package com.wohaha.dodamdodam.dto.response.request;

import lombok.Getter;

@Getter
public class CheckSmsRequestDto {
  private String phone;
  private String code;
}
