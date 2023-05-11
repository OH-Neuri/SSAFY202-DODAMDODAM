package com.wohaha.dodamdodam.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class TeacherInfoWithClassResponseDto {

    private Long teacherSeq;
    private String className;
    private String teacherName;

}
