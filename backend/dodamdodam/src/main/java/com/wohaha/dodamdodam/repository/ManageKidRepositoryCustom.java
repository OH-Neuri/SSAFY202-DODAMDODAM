package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.KidResponseDto;

import java.util.List;

public interface ManageKidRepositoryCustom {
    //아이리스트 조회
    List<KidResponseDto> kidList();

    //아이 1명 조회
    KidResponseDto kidInfo(long kidSeq);

    //아이 정보 업데이트 - 사진 없을때
    void updateKidNotPhoto(UpdateKidRequestDto updateKidRequestDto);

    //아이 정보 업데이트 - 사진 있을때
    void updateKidWithPhoto(UpdateKidRequestDto updateKidRequestDto);

    //아이 삭제
    void deleteKid(long kidSeq);
}
