package com.wohaha.dodamdodam.dto.response.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassListResponseDto {

    private Long classSeq;

    private String name;

    private String age;

    private Long teacherSeq;

    private Long teacherName;

}
