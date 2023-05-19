package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.TeacherInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.TeacherInfoWithClassResponseDto;

import java.util.List;

public interface ManageTeacherRepositoryCustom {
    List<TeacherInfoWithClassResponseDto> teacherList(Long kindergartenSeq);

    List<TeacherInfoResponseDto> getTeacherList(Long kidSeq);
}
