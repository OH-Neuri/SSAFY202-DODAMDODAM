package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.CreateKidRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.KidListResponseDto;

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

    //아이에게 학부모 등록
    boolean createParentKid(Long userSeq, Long kidSeq);
}
