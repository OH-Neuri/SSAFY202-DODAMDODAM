package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.TeacherInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.TeacherInfoWithClassResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ManageTeacherRepository;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManageTeacherServiceImpl implements ManageTeacherService{
    @Autowired
    private KindergartenRepository kindergartenRepository;

    @Autowired
    private ManageTeacherRepository manageTeacherRepository;

    @Override
    public List<TeacherInfoWithClassResponseDto> getTeacher() {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));

        return manageTeacherRepository.teacherList(kindergartenSeq);
    }

    @Override
    public List<TeacherInfoResponseDto> getTeacherList(Long kidSeq) {
        //부모님만 조회가능
        String role  = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getRole();
        if(!role.equals("3")) {
            throw new BaseException(BaseResponseStatus.UNPERMISSION_ROLE);
        }
        return manageTeacherRepository.getTeacherList(kidSeq);
    }

}
