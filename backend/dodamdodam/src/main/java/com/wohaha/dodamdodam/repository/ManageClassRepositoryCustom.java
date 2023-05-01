package com.wohaha.dodamdodam.repository;


import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;
import com.wohaha.dodamdodam.dto.response.response.TeacherInfoResponseDto;

import java.util.List;

public interface ManageClassRepositoryCustom {
    List<ClassListResponseDto> classInfoList(long kindergartenSeq);

    List<TeacherInfoResponseDto> teacherInfo(long kindergartenSeq);
}
