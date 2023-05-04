package com.wohaha.dodamdodam.dto.response.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class RegisterUserResponseDto {

    private String id;
    private String name;
    private Integer role;
    private String token;
}
