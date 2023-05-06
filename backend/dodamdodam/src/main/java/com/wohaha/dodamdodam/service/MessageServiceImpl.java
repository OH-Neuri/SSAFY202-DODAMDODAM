package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.Random;

@Service
@Transactional
public class MessageServiceImpl implements MessageService{

    @Value("${coolsms.apiKey}")
    private String apiKey;

    @Value("${coolsms.secretKey}")
    private String apiSecret;

    @Value("${coolsms.from}")
    private String fromNumber;

    private DefaultMessageService messageService;

    @PostConstruct
    private void init(){
        this.messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecret, "https://api.coolsms.co.kr");
    }

    @Override
    public void sendMessage(String toNumber, String code, String text) throws BaseException{

        Message message = new Message();

        message.setFrom(fromNumber);
        message.setTo(toNumber);

        message.setText("[도담도담]\n" + text + "인증번호 [" + code + "] 입력해주세요");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));

        if(!response.getStatusCode().equals("2000")){
            throw new BaseException(BaseResponseStatus.SMS_AUTHENTICATION_FAIL);
        }
    }
//
//    @Override
//    public String generateRandomSixDigitCode() {
//        Random random = new Random();
//        int randomInt = random.nextInt(900000) + 100000;
//        return String.format("%06d", randomInt);
//    }

}
