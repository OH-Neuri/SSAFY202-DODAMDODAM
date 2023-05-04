package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;
import com.wohaha.dodamdodam.dto.response.KidListResponseDto;

import java.util.List;

public interface NoticeService {

    //알림장 리스트
    List<ClassNoticeResponseDto> noticeList(long classSeq);
}
