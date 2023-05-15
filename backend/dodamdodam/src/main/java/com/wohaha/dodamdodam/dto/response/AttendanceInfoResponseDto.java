package com.wohaha.dodamdodam.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.sql.Time;
import java.util.Date;

@Getter
@AllArgsConstructor
public class AttendanceInfoResponseDto {
    private String name;
    private String photo;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date date;
    private Long attendanceSeq;
    private Time forthTime;
    private Time backTime;
    private String backWay;
    private Time forthTimeCheck;
    private Time backTimeCheck;
    private String parentName;
    private String phoneNumber;
    private String tempParentName;
    private String tempPhoneNumber;

    public AttendanceInfoResponseDto(String name, String photo) {
        this.name = name;
        this.photo = photo;
    }
}
