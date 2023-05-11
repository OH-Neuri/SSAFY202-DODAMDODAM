package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.TeacherInfoWithClassResponseDto;

import java.util.List;

public interface ManageTeacherService {
    List<TeacherInfoWithClassResponseDto> getTeacher();
}
