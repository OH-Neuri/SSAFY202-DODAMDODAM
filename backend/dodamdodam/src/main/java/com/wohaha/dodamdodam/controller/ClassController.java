package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.*;
import com.wohaha.dodamdodam.dto.response.*;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.AttendanceService;
import com.wohaha.dodamdodam.service.NoticeService;
import com.wohaha.dodamdodam.service.S3UploadService;
import com.wohaha.dodamdodam.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/class")
public class ClassController {
    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private S3UploadService s3UploadService;

    @Autowired
    private AttendanceService attendanceService;

    // 일정 관리
    @PostMapping("/schedule/{classSeq}")
    public BaseResponseDto<Boolean> createClassSchedule(@PathVariable Long classSeq,
                                                        @RequestBody CreateScheduleRequestDto createScheduleRequestDto) {
        try {
            boolean result = scheduleService.createClassSchedule(classSeq, createScheduleRequestDto);
            return new BaseResponseDto<>(result);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/schedule/month/{classSeq}")
    public BaseResponseDto<ClassScheduleListResponseDto> getMonthScheduleList(@PathVariable Long classSeq,
                                                                              @RequestParam String year,
                                                                              @RequestParam String month) {
        try {
            ClassScheduleListResponseDto cScheduleList = scheduleService.getMonthScheduleList(classSeq, year, month);
            return new BaseResponseDto<>(cScheduleList);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }


    @GetMapping("/schedule/{classSeq}")
    public BaseResponseDto<List<ClassScheduleResponseDto>> getDayScheduleList(@PathVariable Long classSeq,
                                                                              @RequestParam String year,
                                                                              @RequestParam String month,
                                                                              @RequestParam String day) {
        try {
            List<ClassScheduleResponseDto> cDayScheduleList = scheduleService.getDayScheduleList(classSeq, year, month, day);
            return new BaseResponseDto<>(cDayScheduleList);
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }

    }

    @PostMapping("/notice")
    public BaseResponseDto<?> createNotice(@ModelAttribute CreateNoticeRequestDto createNoticeRequestDto){
        try{
            List<String> uploadUrl = null;
            //이미지 s3 업로드 후 링크 가져오기
             if(createNoticeRequestDto.getPhotos() != null && createNoticeRequestDto.getPhotos().size() > 0) {
                MultipartFile firstFile = createNoticeRequestDto.getPhotos().get(0);
                if (!firstFile.isEmpty()) {
                    // 파일이 존재함
                    uploadUrl = s3UploadService.upload(createNoticeRequestDto.getPhotos(),"noticePhoto");
                }
            }
            //db 저장
            Long noticeSeq = noticeService.createNotice(createNoticeRequestDto);
            boolean result = noticeService.createNoticeKidAndPhoto(noticeSeq,createNoticeRequestDto.getKid(),uploadUrl);
            return new BaseResponseDto(result);
        }catch (Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }

    }
    @GetMapping("/notice/{classSeq}")
    public BaseResponseDto<List<ClassNoticeResponseDto>> noticeList(@PathVariable Long classSeq){
        try{
            return new BaseResponseDto<>(noticeService.noticeList(classSeq));
        }catch (Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/notice/info/{noticeSeq}")
    public BaseResponseDto<ClassNoticeResponseDto> noticeInfo(@PathVariable Long noticeSeq){
        try{
            return new BaseResponseDto<>(noticeService.noticeInfo(noticeSeq));
        }catch (Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @PutMapping("/notice/{noticeSeq}")
    public BaseResponseDto<?> updateNotice(@PathVariable Long noticeSeq, @RequestBody UpdateNoticeRequestDto updateNoticeRequestDto){
        try{

            return new BaseResponseDto<>(noticeService.updateNotice(noticeSeq, updateNoticeRequestDto));
        }catch (Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @DeleteMapping("/notice/{noticeSeq}")
    public BaseResponseDto<?> deleteNotice(@PathVariable Long noticeSeq){
        try{
            return  new BaseResponseDto<>(noticeService.deleteNotice(noticeSeq));
        }catch (Exception e){
            if(e instanceof BaseException){
                throw e;
            }else{
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    // 출석부
    @PostMapping("/attendance")
    public BaseResponseDto<Boolean> createAttendance(@ModelAttribute CreateAttendanceRequestDto createAttendanceRequestDto) {
        try {
            createAttendanceRequestDto.toString();
            String uploadUrl = null;
            //이미지 s3 업로드 후 링크 가져오기
            if(!createAttendanceRequestDto.getSign().isEmpty()) {
                uploadUrl = s3UploadService.upload(createAttendanceRequestDto.getSign(), "attendanceSign");
            }
            return new BaseResponseDto<>(attendanceService.createAttendance(createAttendanceRequestDto, uploadUrl));
        }catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/attendance/list")
    public BaseResponseDto<List<AttendanceListResponseDto>> getKidAttendanceList(@RequestBody AttendanceRequestDto classAttendanceRequestDto) {
        try {
            return new BaseResponseDto<>(attendanceService.getAttendanceList(classAttendanceRequestDto));
        }catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/attendance/{attendanceSeq}")
    public BaseResponseDto<AttendanceDetailResponseDto> getKidAttendanceDetail(@PathVariable Long attendanceSeq) {
        try {
            return new BaseResponseDto<>(attendanceService.getAttendanceDetail(attendanceSeq));
        }catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/attendance/form")
    public BaseResponseDto<AttendanceFormResponseDto> getKidAttendanceForm(@RequestBody AttendanceRequestDto kidAttendanceRequestDto) {
        try {
            return new BaseResponseDto<>(attendanceService.getAttendanceForm(kidAttendanceRequestDto));
        }catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @PutMapping("/attendance/{attendanceSeq}")
    public BaseResponseDto<Boolean> updateAttendanceTime(@PathVariable Long attendanceSeq, @RequestBody AttendanceTimeRequestDto attendanceTimeRequestDto) {
        try {
            return new BaseResponseDto<>(attendanceService.updateAttendanceTime(attendanceSeq, attendanceTimeRequestDto));
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
