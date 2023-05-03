package com.wohaha.dodamdodam.dto.response.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class KidListResponseDto {

    private Long kidSeq;

    private String kidName;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date birth;

    private String photo;

    private String gender;

    private Long classSeq;

    private String className;
}
