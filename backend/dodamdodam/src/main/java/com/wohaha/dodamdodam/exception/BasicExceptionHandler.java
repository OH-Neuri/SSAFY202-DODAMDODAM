package com.wohaha.dodamdodam.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@Slf4j
@ControllerAdvice
public class BasicExceptionHandler extends ResponseEntityExceptionHandler {

  @ExceptionHandler({BaseException.class})
  protected ResponseEntity handleCustomException(BaseException e) {
    log.error("Error occurs {}", e.toString());

    HttpHeaders resHeaders = new HttpHeaders();
    resHeaders.add("Content-Type", "application/json;charset=UTF-8");

    return new ResponseEntity(e.getStatus().getMessage(), resHeaders, e.getStatus().getStatus());
  }

  @ExceptionHandler({Exception.class})
  protected ResponseEntity handleServerException(Exception e) {
    log.error("Uncatched Error occurs {}", e.toString());

    HttpHeaders resHeaders = new HttpHeaders();
    resHeaders.add("Content-Type", "application/json;charset=UTF-8");

    return new ResponseEntity(e.getMessage(), resHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
  }

}
