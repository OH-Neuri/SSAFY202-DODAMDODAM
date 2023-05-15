package com.wohaha.dodamdodam.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.Date;

@Getter
@AllArgsConstructor
public class AttendanceDetailResponseDto {
    private String name;
    private String photo;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date date;
    private Time forthTime;
    private Time backTime;
    private Time forthTimeCheck;
    private Time backTimeCheck;
    private String parentName;
    private String phoneNumber;
    private String tempParentName;
    private String tempPhoneNumber;
    private String backWay;

}
