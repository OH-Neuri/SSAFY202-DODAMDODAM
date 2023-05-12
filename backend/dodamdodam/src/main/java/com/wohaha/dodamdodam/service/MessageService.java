package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.exception.BaseException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

import java.util.Random;


public interface MessageService {

    void sendMessage(String toNumber, String code, String text) throws BaseException;

}
