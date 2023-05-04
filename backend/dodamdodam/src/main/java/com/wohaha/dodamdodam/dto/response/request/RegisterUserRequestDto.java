package com.wohaha.dodamdodam.dto.response.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class RegisterUserRequestDto {

    private String id;
    private String password;
    private String phone;
    private String name;
    private Integer role;
}
