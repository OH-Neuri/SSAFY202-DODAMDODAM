package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Notice;
import com.wohaha.dodamdodam.domain.NoticeKid;
import com.wohaha.dodamdodam.domain.NoticePhoto;
import com.wohaha.dodamdodam.dto.request.CreateNoticeRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;
import com.wohaha.dodamdodam.repository.NoticeKidRepository;
import com.wohaha.dodamdodam.repository.NoticePhotoRepository;
import com.wohaha.dodamdodam.repository.NoticeRepository;
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

    @Autowired
    private NoticeKidRepository noticeKidRepository;

    @Autowired
    private NoticePhotoRepository noticePhotoRepository;


    @Override
    public long createNotice(CreateNoticeRequestDto createNoticeRequestDto) {

        //dto to entity
        Notice notice = Notice.builder()
                .classSeq(createNoticeRequestDto.getClassSeq())
                .content(createNoticeRequestDto.getContent())
                .announcement(createNoticeRequestDto.isAnnouncement())
                .build();

        noticeRepository.save(notice);

        Long noticeSeq = notice.getNoticeSeq();

        return noticeSeq;
    }

    @Override
    public boolean createNoticeKidAndPhoto(long noticeSeq, List<Long> kids, List<String> uploadUrls) {
        //아이 저장
        for(Long kid : kids){
            NoticeKid noticeKid = NoticeKid.builder()
                    .noticeSeq(noticeSeq)
                    .kidSeq(kid)
                    .build();
            noticeKidRepository.save(noticeKid);
        }
        //사진 저장
        for(String photo : uploadUrls){
            NoticePhoto noticePhoto = NoticePhoto.builder()
                    .noticeSeq(noticeSeq)
                    .photo(photo)
                    .build();
            noticePhotoRepository.save(noticePhoto);
        }

        return true;
    }

    @Override
    public List<ClassNoticeResponseDto> noticeList(long classSeq) {
        List<ClassNoticeResponseDto> noticeList = new ArrayList<>();
        //알림장 정보 불러오기
        noticeList = noticeRepository.noticeInfo(classSeq);

        for(ClassNoticeResponseDto notice : noticeList) {
            //알림장 사진 불러와 넣기
           notice.setPhoto(noticeRepository.noticePhoto(notice.getNoticeSeq()));
            //아이 정보 넣기
            notice.setKid(noticeRepository.noticeKid(notice.getNoticeSeq()));
        }
        return noticeList;
    }

    @Override
    public ClassNoticeResponseDto noticeInfo(long noticeSeq) {
        ClassNoticeResponseDto noticeInfo = noticeRepository.oneNoticeInfo(noticeSeq);
        //알림장 사진 불러와 넣기
        noticeInfo.setPhoto(noticeRepository.noticePhoto(noticeSeq));
        // 아이 정보 넣기
        noticeInfo.setKid(noticeRepository.noticeKid(noticeSeq));
        return noticeInfo;
    }
}
