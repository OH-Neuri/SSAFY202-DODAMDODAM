package com.wohaha.dodamdodam.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CompleteMedicineRequestDto {

    private Long medicineSeq;
    private String responseName;
    //private String responseSignUrl;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime responseDate;

}
