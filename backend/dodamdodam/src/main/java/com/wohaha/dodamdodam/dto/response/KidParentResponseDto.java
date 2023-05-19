package com.wohaha.dodamdodam.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class KidParentResponseDto {
    private String kidName;
    private String kidPhoto;
    private Long parentSeq;
    private String parentName;
}
