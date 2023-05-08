package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.ClassAttendanceRequestDto;
import com.wohaha.dodamdodam.dto.response.KidAttendanceListResponseDto;
import com.wohaha.dodamdodam.dto.response.KidListResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.AttendanceService;
import com.wohaha.dodamdodam.service.S3UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/class2")
public class ClassController2 {
    @Autowired
    private S3UploadService s3UploadService;
    @Autowired
    private AttendanceService attendanceService;

    // 출석부
    @GetMapping("/attendance")
    public BaseResponseDto<List<KidAttendanceListResponseDto>> getKidAttendanceList(@RequestBody ClassAttendanceRequestDto classAttendanceRequestDto) {
        try {
            return new BaseResponseDto<>(attendanceService.getKidAttendanceList(classAttendanceRequestDto));
        }catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }
}
