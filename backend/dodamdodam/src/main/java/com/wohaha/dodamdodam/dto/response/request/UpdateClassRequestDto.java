package com.wohaha.dodamdodam.dto.response.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UpdateClassRequestDto {
    private Long classSeq;

    private String name;

    private String age;
}
