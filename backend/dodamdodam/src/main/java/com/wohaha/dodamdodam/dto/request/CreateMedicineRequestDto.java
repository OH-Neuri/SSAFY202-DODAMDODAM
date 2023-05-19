package com.wohaha.dodamdodam.dto.request;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CreateMedicineRequestDto {

    private Long kidSeq;
    private String symptom;
    private String pill;
    private String capacity;
    private String count;
    private String time;
    private String keep;
    private String content;
    private String requestName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date requestDate;

}
