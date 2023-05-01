package com.wohaha.dodamdodam.repository;


import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;

import java.util.List;

public interface ManageClassRepositoryCustom {
    List<ClassListResponseDto> classInfoList(long kindergartenSeq);

    List<ClassListResponseDto> teacherInfo(long kindergartenSeq);
}
