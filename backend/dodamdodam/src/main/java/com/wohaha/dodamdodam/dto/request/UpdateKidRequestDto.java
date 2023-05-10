package com.wohaha.dodamdodam.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UpdateKidRequestDto {
    private Long kidSeq;
    private String kidName;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;

    private MultipartFile photo;

    private String gender;

    private Long classSeq;

}
