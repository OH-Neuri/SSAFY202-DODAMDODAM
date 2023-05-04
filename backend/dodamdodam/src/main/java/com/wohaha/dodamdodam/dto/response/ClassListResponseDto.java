package com.wohaha.dodamdodam.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ClassListResponseDto {

    private Long classSeq;

    private String className;

    private String age;

    List<TeacherInfoResponseDto> teacherInfo;


}
