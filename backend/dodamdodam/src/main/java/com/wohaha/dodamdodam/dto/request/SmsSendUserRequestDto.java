package com.wohaha.dodamdodam.dto.request;

import lombok.Getter;

@Getter
public class SmsSendUserRequestDto {
  private String phone;
  private Integer role;
}
