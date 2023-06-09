package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.ClassKidListResponseDto;
import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;

import java.util.List;

public interface NoticeRepositoryCustom {
    //알림장 작성용 아이리스트
    List<ClassKidListResponseDto> getKidList(Long classSeq);
    //알림장 정보 불러오기 - 선생님
    List<ClassNoticeResponseDto> noticeInfoByTeacher(long classSeq);
    //알림장 정보 불러오기 - 부모님
    List<ClassNoticeResponseDto> noticeInfoByParent(long kidSeq);
    //알림장 월별 검색 - 선생님
    List<ClassNoticeResponseDto> noticeSearchByTeacher(int month, int year, long classSeq);
    //알림장 월별 검색 - 부모님
    List<ClassNoticeResponseDto> noticeSearchByParent(int month, int year, long kidSeq);
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
