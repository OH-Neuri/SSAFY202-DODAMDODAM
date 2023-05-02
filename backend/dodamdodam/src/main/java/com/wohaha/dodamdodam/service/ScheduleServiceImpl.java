package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.response.ClassScheduleResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ScheduleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private final KindergartenRepository kindergartenRepository;
    @Autowired
    private final ScheduleRepository scheduleRepository;

    @Override
    public List<ClassScheduleResponseDto> getDayScheduleList(Long classSeq, String year, String month, String day) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
        return scheduleRepository.findClassScheduleByClassSeq(kindergartenSeq, classSeq, Integer.valueOf(year), Integer.valueOf(month), Integer.valueOf(day));
    }
}
