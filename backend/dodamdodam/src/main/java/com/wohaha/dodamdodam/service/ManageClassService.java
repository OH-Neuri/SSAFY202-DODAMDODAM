package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.CreateClassRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.ClassListResponseDto;

import java.util.List;

public interface ManageClassService {
    //반 생성
    boolean createClass(CreateClassRequestDto createClassRequestDto);
    //반 조회
    List<ClassListResponseDto> classList();
    //반 수정
    boolean updateClass(UpdateClassRequestDto updateClassRequestDto);
    //반 삭제
    boolean deleteClass(long classSeq);

    //해당 반에 선생님 추가하기
    boolean createClassTeacher(Long classSeq, Long userSeq);
    //해당 반에서 선생님 삭제하기
    boolean deleteClassTeacher(Long classTeacherSeq);

}
