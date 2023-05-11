package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Notice;
import com.wohaha.dodamdodam.domain.NoticeKid;
import com.wohaha.dodamdodam.domain.NoticePhoto;
import com.wohaha.dodamdodam.dto.request.CreateNoticeRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateNoticeRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassKidListResponseDto;
import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;
import com.wohaha.dodamdodam.repository.NoticeKidRepository;
import com.wohaha.dodamdodam.repository.NoticePhotoRepository;
import com.wohaha.dodamdodam.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

import static com.wohaha.dodamdodam.domain.QKid.kid;

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
        if(uploadUrls != null) {
            for (String photo : uploadUrls) {
                NoticePhoto noticePhoto = NoticePhoto.builder()
                        .noticeSeq(noticeSeq)
                        .photo(photo)
                        .build();
                noticePhotoRepository.save(noticePhoto);
            }
        }

        return true;
    }

    @Override
    public List<ClassKidListResponseDto> getKidList(Long classSeq) {
        return noticeRepository.getKidList(classSeq);
    }


    @Override
    public List<ClassNoticeResponseDto> noticeList(long kidSeq) {
        List<ClassNoticeResponseDto> noticeList = new ArrayList<>();
        //알림장 정보 불러오기
        noticeList = noticeRepository.noticeInfo(kidSeq);

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

    @Override
    public boolean updateNotice(Long noticeSeq, UpdateNoticeRequestDto updateNoticeRequestDto) {
        //기존 알림장 사진 삭제
        noticeRepository.deleteNoticePhoto(noticeSeq);

        //알림장에 사진 넣기
        for(String photo : updateNoticeRequestDto.getPhoto()){
            NoticePhoto noticePhoto = NoticePhoto.builder()
                    .noticeSeq(noticeSeq)
                    .photo(photo)
                    .build();
            noticePhotoRepository.save(noticePhoto);
        }

        //알림장 내용 변경
        noticeRepository.updateNoticeContent(updateNoticeRequestDto.getContent(), noticeSeq);


        return true;
    }

    @Override
    public boolean deleteNotice(Long noticeSeq) {
        //기존 알림장 사진 삭제
        noticeRepository.deleteNoticePhoto(noticeSeq);
        //기존 아이 삭제
        noticeRepository.deleteNoticeKid(noticeSeq);
        //알림장 삭제
        noticeRepository.deleteNotice(noticeSeq);
        return true;
    }


}
