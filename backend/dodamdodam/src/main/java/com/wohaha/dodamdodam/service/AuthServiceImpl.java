package com.wohaha.dodamdodam.service;

import static com.wohaha.dodamdodam.exception.BaseResponseStatus.UNREQUESTED_SMS_USER;
import static com.wohaha.dodamdodam.exception.BaseResponseStatus.WRONG_CODE;

import com.wohaha.dodamdodam.domain.Auth;
import com.wohaha.dodamdodam.dto.response.request.CheckSmsRequestDto;
import com.wohaha.dodamdodam.dto.response.request.SendSmsRequestDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.AuthRepository;
import com.wohaha.dodamdodam.repository.UserRepository;
import java.util.Optional;
import java.util.Random;
import javax.annotation.PostConstruct;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AuthServiceImpl implements AuthService{
  @Value("${coolsms.apiKey}")
  private String apiKey;

  @Value("${coolsms.secretKey}")
  private String apiSecret;

  @Value("${coolsms.from}")
  private String fromNumber;

  private DefaultMessageService messageService;

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private AuthRepository authRepository;

  @PostConstruct
  private void init(){
    this.messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecret, "https://api.coolsms.co.kr");
  }

  @Override
  public boolean sendSms(SendSmsRequestDto sendSmsRequestDto) {

    Optional<Auth> optAuth = authRepository.findById(sendSmsRequestDto.getPhone());
    Auth auth;

    //0. 이미 회원가입한 유저인지 확인하기
    if(userRepository.isSignedUp(sendSmsRequestDto.getPhone(), sendSmsRequestDto.getRole())){
      throw new BaseException(BaseResponseStatus.ALREADY_SIGNED_UP);
    }

    //1. 기존에 해당 휴대폰번호로 인증한 적이 없다면
    if(optAuth.isEmpty()){
      //새로운 auth 객체 생성
      auth = Auth.builder()
          .phone(sendSmsRequestDto.getPhone())
          .code(generateRandomSixDigitCode())
          .requestCnt(0)
          .isChecked(false)
          .build();
      authRepository.save(auth);

    }
    //이미 인증 보냈던 유저라면
    else{
      auth = optAuth.get();

      //오늘 인증횟수가 10회면
      if(auth.getRequestCnt()==10){
        throw new BaseException(BaseResponseStatus.SMS_AUTHENTICATION_COUNT);
      }

      //만약 이미 인증됐던 유저가 한번 더 인증을 요청한 경우
      auth.setIsChecked(false);
      auth.setCode(generateRandomSixDigitCode());
    }

    //메세지 send
    SingleMessageSentResponse singleMessageSentResponse = sendOneMessage(auth.getPhone(), auth.getCode());

    if(!singleMessageSentResponse.getStatusCode().equals("2000")){
      throw new BaseException(BaseResponseStatus.SMS_AUTHENTICATION_FAIL);
    }

    auth.setRequestCnt(auth.getRequestCnt()+1);

    return true;
  }

  @Override
  public SingleMessageSentResponse sendOneMessage(String toNumber, String randomNumber) {

    Message message = new Message();

    message.setFrom(fromNumber);
    message.setTo(toNumber);

    message.setText("[도담도담] 인증번호 [" + randomNumber + "] 입력해주세요 >ㅁ<");

    SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));

    return response;
  }

  @Override
  public boolean checkSms(CheckSmsRequestDto checkSmsRequestDto) {

    Auth auth = authRepository.findById(checkSmsRequestDto.getPhone()).orElseThrow(() -> {throw new BaseException(BaseResponseStatus.UNREQUESTED_SMS_USER);});

    //code 틀릴 경우
    if(!auth.getCode().equals(checkSmsRequestDto.getCode())){
      throw new BaseException(WRONG_CODE);
    }

    //code를 인증했으므로 기존 코드를 유효하지 않은 값으로 바꾸고, 인증됐는지 확인한다.
    auth.setCode("------");
    auth.setIsChecked(true);

    return true;
  }

  @Override
  public String generateRandomSixDigitCode() {
    Random random = new Random();
    int randomInt = random.nextInt(900000) + 100000;
    return String.format("%06d", randomInt);
  }

  @Override
  public boolean isCheckedUser(String phone) {
    Auth auth = authRepository.findById(phone).orElseGet(()->{throw new BaseException(UNREQUESTED_SMS_USER);});

    return auth.getIsChecked();
  }

}
