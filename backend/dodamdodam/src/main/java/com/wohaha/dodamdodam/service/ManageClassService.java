package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.CreateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.request.UpdateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;

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


}
