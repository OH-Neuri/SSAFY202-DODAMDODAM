package com.wohaha.dodamdodam.dto.request;

import lombok.Getter;

@Getter
public class SmsSendParentRequestDto {
  private String phone;
  private Long kidSeq;
}
