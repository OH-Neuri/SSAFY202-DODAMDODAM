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
    //알림장 사진 삭제
    void deleteNoticePhoto(long noticeSeq);
    //알림장 내용 변경
    void updateNoticeContent(String content, Long noticeSeq);
    //알림장 아이 삭제
    void deleteNoticeKid(long noticeSeq);
    //알림장 내용 삭제
    void deleteNotice(long noticeSeq);
}
