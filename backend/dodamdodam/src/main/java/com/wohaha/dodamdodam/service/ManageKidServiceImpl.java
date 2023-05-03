package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Kid;
import com.wohaha.dodamdodam.dto.response.request.CreateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KidListResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ManageKidRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class ManageKidServiceImpl implements ManageKidService{
    @Autowired
    private ManageKidRepository manageKidRepository;

    @Autowired
    private KindergartenRepository kindergartenRepository;


    @Override
    public boolean createKid(CreateKidRequestDto createKidRequestDto, String uploadUrl) {
        //dto to entity
        Kid kid = Kid.builder()
                .name(createKidRequestDto.getKidName())
                .birth(createKidRequestDto.getBirth())
                .photo(uploadUrl)
                .gender(createKidRequestDto.getGender())
                .classSeq(createKidRequestDto.getClassSeq())
                .build();
        //아이등록
        manageKidRepository.save(kid);

        return true;
    }

    @Override
    public List<KidListResponseDto> kidList() {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));

        //아이 정보
        List<KidListResponseDto> kidList = manageKidRepository.kidList();

        for(KidListResponseDto list : kidList){
            System.out.println(list.getBirth());

        }

        return kidList;
    }

    @Override
    public boolean updateKid(UpdateKidRequestDto updateKidRequestDto) {
        if(updateKidRequestDto.getPhoto().equals("NONE")){
            // 사진 없을때
            manageKidRepository.updateKidNotPhoto(updateKidRequestDto);
        }else{
            //사진 있을때
            manageKidRepository.updateKidWithPhoto(updateKidRequestDto);
        }

        return true;
    }

    @Override
    public boolean deleteKid(long kidSeq) {
        manageKidRepository.deleteKid(kidSeq);
        return true;
    }

}
