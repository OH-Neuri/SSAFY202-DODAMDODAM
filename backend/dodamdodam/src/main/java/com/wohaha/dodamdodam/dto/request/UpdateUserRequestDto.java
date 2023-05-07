package com.wohaha.dodamdodam.dto.request;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UpdateUserRequestDto {

    private Long userSeq;
    private String id;
    private String password;
    private String phone;
    private String name;

}
