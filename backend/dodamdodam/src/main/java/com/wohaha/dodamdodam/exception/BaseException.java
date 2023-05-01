package com.wohaha.dodamdodam.exception;

import lombok.Getter;

@Getter
public class BaseException extends RuntimeException {
  private BaseResponseStatus status;
  private String message;

  public BaseException(BaseResponseStatus status, String message){
    this.status = status;
    this.message = message;
  }

  public BaseException(BaseResponseStatus status){
    this.status=status;
    this.message=status.getMessage();
  }

    @Override
    public String getMessage(){
        return String.format("%s. %s ", status.getMessage(),message);
    }

    public BaseResponseStatus getBaseResponseStatus(){
    return this.status;
    }
}

