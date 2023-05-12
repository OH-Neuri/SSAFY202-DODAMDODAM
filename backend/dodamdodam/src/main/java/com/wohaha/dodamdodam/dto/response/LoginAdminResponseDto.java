package com.wohaha.dodamdodam.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class LoginAdminResponseDto {
    private Boolean kindergarten;
    private LoginResponseDto loginResponseDto;
}
