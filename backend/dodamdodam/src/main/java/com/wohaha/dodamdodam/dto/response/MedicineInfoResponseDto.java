package com.wohaha.dodamdodam.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor
public class MedicineInfoResponseDto {
    private Long medicineSeq;
    private Long kidSeq;
    private String symptom;
    private String pill;
    private String capacity;
    private String count;
    private String time;
    private String keep;
    private String content;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date requestDate;
    private String requestName;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date responseDate;
    private String responseName;

}
