package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.CreateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.response.ClassListResponseDto;

import java.util.List;

public interface ManageClassService {

    boolean createClass(CreateClassRequestDto createClassRequestDto);

    List<ClassListResponseDto> classList();

}
