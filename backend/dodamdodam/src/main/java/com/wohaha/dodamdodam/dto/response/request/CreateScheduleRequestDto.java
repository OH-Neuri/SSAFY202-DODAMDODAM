package com.wohaha.dodamdodam.dto.response.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CreateScheduleRequestDto {
    private String content;
    private Long scheduleTypeSeq;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
}
