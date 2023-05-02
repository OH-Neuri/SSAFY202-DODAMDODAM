package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.response.BaseResponseDto;
import com.wohaha.dodamdodam.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/class")
public class ClassController {
    @Autowired
    private ScheduleService scheduleService;

    @GetMapping("/schedule/{classSeq}")
    public BaseResponseDto<>
}
