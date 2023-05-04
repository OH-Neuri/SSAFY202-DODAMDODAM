package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.CreateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.request.UpdateClassRequestDto;
import com.wohaha.dodamdodam.dto.response.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KidListResponseDto;

import java.util.List;

public interface ManageKidService {
    //아이 등록
    boolean createKid(CreateKidRequestDto createKidRequestDto, String uploadUrl);

    //아이 조회
    List<KidListResponseDto> kidList();

    //아이 수정
    boolean updateKid(UpdateKidRequestDto updateKidRequestDto);

    //아이 삭제
    boolean deleteKid(long kidSeq);
}
