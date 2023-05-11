package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.TeacherInfoWithClassResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ManageTeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));

        return manageTeacherRepository.teacherList(kindergartenSeq);
    }
}
