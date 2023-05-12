package com.wohaha.dodamdodam.dto.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter
public class FoodRequestDto {
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;

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
