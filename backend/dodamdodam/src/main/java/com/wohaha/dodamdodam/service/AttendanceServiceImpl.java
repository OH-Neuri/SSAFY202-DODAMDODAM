package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Attendance;
import com.wohaha.dodamdodam.dto.request.AttendanceRequestDto;
import com.wohaha.dodamdodam.dto.request.AttendanceTimeRequestDto;
import com.wohaha.dodamdodam.dto.request.CreateAttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.AttendanceDetailResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.AttendanceListResponseDto;
import com.wohaha.dodamdodam.dto.response.NotifyResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.repository.AttendanceRepository;
import com.wohaha.dodamdodam.repository.ManageKidRepository;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService {
    private final AttendanceRepository attendanceRepository;
    private final ManageKidRepository kidRepository;



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
    public AttendanceInfoResponseDto getAttendanceInfo(AttendanceRequestDto kidAttendanceRequestDto) {
        return attendanceRepository.getAttendanceInfo(kidAttendanceRequestDto.getSeq(), kidAttendanceRequestDto.getDay())
                .orElseGet(() ->  kidRepository.getKidInfo(kidAttendanceRequestDto.getSeq()));
    }

    @Override
    public NotifyResponseDto updateAttendanceTime(Long attendacneSeq, AttendanceTimeRequestDto attendanceTimeRequestDto) {
        //정보 업데이트
        attendanceRepository.updateAttendanceForm(attendacneSeq, attendanceTimeRequestDto.getForthTimeCheck(), attendanceTimeRequestDto.getBackTimeCheck());

        // 알림에 들어갈 선생님 seq
        Long userSeq = ((CustomAuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
        //알림에 들어갈 내용
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formattedDateTime = currentDate.format(formatter);


        //알람 보냄
        NotifyResponseDto notify = new NotifyResponseDto();
        notify.setType(3);  //등하원은 3
        //등원인지 하원인지 확인
        if(attendanceTimeRequestDto.getForthTimeCheck() != null){ //등원
            notify.setContent(formattedDateTime + " 등원했습니다. 💝");
        }else if(attendanceTimeRequestDto.getBackTimeCheck() != null){ //하원
            notify.setContent(formattedDateTime + " 하원했습니다. 💖");
        }
        notify.setTypeSeq(attendacneSeq);
        notify.setSendUserSeq(userSeq);
        notify.setReceiveUserSeq(attendanceTimeRequestDto.getKidSeq()); //아이의 부모 seq 넣어야함

        return  notify;
    }


}
