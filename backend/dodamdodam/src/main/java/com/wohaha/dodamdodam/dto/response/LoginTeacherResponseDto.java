package com.wohaha.dodamdodam.dto.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginTeacherResponseDto {
    private Long classSeq;
    private String className;
    private LoginResponseDto loginResponseDto;

    public LoginTeacherResponseDto() {
        this.classSeq = 0L;
        this.className = "";
    }

    public LoginTeacherResponseDto(Long classSeq, String className) {
        this.classSeq = classSeq;
        this.className = className;
    }
}
