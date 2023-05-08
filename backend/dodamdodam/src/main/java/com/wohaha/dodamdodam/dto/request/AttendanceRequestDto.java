package com.wohaha.dodamdodam.dto.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter
public class AttendanceRequestDto {
    private Long seq;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate day;

}
