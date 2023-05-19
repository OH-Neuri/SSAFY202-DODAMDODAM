package com.wohaha.dodamdodam.controller;

import com.wohaha.dodamdodam.dto.BaseResponseDto;
import com.wohaha.dodamdodam.dto.response.KidParentResponseDto;
import com.wohaha.dodamdodam.dto.response.TeacherInfoResponseDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.service.ManageKidService;
import com.wohaha.dodamdodam.service.ManageTeacherService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
    private final ManageKidService kidService;
    private final ManageTeacherService teacherService;

    @GetMapping("/parent/{classSeq}")
    public BaseResponseDto<List<KidParentResponseDto>> getParentList(@PathVariable Long classSeq) {
        try {
            return new BaseResponseDto<>(kidService.getKidParentList(classSeq));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

    @GetMapping("/teacher/{kidSeq}")
    public BaseResponseDto<List<TeacherInfoResponseDto>> getTeacherList(@PathVariable Long kidSeq) {
        try {
            return new BaseResponseDto<>(teacherService.getTeacherList(kidSeq));
        } catch (Exception e) {
            if (e instanceof BaseException) {
                throw e;
            } else {
                throw new BaseException(BaseResponseStatus.FAIL);
            }
        }
    }

}
