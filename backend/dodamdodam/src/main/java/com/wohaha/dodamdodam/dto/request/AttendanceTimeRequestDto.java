package com.wohaha.dodamdodam.dto.request;

import lombok.Getter;

import java.sql.Time;

@Getter
public class AttendanceTimeRequestDto {
    private Time forthTimeCheck;
    private Time backTimeCheck;
}
