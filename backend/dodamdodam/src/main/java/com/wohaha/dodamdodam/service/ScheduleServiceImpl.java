package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;
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
    public List<ScheduleResponseDto> getDayScheduleList(Long classSeq, String year, String month, String day) {
        return scheduleRepository.findClassScheduleByClassSeq(classSeq, Integer.valueOf(year), Integer.valueOf(month), Integer.valueOf(day));
    }
}
