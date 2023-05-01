package com.wohaha.dodamdodam.repository;


import com.wohaha.dodamdodam.dto.response.request.UpdateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;
import com.wohaha.dodamdodam.dto.response.response.TeacherInfoResponseDto;

import java.util.List;

public interface ManageClassRepositoryCustom {
    //반정보 조회
    List<ClassListResponseDto> classInfoList(long kindergartenSeq);
    //선생님 정보
    List<TeacherInfoResponseDto> teacherInfo(long kindergartenSeq);
    //반정보 업데이트
    void updateClass(UpdateClassRequestDto updateClassRequestDto);
    //반정보 삭제
    void deleteClass(long classSeq);

}
