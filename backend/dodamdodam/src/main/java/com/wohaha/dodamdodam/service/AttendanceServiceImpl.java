package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Attendance;
import com.wohaha.dodamdodam.dto.request.AttendanceRequestDto;
import com.wohaha.dodamdodam.dto.request.AttendanceTimeRequestDto;
import com.wohaha.dodamdodam.dto.request.CreateAttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceFormResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.AttendanceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
    public boolean createAttendance(CreateAttendanceRequestDto createAttendanceRequestDto) {
        //dto to entity
        Attendance attendance = Attendance.builder()
                .kidSeq(createAttendanceRequestDto.getKidSeq())
                .forthTime(createAttendanceRequestDto.getForthTime())
                .backTime(createAttendanceRequestDto.getBackTime())
                .backWay(createAttendanceRequestDto.getBackWay())
                .parentName(createAttendanceRequestDto.getParentName())
                .phoneNumber(createAttendanceRequestDto.getPhoneNumber())
                .tempParentName(createAttendanceRequestDto.getTempParentName())
                .tempPhoneNumber(createAttendanceRequestDto.getTempPhoneNumber())
                .build();
        attendanceRepository.save(attendance);
        return true;
    }
    @Override
    public List<AttendanceListResponseDto> getAttendanceList(AttendanceRequestDto classAttendanceRequestDto) {
        return attendanceRepository.getAttendanceList(classAttendanceRequestDto.getSeq(), classAttendanceRequestDto.getDay());
    }

    @Override
    public AttendanceDetailResponseDto getAttendanceDetail(Long attendanceSeq) {
        return attendanceRepository.getAttendanceDetail(attendanceSeq)
                .orElseThrow(() ->  new BaseException(BaseResponseStatus.ATTENDANCE_NULL_FAIL));
    }

    @Override
    public AttendanceFormResponseDto getAttendanceForm(AttendanceRequestDto kidAttendanceRequestDto) {
        return attendanceRepository.getAttendanceForm(kidAttendanceRequestDto.getSeq(), kidAttendanceRequestDto.getDay())
                .orElseThrow(() ->  new BaseException(BaseResponseStatus.ATTENDANCE_FORM_NULL_FAIL));
    }

    @Override
    public boolean updateAttendanceTime(Long attendacneSeq, AttendanceTimeRequestDto attendanceTimeRequestDto) {
        return attendanceRepository.updateAttendanceForm(attendacneSeq, attendanceTimeRequestDto.getForthTimeCheck(), attendanceTimeRequestDto.getBackTimeCheck()) > 0;
    }


}
