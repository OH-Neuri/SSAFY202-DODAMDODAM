package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.request.CreateKidRequestDto;
import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.KidParentResponseDto;
import com.wohaha.dodamdodam.dto.response.KidResponseDto;

import java.util.List;

public interface ManageKidService {
    //아이 등록
    boolean createKid(CreateKidRequestDto createKidRequestDto, String uploadUrl);

    //아이리스트 조회
    List<KidResponseDto> kidList();
    //아이 1명 조회
    KidResponseDto kidInfo(long kidSeq);
    //아이 수정
    boolean updateKid(UpdateKidRequestDto updateKidRequestDto, String uploadUrl);

    //아이 삭제
    boolean deleteKid(long kidSeq);

    //아이에게 학부모 등록
    boolean createParentKid(Long userSeq, Long kidSeq);

    List<KidParentResponseDto> getKidParentList(Long classSeq);
}
