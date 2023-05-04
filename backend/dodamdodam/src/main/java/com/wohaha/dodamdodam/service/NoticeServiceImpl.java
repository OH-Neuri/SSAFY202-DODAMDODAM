package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;
import com.wohaha.dodamdodam.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{
    @Autowired
    private NoticeRepository noticeRepository;

    @Override
    public List<ClassNoticeResponseDto> noticeList(long classSeq) {
        List<ClassNoticeResponseDto> noticeList = new ArrayList<>();
        //알림장 정보 불러오기
        noticeList = noticeRepository.noticeInfo(classSeq);

        for(ClassNoticeResponseDto notice : noticeList) {
            //알림장 사진 불러와 넣기;
           notice.setPhoto(noticeRepository.noticePhoto(notice.getNoticeSeq()));
            //아이 선택
            notice.setKid(noticeRepository.noticeKid(notice.getNoticeSeq()));
        }
        return noticeList;
    }
}
