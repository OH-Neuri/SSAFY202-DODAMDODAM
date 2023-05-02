package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.response.BaseResponseDto;
import com.wohaha.dodamdodam.dto.response.request.CreateScheduleRequestDto;
import com.wohaha.dodamdodam.dto.response.request.ScheduleTypeRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KindergartenScheduleListResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleResponseDto;
import com.wohaha.dodamdodam.dto.response.response.ScheduleTypeResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.ManageScheduleService;
import com.wohaha.dodamdodam.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/kindergarten2")
public class KindergartenController2 {
    @Autowired
    private ManageScheduleService manageScheduleService;

    @PostMapping("/schedule")
    public BaseResponseDto<Boolean> createSchedule(@RequestBody CreateScheduleRequestDto createScheduleRequestDto) {
        try {
            boolean result = manageScheduleService.createSchedule(createScheduleRequestDto);
            return new BaseResponseDto<>(result);
        } catch (Exception e) {
            if(e instanceof BaseException) {
                throw e;
            }
            throw new BaseException(BaseResponseStatus.FAIL);
        }
    }

    @GetMapping("/schedule/month")
    public BaseResponseDto<KindergartenScheduleListResponseDto> getMonthScheduleList(@RequestParam String year, @RequestParam String month) {
        try {
            KindergartenScheduleListResponseDto kScheduleList = manageScheduleService.getMonthScheduleList(year, month);
            return new BaseResponseDto<>(kScheduleList);
        } catch(Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("schedule")
    public BaseResponseDto<List<ScheduleResponseDto>> getDayScheduleList(@RequestParam String year,
                                                                         @RequestParam String month,
                                                                         @RequestParam String day) {
        try {
            List<ScheduleResponseDto> kDayScheduleList = manageScheduleService.getDayScheduleList(year, month, day);
            return new BaseResponseDto<>(kDayScheduleList);
        } catch(Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @DeleteMapping("/schedule/{scheduleSeq}")
    public BaseResponseDto<Boolean> deleteSchedule(@PathVariable Long scheduleSeq) {
        try {
            return new BaseResponseDto<>(manageScheduleService.deleteSchedule(scheduleSeq));
        } catch(Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @PostMapping("/scheduleType")
    public BaseResponseDto<Boolean> createScheduleType(@RequestBody List<ScheduleTypeRequestDto> scheduleType) {
        try{
            for(ScheduleTypeRequestDto st : scheduleType) {
                if(st.getScheduleTypeSeq() == null) {
                    // create
                    if(!manageScheduleService.createScheduleType(st.getContent())) {
                        throw new BaseException(BaseResponseStatus.SCHEDULE_TYPE_CREATE_FAIL);
                    }
                } else if(st.getContent() == null) {
                    // delete
                    if(!manageScheduleService.deleteScheduleType(st.getScheduleTypeSeq())) {
                        throw new BaseException(BaseResponseStatus.SCHEDULE_TYPE_DELETE_FAIL);
                    }
                } else {
                    // update
                    if(!manageScheduleService.updateScheduleType(st)) {
                        throw new BaseException(BaseResponseStatus.SCHEDULE_TYPE_UPDATE_FAIL);
                    }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
        return new BaseResponseDto<>(true);
    }

    @GetMapping("/scheduleType")
    public BaseResponseDto<List<ScheduleTypeResponseDto>> getScheduleTypeList() {
        try {
            List<ScheduleTypeResponseDto> scheduleTypeList = manageScheduleService.getScheduleTypeList();
            return new BaseResponseDto<>(scheduleTypeList);
        } catch(Exception e) {
            e.printStackTrace();
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

}
