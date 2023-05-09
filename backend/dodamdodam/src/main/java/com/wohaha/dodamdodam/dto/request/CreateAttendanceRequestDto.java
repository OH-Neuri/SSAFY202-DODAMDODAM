package com.wohaha.dodamdodam.dto.request;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Time;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CreateAttendanceRequestDto {
    private Long kidSeq;
    private Time forthTime;
    private Time backTime;
    private String backWay;
    private String parentName;
    private String phoneNumber;
    private String tempParentName;
    private String tempPhoneNumber;
    private MultipartFile sign;
}
