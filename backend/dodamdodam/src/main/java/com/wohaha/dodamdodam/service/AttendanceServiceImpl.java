package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.ClassAttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.KidAttendanceListResponseDto;
import com.wohaha.dodamdodam.repository.AttendanceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService {
    @Autowired
    private final AttendanceRepository attendanceRepository;

    @Override
    public List<KidAttendanceListResponseDto> getKidAttendanceList(ClassAttendanceRequestDto classAttendanceRequestDto) {
        return attendanceRepository.getKidAttendanceList(classAttendanceRequestDto.getClassSeq(), classAttendanceRequestDto.getDay());
    }
}
