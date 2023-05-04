package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.KindergartenInfo;
import com.wohaha.dodamdodam.dto.request.CheckSmsRequestDto;
import com.wohaha.dodamdodam.dto.request.SendSmsRequestDto;
import java.util.List;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

public interface KindergartenService {

  List<KindergartenInfo> getKindergartenInfoList(String keyword);

}
