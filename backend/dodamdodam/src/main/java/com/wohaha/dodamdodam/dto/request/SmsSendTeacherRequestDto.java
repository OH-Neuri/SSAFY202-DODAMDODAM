package com.wohaha.dodamdodam.dto.request;

import lombok.Getter;

@Getter
public class SmsSendTeacherRequestDto {
  private String phone;
  private Long classSeq;
  private String className;
}
