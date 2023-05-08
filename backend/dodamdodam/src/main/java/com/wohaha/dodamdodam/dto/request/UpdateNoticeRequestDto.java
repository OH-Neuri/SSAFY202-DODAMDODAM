package com.wohaha.dodamdodam.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UpdateNoticeRequestDto {
    private List<String> photo;

    private String content;


}
