package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.request.CreateMedicineRequestDto;
import com.wohaha.dodamdodam.dto.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassNoticeResponseDto;
import com.wohaha.dodamdodam.dto.response.ClassScheduleListResponseDto;
import com.wohaha.dodamdodam.dto.response.ClassScheduleResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.MedicineService;
import com.wohaha.dodamdodam.service.NoticeService;
import com.wohaha.dodamdodam.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/medicine")
public class MedicineController {
    @Autowired
    private MedicineService medicineService;

    //투약의뢰서 작성
    @PostMapping("/{kidSeq}")
    public BaseResponseDto<Boolean> createMedicine(@PathVariable Long kidSeq,
                                                        @ModelAttribute CreateMedicineRequestDto createMedicineRequestDto) {
        try {
            createMedicineRequestDto.setKidSeq(kidSeq);
            boolean result = medicineService.createMedicine(createMedicineRequestDto);
            return new BaseResponseDto<>(result);
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }
//
//    @GetMapping("/schedule/month/{classSeq}")
//    public BaseResponseDto<ClassScheduleListResponseDto> getMonthScheduleList(@PathVariable Long classSeq,
//                                                                              @RequestParam String year,
//                                                                              @RequestParam String month) {
//        try {
//            ClassScheduleListResponseDto cScheduleList = scheduleService.getMonthScheduleList(classSeq, year, month);
//            return new BaseResponseDto<>(cScheduleList);
//        } catch (Exception e) {
//            if (e instanceof BaseException) {
//                throw e;
//            } else {
//                throw new BaseException(BaseResponseStatus.FAIL);
//            }
//        }
//    }
//
//
//    @GetMapping("/schedule/{classSeq}")
//    public BaseResponseDto<List<ClassScheduleResponseDto>> getDayScheduleList(@PathVariable Long classSeq,
//                                                                              @RequestParam String year,
//                                                                              @RequestParam String month,
//                                                                              @RequestParam String day) {
//        try {
//            List<ClassScheduleResponseDto> cDayScheduleList = scheduleService.getDayScheduleList(classSeq, year, month, day);
//            return new BaseResponseDto<>(cDayScheduleList);
//        } catch (Exception e) {
//            if (e instanceof BaseException) {
//                throw e;
//            } else {
//                throw new BaseException(BaseResponseStatus.FAIL);
//            }
//        }
//
//    }
//
//    @GetMapping("/notice/{classSeq}")
//    public BaseResponseDto<List<ClassNoticeResponseDto>> noticeList(@PathVariable Long classSeq){
//        try{
//            return new BaseResponseDto<>(noticeService.noticeList(classSeq));
//        }catch (Exception e){
//            if(e instanceof BaseException){
//                throw e;
//            }else{
//                throw new BaseException(BaseResponseStatus.FAIL);
//            }
//        }
//    }
//    @GetMapping("/notice/info/{noticeSeq}")
//    public BaseResponseDto<ClassNoticeResponseDto> noticeInfo(@PathVariable Long noticeSeq){
//        try{
//            return new BaseResponseDto<>(noticeService.noticeInfo(noticeSeq));
//        }catch (Exception e){
//            if(e instanceof BaseException){
//                throw e;
//            }else{
//                throw new BaseException(BaseResponseStatus.FAIL);
//            }
//        }
//    }
}
