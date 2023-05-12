package com.wohaha.dodamdodam.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class FoodResponseDto {
    private Long foodSeq;
    private String rice;
    private String soup;
    private String dish1;
    private String dish2;
    private String dish3;
    private String morningSnack1;
    private String morningSnack2;
    private String afternoonSnack1;
    private String afternoonSnack2;
}
