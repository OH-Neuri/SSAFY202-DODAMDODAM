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
public class CreateKidRequestDto {

    private String kidName;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;

    private String photo;

    private String gender;

    private Long classSeq;

}
