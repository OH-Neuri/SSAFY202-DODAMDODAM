package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Notice;
import com.wohaha.dodamdodam.domain.NoticeKid;
import com.wohaha.dodamdodam.domain.NoticePhoto;
import com.wohaha.dodamdodam.dto.request.CreateNoticeRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateNoticeRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassKidListResponseDto;
import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;
import com.wohaha.dodamdodam.dto.response.NotifyResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.ManageKidRepository;
import com.wohaha.dodamdodam.repository.NoticeKidRepository;
import com.wohaha.dodamdodam.repository.NoticePhotoRepository;
import com.wohaha.dodamdodam.repository.NoticeRepository;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{
    @Autowired
    private NoticeRepository noticeRepository;

    @Autowired
    private NoticeKidRepository noticeKidRepository;

    @Autowired
    private NoticePhotoRepository noticePhotoRepository;

    @Autowired
    private ManageKidRepository manageKidRepository;


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
    public List<NotifyResponseDto> createNoticeKidAndPhoto(long noticeSeq, String kids, List<String> uploadUrls) {
        //알림보낼 리스트
        List<NotifyResponseDto> notifyList = new ArrayList<>();
        LocalDate currentDate = LocalDate.now(); //알림에 들어갈 내용

        // 알림에 들어갈 선생님 seq
        Long userSeq = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();

        List<Long> kidList = Arrays.stream(kids.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());


        //아이 저장
        for(Long kid : kidList){
            //db 저장
            NoticeKid noticeKid = NoticeKid.builder()
                    .noticeSeq(noticeSeq)
                    .kidSeq(kid)
                    .build();
            noticeKidRepository.save(noticeKid);
            //알람 보냄
            NotifyResponseDto notify = new NotifyResponseDto();
            notify.setType(1); //알림장은 1
            notify.setContent(currentDate + "일 알림장이 등록되었습니다.😍");
            notify.setTypeSeq(noticeSeq);
            notify.setSendUserSeq(userSeq);
            notify.setReceiveUserSeq(manageKidRepository.findParentSeqByKidSeq(kid)); //아이의 부모 seq 넣어야함
            notifyList.add(notify);
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

        return notifyList;
    }

    @Override
    public List<ClassKidListResponseDto> getKidList(Long classSeq) {
        return noticeRepository.getKidList(classSeq);
    }

    @Override
    public List<ClassNoticeResponseDto> noticeListByTeacher(long classSeq) {
        List<ClassNoticeResponseDto> noticeList = new ArrayList<>();
        //알림장 정보 불러오기
        noticeList = noticeRepository.noticeInfoByTeacher(classSeq);

        for(ClassNoticeResponseDto notice : noticeList) {
            //알림장 사진 불러와 넣기
            notice.setPhoto(noticeRepository.noticePhoto(notice.getNoticeSeq()));
            //아이 정보 넣기
            notice.setKid(noticeRepository.noticeKid(notice.getNoticeSeq()));
        }
        return noticeList;
    }


    @Override
    public List<ClassNoticeResponseDto> noticeListByParent(long kidSeq) {
        List<ClassNoticeResponseDto> noticeList = new ArrayList<>();
        //알림장 정보 불러오기
        noticeList = noticeRepository.noticeInfoByParent(kidSeq);

        for(ClassNoticeResponseDto notice : noticeList) {
            //알림장 사진 불러와 넣기
           notice.setPhoto(noticeRepository.noticePhoto(notice.getNoticeSeq()));
            //아이 정보 넣기
            notice.setKid(noticeRepository.noticeKid(notice.getNoticeSeq()));
        }
        return noticeList;
    }

    @Override
    public List<ClassNoticeResponseDto> noticeSearchByTeacher(int month, int year, long classSeq) {
        List<ClassNoticeResponseDto> noticeList = new ArrayList<>();
        //알림장 정보 불러오기
        noticeList = noticeRepository.noticeSearchByTeacher(month, year, classSeq);

        for(ClassNoticeResponseDto notice : noticeList) {
            //알림장 사진 불러와 넣기
            notice.setPhoto(noticeRepository.noticePhoto(notice.getNoticeSeq()));
            //아이 정보 넣기
            notice.setKid(noticeRepository.noticeKid(notice.getNoticeSeq()));
        }
        return noticeList;
    }

    @Override
    public List<ClassNoticeResponseDto> noticeSearchByParent(int month, int year, long kidSeq) {
        List<ClassNoticeResponseDto> noticeList = new ArrayList<>();
        //알림장 정보 불러오기
        noticeList = noticeRepository.noticeSearchByParent(month, year, kidSeq);

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
