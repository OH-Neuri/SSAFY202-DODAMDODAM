package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.response.BaseResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/class")
public class ClassController {
    @Autowired
    private ScheduleService scheduleService;

    @GetMapping("/schedule/{classSeq}")
    public BaseResponseDto<List<ScheduleResponseDto>> getDayScheduleList(@PathVariable Long classSeq,
                                                                         @RequestParam String year,
                                                                         @RequestParam String month,
                                                                         @RequestParam String day) {
        try {
            List<ScheduleResponseDto> cDayScheduleList = scheduleService.getDayScheduleList(classSeq, year, month, day);
            return new BaseResponseDto<>(cDayScheduleList);
        } catch(Exception e) {
            if(e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }

    }
}
