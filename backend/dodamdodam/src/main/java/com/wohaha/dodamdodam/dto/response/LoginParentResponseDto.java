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

    public LoginParentResponseDto(LoginResponseDto loginResponseDto) {
        this.loginResponseDto = loginResponseDto;
    }
}
