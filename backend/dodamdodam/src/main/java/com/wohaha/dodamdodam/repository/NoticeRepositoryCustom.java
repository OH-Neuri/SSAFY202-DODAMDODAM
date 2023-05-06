package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;

import java.util.List;

public interface NoticeRepositoryCustom {

    //알림장 정보 불러오기
    List<ClassNoticeResponseDto> noticeInfo(long classSeq);
    //알림장 사진 불러오기
    List<String> noticePhoto(long noticeSeq);
    //알림장 //아이 선택
    List<String> noticeKid(long noticeSeq);
    //알림장 1개 정보
    ClassNoticeResponseDto oneNoticeInfo(long noticeSeq);
}
