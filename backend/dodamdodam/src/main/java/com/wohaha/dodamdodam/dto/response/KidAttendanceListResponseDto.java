package com.wohaha.dodamdodam.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Time;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class KidAttendanceListResponseDto {
    private Long kidSeq;
    private String name;
    private String photo;
    private Long attendanceSeq;
    private Time forthTimeCheck;
    private Time backTimeCheck;
}
