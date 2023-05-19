package com.wohaha.dodamdodam.dto.response;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class LoginParentResponseDto {
    private Long kidSeq;
    private String kidName;
    private String kidPhoto;
    private Long classSeq;
    private String className;

    private LoginResponseDto loginResponseDto;

    public LoginParentResponseDto() {
        this.kidSeq = 0L;
        this.kidName = "";
        this.kidPhoto = "";
        this.classSeq = 0L;
        this.className = "";
    }

    public LoginParentResponseDto(Long kidSeq, String kidName, String kidPhoto, Long classSeq, String className) {
        this.kidSeq = kidSeq;
        this.kidName = kidName;
        this.kidPhoto = kidPhoto;
        this.classSeq = classSeq;
        this.className = className;
    }

    public LoginParentResponseDto(LoginResponseDto loginResponseDto) {
        this.loginResponseDto = loginResponseDto;
    }
}
