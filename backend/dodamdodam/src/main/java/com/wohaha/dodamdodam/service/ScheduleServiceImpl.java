package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Schedule;
import com.wohaha.dodamdodam.domain.ScheduleType;
import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ClassScheduleListResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ClassScheduleResponseDto;
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


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private final KindergartenRepository kindergartenRepository;
    @Autowired
    private final ScheduleRepository scheduleRepository;
    @Autowired
    private final ScheduleTypeRepository scheduleTypeRepository;

    @Override
    public boolean createClassSchedule(Long classSeq, CreateScheduleRequestDto createScheduleRequestDto) {
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
                .classSeq(classSeq)
                .build();
        scheduleRepository.save(schedule);
        return true;
    }

    @Override
    public List<ClassScheduleResponseDto> getDayScheduleList(Long classSeq, String year, String month, String day) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
        return scheduleRepository.findClassScheduleByClassSeq(kindergartenSeq, classSeq, Integer.valueOf(year), Integer.valueOf(month), Integer.valueOf(day));
    }

    @Override
    public ClassScheduleListResponseDto getMonthScheduleList(Long classSeq, String year, String month) {
        Long userSeq = 1L; // 원장선생님 시퀀스 토큰에서 가져옴
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
        ClassScheduleListResponseDto classScheduleListResponseDto = new ClassScheduleListResponseDto(year, month);
        // 행사가 있는 dateNumber가져옴
        List<Integer> dateNumber = scheduleRepository.findScheduleDateList(kindergartenSeq, classSeq, year, month);
        classScheduleListResponseDto.setDateNumber(dateNumber);
        // 행사가 있는 날의 행사 List가져옴
        Map<Integer, List<ClassScheduleResponseDto>> schedule = new HashMap<>();
        for(Integer date : dateNumber) {
            List<ClassScheduleResponseDto> scheduleList = scheduleRepository.findClassScheduleByClassSeq(kindergartenSeq,classSeq, Integer.valueOf(year), Integer.valueOf(month), date);
            schedule.put(date, scheduleList);
        }
        classScheduleListResponseDto.setSchedule(schedule);

        return classScheduleListResponseDto;
    }
}
