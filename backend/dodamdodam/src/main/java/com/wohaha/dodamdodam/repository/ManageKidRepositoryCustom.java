package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.response.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.response.KidListResponseDto;

import java.util.List;

public interface ManageKidRepositoryCustom {
    //아이 조회
    List<KidListResponseDto> kidList();

    //아이 정보 업데이트 - 사진 없을때
    void updateKidNotPhoto(UpdateKidRequestDto updateKidRequestDto);

    //아이 정보 업데이트 - 사진 있을때
    void updateKidWithPhoto(UpdateKidRequestDto updateKidRequestDto);

    //아이 삭제
    void deleteKid(long kidSeq);
}
