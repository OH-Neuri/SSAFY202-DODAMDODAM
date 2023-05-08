package com.wohaha.dodamdodam.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.sql.Time;

@Getter
@AllArgsConstructor
public class AttendanceFormResponseDto {
    private String name;
    private String photo;
    private Time forthTime;
    private Time backTime;
    private String backWay;
    private String parentName;
    private String phoneNumber;
    private String tempParentName;
    private String tempPhoneNumber;

}
