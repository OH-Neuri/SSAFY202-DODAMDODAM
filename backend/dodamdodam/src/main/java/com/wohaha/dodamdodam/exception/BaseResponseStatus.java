package com.wohaha.dodamdodam.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public enum BaseResponseStatus {

  //SUCCESS
  SUCCESS(HttpStatus.OK, 2000, "요청에 성공하였습니다."),

  //FAIL
  //임시생성 -> 추후 코드 정리 예정
  FAIL(HttpStatus.INTERNAL_SERVER_ERROR, 1999, "일단 실패했습니다??"),


  //인증관련 에러
  SIGNUP_REQUIRED(HttpStatus.OK, 4001, "회원가입이 필요한 유저입니다."),
  OAUTH_UNKOWN_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, 4002, "OAuth2 인증 과정에서 에러가 발생했습니다."),
  TOKEN_CLAIM_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, 4003, "Jwt Claim 추출에 실패했습니다."),
  TOKEN_ALLOCATE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, 4004, "Jwt 생성에 실패했습니다."),
  TOKEN_NULL_ERROR(HttpStatus.UNAUTHORIZED, 4005, "Jwt 토큰이 존재하지 않습니다."),
  TOKEN_EXPIRED(HttpStatus.UNAUTHORIZED, 4006, "Jwt 토큰 유효기간이 만료됐습니다."),
  SMS_AUTHENTICATION_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, 4007, "휴대폰 인증에 실패했습니다."),
  SMS_AUTHENTICATION_COUNT(HttpStatus.INTERNAL_SERVER_ERROR, 4008, "휴대폰 인증 횟수 초과입니다. 내일 이용해주세요"),
  ALREADY_SIGNED_UP(HttpStatus.INTERNAL_SERVER_ERROR, 4009, "이미 가입된 유저입니다."),
  UNREQUESTED_SMS_USER(HttpStatus.INTERNAL_SERVER_ERROR, 4010, "sms 인증을 요청하지 않은 유저의 접근입니다."),
  WRONG_CODE(HttpStatus.INTERNAL_SERVER_ERROR, 4011, "코드가 일치하지 않습니다."),
  SMS_UNAUTHENTICATION(HttpStatus.INTERNAL_SERVER_ERROR, 4012, "sms 인증을 먼저 진행해주세요."),
  WRONG_PASSWORD(HttpStatus.INTERNAL_SERVER_ERROR, 4013, "아이디와 비밀번호가 일치하지 않습니다."),
  // 파일 에러
  FILE_SAVE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, 4010, "파일 변환 및 로컬 저장 과정에서 에러가 발생했습니다."),
  FILE_UPLOAD_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, 4011, "파일 s3 서버 업로드 과정에서 에러가 발생했습니다."),
  FILE_DELETE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, 4012,"파일 로컬 삭제 과정에서 에러가 발생했습니다."),

  S3_CLIENT_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, 4013,"유효하지 않은 S3 클라이언트입니다."),


  FILE_CONVERT_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, 4009, "파일 변환에 실패했습니다."),
  FILE_FORMAT_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, 4008, "파일 포맷을 확인해주세요."),

  UNAUTHORIZED_USER(HttpStatus.UNAUTHORIZED, 4016, "토큰 인증 정보와 요청 내의 userSeq가 다릅니다."),

  //리뷰 에러
  REVIEW_DELETE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR,4017, "리뷰 삭제에 실패했습니다."),

  //ClassTeacher 관련
  ALREADY_REGISTERED_TEACHER(HttpStatus.INTERNAL_SERVER_ERROR, 4040, "이미 해당 반에 등록된 선생님입니다."),
  UNREGISTERED_TEACHER(HttpStatus.INTERNAL_SERVER_ERROR, 4041, "해당 반에 선생님이 등록되어있지 않습니다."),

  //User 관련
  UNREGISTERED_USER(HttpStatus.INTERNAL_SERVER_ERROR, 4050, "존재하지 않는 유저입니다."),

  //Kid 관련
  UNREGISTERED_KID(HttpStatus.INTERNAL_SERVER_ERROR, 4060, "존재하지 않는 아이입니다."),

  //Medicine 관련
  UNREGISTERED_MEDICINE(HttpStatus.INTERNAL_SERVER_ERROR, 4070, "존재하지 않는 투약의뢰서입니다."),

  // 어린이집 관련 에러
  UNREGISTERED_KINDERGARTEN(HttpStatus.INTERNAL_SERVER_ERROR, 4080, "어린이집을 등록하지 않은 유저입니다."),
  KINDERGARTEN_NULL_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, 4081, "해당 유저의 어린이집 정보를 찾을 수 없습니다."),
  UNREGISTERED_CLASS(HttpStatus.INTERNAL_SERVER_ERROR, 4082, "존재하지 않는 반입니다."),
  // 출석 관리
  ATTENDANCE_NULL_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, 4090, "해당 시퀀스의 등하원 정보가 없습니다."),
  ATTENDANCE_FORM_NULL_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, 4091, "해당 날짜의 등하원 정보가 없습니다."),
  // 일정 분류
  SCHEDULE_TYPE_NULL_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, 4100, "해당 시퀀스의 일정 분류가 없습니다."),
  SCHEDULE_TYPE_CREATE_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, 4101, "일정 분류 생성이 실패했습니다."),
  SCHEDULE_TYPE_DELETE_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, 4102, "일정 분류 삭제가 실패했습니다."),
  SCHEDULE_TYPE_UPDATE_FAIL(HttpStatus.INTERNAL_SERVER_ERROR, 4103, "일정 분류 수정이 실패했습니다."),
  // 식단 관리
  FOOD_NULL_FAIl(HttpStatus.INTERNAL_SERVER_ERROR, 4200, "해당 날의 식단이 없습니다.");



//  UNAUTHORIZED_USER(HttpStatus.INTERNAL_SERVER_ERROR, 4051, "권한이 없는 유저입니다.");
//
//  REQUEST_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "요청에 실패하였습니다."),
//  UNVALID_USER(HttpStatus.INTERNAL_SERVER_ERROR, "권한 없는 유저입니다."),
//
//
//  //401
//  OAUTH_REQUIRE(HttpStatus.CONFLICT, "소셜 인증이 이뤄지지 않은 유저입니다. 소셜 로그인을 선행해주세요."),
//  TOKEN_EXPIRED(HttpStatus.UNAUTHORIZED, "만료된 토큰입니다."),
//  UNVALID_TOKEN(HttpStatus.CONFLICT, "인증되지 않은 토큰입니다."),
//  ACCESS_TOKEN_NULL(HttpStatus.INTERNAL_SERVER_ERROR, "access token이 존재하지 않는 요청입니다."),
//  ACCESS_TOKEN_EXPIRED(HttpStatus.UNAUTHORIZED, "access token이 만료되었습니다. 재발급을 요청하세요."),
//  REFRESH_TOKEN_EXPIRED(HttpStatus.CONFLICT, "refresh token이 만료되었습니다. 다시 로그인해주세요."),
//  USER_POST_UNAUTHORIZED(HttpStatus.INTERNAL_SERVER_ERROR, "post 요청에 대해 권한이 없는 유저입니다."),
//  AUTHENTICATE_ERROR(HttpStatus.CONFLICT, "인증 과정에서 에러가 발생했습니다."),
//
//  DUPLICATE_LOGIN(HttpStatus.CONFLICT,"이미 로그인 중입니다."),
//  FILE_CONVERT_ERROR(HttpStatus.INTERNAL_SERVER_ERROR,"파일 저장에 실패했습니다."),
//
//  UNVALID_PARAMETER(HttpStatus.NOT_FOUND,"요청 파라미터를 확인해주세요."),
//
//
//  //500
//  //  1. db 관련 에러
//  DATABASE_GET_ERROR(HttpStatus.INTERNAL_SERVER_ERROR,"해당 객체를 찾을 수 없습니다. 식별자를 확인해주세요"),
//  DATABASE_UPDATE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "해당 객체를 업데이트할 수 없습니다. 속성값 이름, 값의 존재 유무, 식별자를 확인해주세요."),
//  DATABASE_INSERT_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "해당 객체를 데이터베이스에 생성할 수 없습니다."),
//  DATABASE_DELETE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "해당 객체를 데이터베이스에서 삭제할 수 없습니다."),
//
//  //  2. 토큰 관련 에러
//  TOKEN_ALLOCATE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "jwt 토큰 발급 중 에러가 발생했습니다. 유저 식별자와 권한을 확인해주세요."),
//  TOKEN_CLAIM_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "토큰에서 클레임을 추출할 수 없습니다."),
//  REFRESH_TOKEN_NOT_FOUND(HttpStatus.INTERNAL_SERVER_ERROR, "리프레시 토큰을 찾을 수 없습니다."),
//  TOKEN_UNKNOWN_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "jwt 토큰 인가 과정 중 알 수 없는 에러가 발생했습니다."),
//
//  //  3. 파일 관련 에러
//  FILE_DIRECTORY_MAKE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "디렉토리 생성 중 에러가 발생했습니다."),
//  FILE_SIZE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "파일의 크기가 비정상적입니다."),
//  FILE_FORMAT_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "지원하지 않는 파일 포맷입니다. jpg, png, jpeg인지 확인해주세요."),
//  FILE_SAVE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "파일 변환 및 로컬 저장 과정에서 에러가 발생했습니다."),
//  FILE_UPLOAD_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "파일 s3 서버 업로드 과정에서 에러가 발생했습니다."),
//  FILE_DELETE_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "파일 로컬 삭제 과정에서 에러가 발생했습니다."),
//
//  S3_CLIENT_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "유효하지 않은 S3 클라이언트입니다."),
//
//
//  // 핸들링되지 않은 에러
//  SERVICE_SERVLET_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "서비스단에서 에러가 발생했습니다."),
//
//  CONTROLLER_SERVLET_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "컨트롤러단에서 에러가 발생했습니다.");


  private final HttpStatus status;
  private final int code;
  private final String message;

  BaseResponseStatus(HttpStatus status, int code, String message) {
    this.status = status;
    this.code = code;
    this.message = message;
  }
}