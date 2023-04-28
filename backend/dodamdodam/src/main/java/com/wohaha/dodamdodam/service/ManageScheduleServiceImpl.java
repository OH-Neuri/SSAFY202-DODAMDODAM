package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Schedule;
import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ManageScheduleServiceImpl implements ManageScheduleService {
    private final KindergartenRepository kindergartenRepository;

    @Override
    public boolean createSchedule(CreateScheduleRequestDto createScheduleRequestDto) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Optional<Long> kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq);
        if (kindergartenSeq.isPresent()) {
        } else {
            return false;
        }
        return true;
    }
}
