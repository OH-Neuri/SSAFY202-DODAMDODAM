package com.wohaha.dodamdodam.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class KidInfoResponseDto {
    private Long kidSeq;
    private String kidName;
    private String kidPhoto;
    private Long classSeq;
    private String className;
}
