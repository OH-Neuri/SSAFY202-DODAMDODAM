package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Schedule;
import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KindergartenScheduleListResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleListResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ScheduleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ManageScheduleServiceImpl implements ManageScheduleService {
    @Autowired
    private final KindergartenRepository kindergartenRepository;
    @Autowired
    private final ScheduleRepository scheduleRepository;

    @Override
    public boolean createSchedule(CreateScheduleRequestDto createScheduleRequestDto) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));

        Schedule schedule = Schedule.builder()
                .kindergartenSeq(kindergartenSeq)
                .content(createScheduleRequestDto.getContent())
                .date(createScheduleRequestDto.getDate())
                .scheduleTypeSeq(createScheduleRequestDto.getScheduleTypeSeq())
                .build();
        scheduleRepository.save(schedule);
        return true;
    }

    @Override
    public KindergartenScheduleListResponseDto getScheduleList(String year, String month) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
        KindergartenScheduleListResponseDto kindergartenScheduleListResponseDto = new KindergartenScheduleListResponseDto(year, month);
        // 행사가 있는 dateNumber가져옴
        List<Integer> dateNumber = scheduleRepository.findScheduleDateList(kindergartenSeq, year, month);
        kindergartenScheduleListResponseDto.setDateNumber(dateNumber);
        // 행사가 있는 날의 행사 List가져옴
        Map<Integer, List<ScheduleListResponseDto>> schedule = new HashMap<>();
        for(Integer date : dateNumber) {
            List<ScheduleListResponseDto> scheduleList = scheduleRepository.findScheduleListByDate(kindergartenSeq, year, month, date);
            schedule.put(date, scheduleList);
        }
        kindergartenScheduleListResponseDto.setSchedule(schedule);

        return kindergartenScheduleListResponseDto;
    }
}
