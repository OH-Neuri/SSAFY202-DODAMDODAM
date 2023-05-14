package com.wohaha.dodamdodam.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CreateNoticeRequestDto {

    private Long classSeq;

    private boolean announcement;

    private List<MultipartFile> photos;

    private String kid;

    private String content;
}
