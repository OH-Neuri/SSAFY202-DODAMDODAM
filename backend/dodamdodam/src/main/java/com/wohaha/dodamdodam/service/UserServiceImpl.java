package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Auth;
import com.wohaha.dodamdodam.domain.JwtTokenInfo;
import com.wohaha.dodamdodam.domain.User;
import com.wohaha.dodamdodam.dto.response.request.LoginUserRequestDto;
import com.wohaha.dodamdodam.dto.response.request.RegisterUserRequestDto;
import com.wohaha.dodamdodam.dto.response.request.SendSmsRequestDto;
import com.wohaha.dodamdodam.dto.response.response.LoginUserResponseDto;
import com.wohaha.dodamdodam.dto.response.response.RegisterUserResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.AuthRepository;
import com.wohaha.dodamdodam.repository.UserRepository;
import com.wohaha.dodamdodam.util.EncodeUtils;
import com.wohaha.dodamdodam.util.JwtTokenUtils;
import javax.annotation.PostConstruct;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private AuthRepository authRepository;

  @Override
  public RegisterUserResponseDto registerUser(RegisterUserRequestDto registerUserRequestDto) {

    //1. 이미 해당 핸드폰번호와 권한으로 가입된 유저인지 체크
    if(userRepository.isSignedUp(registerUserRequestDto.getPhone(), registerUserRequestDto.getRole())){
     //이미 가입된 유저입니다.
      throw new BaseException(BaseResponseStatus.ALREADY_SIGNED_UP);
    }

    //2. 해당 유저의 휴대폰 인증이 완료됐는지 체크
    Auth auth = authRepository.findById(registerUserRequestDto.getPhone()).orElseThrow(()->{throw new BaseException(BaseResponseStatus.SMS_UNAUTHENTICATION);});
    if(!auth.getIsChecked()){
      //휴대폰 인증을 먼저 진행해주세요
      throw new BaseException(BaseResponseStatus.FAIL);
    }

    //가입시킨다.
    User user = User.builder()
        .name(registerUserRequestDto.getName())
        .phoneNumber(registerUserRequestDto.getPhone())
        .role(registerUserRequestDto.getRole())
        .id(registerUserRequestDto.getId())
        .password(EncodeUtils.encode(registerUserRequestDto.getPassword()))
        .build();

    userRepository.save(user);

    //토큰 발급
    JwtTokenInfo jwtTokenInfo = JwtTokenUtils.allocateToken(user.getUserSeq(), user.getRole());

    //휴대폰 인증 삭제
    authRepository.delete(auth);

    //return
    RegisterUserResponseDto result = RegisterUserResponseDto.builder()
        .id(user.getId())
        .name(user.getName())
        .role(user.getRole())
        .token(jwtTokenInfo.getAccessToken())
        .build();

    return result;
  }

  @Override
  public LoginUserResponseDto loginUser(LoginUserRequestDto loginUserRequestDto) {

    //아이디, 권한으로 유저 찾아오기
    User user = userRepository.find


    return null;
  }
}
