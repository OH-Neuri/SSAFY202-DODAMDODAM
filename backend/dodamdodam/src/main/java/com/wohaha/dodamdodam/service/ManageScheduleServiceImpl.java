package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Schedule;
import com.wohaha.dodamdodam.domain.ScheduleType;
import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.request.ScheduleTypeRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KindergartenScheduleListResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ScheduleRepository;
import com.wohaha.dodamdodam.repository.ScheduleTypeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
@RequiredArgsConstructor
public class ManageScheduleServiceImpl implements ManageScheduleService {
    @Autowired
    private final KindergartenRepository kindergartenRepository;
    @Autowired
    private final ScheduleRepository scheduleRepository;
    @Autowired
    private final ScheduleTypeRepository scheduleTypeRepository;

    @Override
    public boolean createSchedule(CreateScheduleRequestDto createScheduleRequestDto) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
        ScheduleType st = scheduleTypeRepository.findById(createScheduleRequestDto.getScheduleTypeSeq())
                .orElseThrow(() -> new BaseException(BaseResponseStatus.SCHEDULE_TYPE_NULL_FAIL));
        Schedule schedule = Schedule.builder()
                .kindergartenSeq(kindergartenSeq)
                .content(createScheduleRequestDto.getContent())
                .date(createScheduleRequestDto.getDate())
                .scheduleType(st)
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
        Map<Integer, List<ScheduleResponseDto>> schedule = new HashMap<>();
        for(Integer date : dateNumber) {
            List<ScheduleResponseDto> scheduleList = scheduleRepository.findScheduleListByDate(kindergartenSeq, year, month, date);
            schedule.put(date, scheduleList);
        }
        kindergartenScheduleListResponseDto.setSchedule(schedule);

        return kindergartenScheduleListResponseDto;
    }

    @Override
    public boolean deleteSchedule(Long scheduleSeq) {
        Long deleteCnt = scheduleRepository.deleteScheduleById(scheduleSeq);
        return deleteCnt > 0;
    }

    @Override
    public boolean createScheduleType(String content) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
        System.out.println(kindergartenSeq);
        ScheduleType scheduleType = ScheduleType.builder()
                .kindergartenSeq(kindergartenSeq)
                .name(content)
                .build();
        System.out.println(scheduleType.toString());
        scheduleTypeRepository.save(scheduleType);
        return true;
    }

    @Override
    public boolean deleteScheduleType(Long scheduleTypeSeq) {
        Long deleteCnt = scheduleTypeRepository.deleteScheduleTypeById(scheduleTypeSeq);
        return deleteCnt > 0;
    }

    @Override
    public boolean updateScheduleType(ScheduleTypeRequestDto scheduleTypeRequestDto) {
        Long updateCnt = scheduleTypeRepository.updateScheduleType(scheduleTypeRequestDto);
        return updateCnt > 0;
    }
}
