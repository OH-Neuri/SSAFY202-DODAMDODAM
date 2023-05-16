package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Schedule;
import com.wohaha.dodamdodam.domain.ScheduleType;
import com.wohaha.dodamdodam.dto.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.request.ScheduleTypeRequestDto;
import com.wohaha.dodamdodam.dto.response.KindergartenScheduleListResponseDto;
import com.wohaha.dodamdodam.dto.response.ScheduleResponseDto;
import com.wohaha.dodamdodam.dto.response.ScheduleTypeResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.repository.ScheduleRepository;
import com.wohaha.dodamdodam.repository.ScheduleTypeRepository;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
@RequiredArgsConstructor
public class ManageScheduleServiceImpl implements ManageScheduleService {
    private final KindergartenRepository kindergartenRepository;
    private final ScheduleRepository scheduleRepository;
    private final ScheduleTypeRepository scheduleTypeRepository;

    @Override
    public boolean createSchedule(CreateScheduleRequestDto createScheduleRequestDto) {
        Long userSeq = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));
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
    public KindergartenScheduleListResponseDto getMonthScheduleList(String year, String month) {
        Long userSeq = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));
        KindergartenScheduleListResponseDto kindergartenScheduleListResponseDto = new KindergartenScheduleListResponseDto(year, month);
        // 행사가 있는 dateNumber가져옴
        List<Integer> dateNumber = scheduleRepository.findScheduleDateList(kindergartenSeq, year, month);
        kindergartenScheduleListResponseDto.setDateNumber(dateNumber);
        // 행사가 있는 날의 행사 List가져옴
        Map<Integer, List<ScheduleResponseDto>> schedule = new HashMap<>();
        for(Integer date : dateNumber) {
            List<ScheduleResponseDto> scheduleList = scheduleRepository.findScheduleListByKindergartenSeq(kindergartenSeq, Integer.valueOf(year), Integer.valueOf(month), date);
            schedule.put(date, scheduleList);
        }
        kindergartenScheduleListResponseDto.setSchedule(schedule);

        return kindergartenScheduleListResponseDto;
    }

    @Override
    public List<ScheduleResponseDto> getDayScheduleList(String year, String month, String day) {
        Long userSeq = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));
        return scheduleRepository.findScheduleListByKindergartenSeq(kindergartenSeq, Integer.valueOf(year), Integer.valueOf(month), Integer.valueOf(day));
    }

    @Override
    public boolean deleteSchedule(Long scheduleSeq) {
        Long deleteCnt = scheduleRepository.deleteScheduleById(scheduleSeq);
        return deleteCnt > 0;
    }

    @Override
    public boolean createScheduleType(String content) {
        Long userSeq = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));
        ScheduleType scheduleType = ScheduleType.builder()
                .kindergartenSeq(kindergartenSeq)
                .name(content)
                .build();
        scheduleTypeRepository.save(scheduleType);
        return true;
    }
    @Override
    public List<ScheduleTypeResponseDto> getScheduleTypeList() {
        Long userSeq = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
        Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
                .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));
        return scheduleTypeRepository.findScheduleTypeByKindergartenSeq(kindergartenSeq);
    }

    @Override
    public boolean updateScheduleType(ScheduleTypeRequestDto scheduleTypeRequestDto) {
        Long updateCnt = scheduleTypeRepository.updateScheduleType(scheduleTypeRequestDto);
        return updateCnt > 0;
    }

    @Override
    public boolean deleteScheduleType(Long scheduleTypeSeq) {
        //isValid = false로 업데이트
        Long deleteCnt = scheduleTypeRepository.deleteScheduleTypeById(scheduleTypeSeq);
        return deleteCnt > 0;
    }

}
