package com.wohaha.dodamdodam.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
@JsonPropertyOrder({"isSuccess", "code", "message", "result"})
public class BaseResponseDto<T> {
  @JsonProperty("isSuccess")
  private final Boolean isSuccess;
  private final int code;
  private final String message;
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private T result;

  //요청 성공
  public BaseResponseDto(T result) {
    this.isSuccess = true;
    this.code = BaseResponseStatus.SUCCESS.getCode();
    this.message = BaseResponseStatus.SUCCESS.getMessage();
    this.result = result;
  }

  //요청 실패
  public BaseResponseDto(BaseResponseStatus status) {
    this.isSuccess = false;
    this.message = status.getMessage();
    this.code = status.getCode();
  }
}