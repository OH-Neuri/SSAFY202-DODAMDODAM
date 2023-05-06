package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.AuthCode;
import com.wohaha.dodamdodam.domain.AuthTeacher;
import com.wohaha.dodamdodam.domain.AuthUser;
import com.wohaha.dodamdodam.dto.request.SmsCheckTeacherRequestDto;
import com.wohaha.dodamdodam.dto.request.SmsCheckUserRequestDto;
import com.wohaha.dodamdodam.dto.request.SmsSendTeacherRequestDto;
import com.wohaha.dodamdodam.dto.request.SmsSendUserRequestDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.AuthTeacherRepository;
import com.wohaha.dodamdodam.repository.AuthUserRepository;
import com.wohaha.dodamdodam.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.wohaha.dodamdodam.exception.BaseResponseStatus.UNREQUESTED_SMS_USER;
import static com.wohaha.dodamdodam.exception.BaseResponseStatus.WRONG_CODE;

@Service
@Transactional
public class SmsServiceImpl implements SmsService {

  @Autowired
  private MessageService messageService;

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private AuthUserRepository authUserRepository;

  @Autowired
  private AuthTeacherRepository authTeacherRepository;

  @Autowired
  private ManageClassService manageClassService;


  //유저 회원가입 시 메세지 인증
  @Override
  public boolean sendUserSms(SmsSendUserRequestDto smsSendUserRequestDto) {

    Optional<AuthUser> optAuthUser = authUserRepository.findById(smsSendUserRequestDto.getPhone());

    AuthUser authUser;

    //0. 이미 회원가입한 유저인지 확인하기
    if(userRepository.isSignedUp(smsSendUserRequestDto.getPhone(), smsSendUserRequestDto.getRole())){
      throw new BaseException(BaseResponseStatus.ALREADY_SIGNED_UP);
    }

    //1. 기존에 해당 휴대폰번호로 인증한 적이 없다면
    if(!optAuthUser.isPresent()){
      //새로운 auth 객체 생성
      authUser = AuthUser.builder()
              .phone(smsSendUserRequestDto.getPhone())
              .code(generateRandomSixDigitCode())
              .certified(false)
              .requestCnt(0)
              .build();

    }
    //이미 인증 보냈던 유저라면
    else{
      authUser = optAuthUser.get();

      //오늘 인증횟수가 10회면
      if(authUser.getRequestCnt()==10){
        throw new BaseException(BaseResponseStatus.SMS_AUTHENTICATION_COUNT);
      }

      //만약 이미 인증됐던 유저가 한번 더 인증을 요청한 경우
      authUser.setCertified(false);
      authUser.setCode(generateRandomSixDigitCode());
    }

    //메세지 send
    messageService.sendMessage(authUser.getPhone(), authUser.getCode(), "회원가입 ");

    authUser.setRequestCnt(authUser.getRequestCnt()+1);
    authUser.setProvidedAt(LocalDateTime.now());
    authUser.setCertified(true);

    authUserRepository.save(authUser);

    return true;
  }

  @Override
  public boolean sendTeacherSms(SmsSendTeacherRequestDto smsSendTeacherRequestDto) {

    AuthTeacher authTeacher = authTeacherRepository.findById(smsSendTeacherRequestDto.getPhone())
            .orElse(new AuthTeacher());

    String code = generateRandomSixDigitCode();
    if(authTeacher.getCodeMap()==null){
      authTeacher.setCodeMap(new HashMap<>());
    }

    authTeacher.getCodeMap().put(code,
            AuthCode.builder().seq(smsSendTeacherRequestDto.getClassSeq())
                    .providedAt(LocalDateTime.now()).build());

    authTeacher.setPhone(smsSendTeacherRequestDto.getPhone());

    authTeacherRepository.save(authTeacher);

    messageService.sendMessage(authTeacher.getPhone(), code, smsSendTeacherRequestDto.getClassName()+" 선생님!\n");

    return true;
  }

  @Override
  public boolean checkUserSms(SmsCheckUserRequestDto smsCheckUserRequestDto) {

    AuthUser authUser = authUserRepository.findById(smsCheckUserRequestDto.getPhone()).orElseThrow(() -> {throw new BaseException(UNREQUESTED_SMS_USER);});

    //code 틀릴 경우
    if(!authUser.getCode().equals(smsCheckUserRequestDto.getCode())){
      throw new BaseException(WRONG_CODE);
    }

    //code를 인증했으므로 기존 코드를 유효하지 않은 값으로 바꾸고, 인증됐는지 확인한다.
    authUser.setCode("------");
    authUser.setCertified(true);

    return true;
  }

  @Override
  public boolean checkTeacherSms(SmsCheckTeacherRequestDto checkTeacherSms, Long userSeq) {
    AuthTeacher authTeacher = authTeacherRepository.findById(checkTeacherSms.getPhone()).orElseThrow(() -> {throw new BaseException(UNREQUESTED_SMS_USER);});

    if(!authTeacher.getCodeMap().containsKey(checkTeacherSms.getCode())){
      throw new BaseException(WRONG_CODE);
    }

    Long classSeq = authTeacher.getCodeMap().get(checkTeacherSms.getCode()).getSeq();

    //연관관계 만들기
    manageClassService.createClassTeacher(classSeq, userSeq);

    //code를 인증했으므로 기존 코드를 삭제한다.
    authTeacher.getCodeMap().remove(checkTeacherSms.getCode());

    return true;
  }


  //
//  @Override
//  public SingleMessageSentResponse sendOneMessage(String toNumber, String randomNumber) {
//
//    Message message = new Message();
//
//    message.setFrom(fromNumber);
//    message.setTo(toNumber);
//
//    message.setText("[도담도담] 인증번호 [" + randomNumber + "] 입력해주세요");
//
//    SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
//
//    return response;
//  }

  @Override
  public String generateRandomSixDigitCode() {
    Random random = new Random();
    int randomInt = random.nextInt(900000) + 100000;
    return String.format("%06d", randomInt);
  }

  @Override
  public boolean isCheckedUser(String phone) {
    AuthUser authUSer = authUserRepository.findById(phone).orElseGet(()->{throw new BaseException(UNREQUESTED_SMS_USER);});
    return authUSer.isCertified();
  }

  @Override
  public void deleteCheckedUser(String phone) {
    authUserRepository.deleteById(phone);
  }

}
