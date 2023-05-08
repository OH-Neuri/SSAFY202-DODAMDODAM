package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.AttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceFormResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;
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
    public List<AttendanceListResponseDto> getAttendanceList(AttendanceRequestDto classAttendanceRequestDto) {
        return attendanceRepository.getAttendanceList(classAttendanceRequestDto.getSeq(), classAttendanceRequestDto.getDay());
    }

    @Override
    public AttendanceDetailResponseDto getAttendanceDetail(Long attendanceSeq) {
        return attendanceRepository.getAttendanceDetail(attendanceSeq);
    }

    @Override
    public AttendanceFormResponseDto getAttendanceForm(AttendanceRequestDto kidAttendanceRequestDto) {
        return attendanceRepository.getAttendanceForm(kidAttendanceRequestDto.getSeq(), kidAttendanceRequestDto.getDay());
    }
}
