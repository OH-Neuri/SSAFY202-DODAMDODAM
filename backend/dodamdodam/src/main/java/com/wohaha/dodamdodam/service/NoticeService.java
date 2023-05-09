package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.CreateNoticeRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateNoticeRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassKidListResponseDto;
import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;

import java.util.List;

public interface NoticeService {
    //알림장 등록  - 내용
    long createNotice(CreateNoticeRequestDto createNoticeRequestDto);
    //알림장 등록 - 사진 & 아이
    boolean createNoticeKidAndPhoto(long noticeSeq, List<Long> kids, List<String> uploadUrls);
    //아이 리스트
    List<ClassKidListResponseDto> getKidList(Long classSeq);
    //알림장 리스트
    List<ClassNoticeResponseDto> noticeList(long classSeq);
    //알림장 1개 정보
    ClassNoticeResponseDto noticeInfo(long noticeSeq);
    //알림장 수정
    boolean updateNotice(Long noticeSeq, UpdateNoticeRequestDto updateNoticeRequestDto);
    //알림장 삭제
    boolean deleteNotice(Long noticeSeq);
}
