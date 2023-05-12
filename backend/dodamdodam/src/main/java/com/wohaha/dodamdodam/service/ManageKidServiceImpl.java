package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Kid;
import com.wohaha.dodamdodam.dto.request.CreateKidRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.KidParentResponseDto;
import com.wohaha.dodamdodam.dto.response.KidResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ManageKidRepository;
import com.wohaha.dodamdodam.repository.UserRepository;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.wohaha.dodamdodam.exception.BaseResponseStatus.*;

@Service
@Transactional
@RequiredArgsConstructor
public class ManageKidServiceImpl implements ManageKidService{
    @Autowired
    private ManageKidRepository manageKidRepository;

    @Autowired
    private KindergartenRepository kindergartenRepository;

    @Autowired
    private UserRepository userRepository;

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
    public List<KidResponseDto> kidList() {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));

        //아이 정보
        List<KidResponseDto> kidList = manageKidRepository.kidList();


        return kidList;
    }

    @Override
    public KidResponseDto kidInfo(long kidSeq) {

        return manageKidRepository.kidInfo(kidSeq);
    }

    @Override
    public boolean updateKid(UpdateKidRequestDto updateKidRequestDto, String uploadUrl) {
        if(uploadUrl == null){
            // 사진 없을때
            manageKidRepository.updateKidNotPhoto(updateKidRequestDto);
        }else{
            //사진 있을때
            manageKidRepository.updateKidWithPhoto(updateKidRequestDto, uploadUrl);
        }

        return true;
    }


    @Override
    public boolean deleteKid(long kidSeq) {
        manageKidRepository.deleteKid(kidSeq);
        return true;
    }

    @Override
    public boolean createParentKid(Long userSeq, Long kidSeq) {
        //연관관계 덮어씌우기
        Kid kid = manageKidRepository.findById(kidSeq).orElseThrow(()->{throw new BaseException(UNREGISTERED_KID);});
        if(!userRepository.existsById(userSeq)) throw new BaseException(UNREGISTERED_USER);

        kid.setUserSeq(userSeq);

        manageKidRepository.save(kid);

        return true;
    }

    @Override
    public List<KidParentResponseDto> getKidParentList(Long classSeq) {
        String role = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getRole();
        if(!role.equals("1") && !role.equals("2")) {
            throw new BaseException(UNPERMISSION_ROLE);
        }
        return manageKidRepository.getKidParentList(classSeq);
    }


}
