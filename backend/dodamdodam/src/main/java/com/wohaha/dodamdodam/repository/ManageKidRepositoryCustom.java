package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.dto.request.UpdateKidRequestDto;
import com.wohaha.dodamdodam.dto.response.AttendanceInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.KidInfoResponseDto;
import com.wohaha.dodamdodam.dto.response.KidParentResponseDto;
import com.wohaha.dodamdodam.dto.response.KidResponseDto;

import java.util.List;
import java.util.Optional;

public interface ManageKidRepositoryCustom {
    //아이리스트 조회
    List<KidResponseDto> kidList(Long kindergartenSeq);

    //아이 1명 조회
    KidResponseDto kidInfo(long kidSeq);

    //아이 정보 업데이트 - 사진 없을때
    void updateKidNotPhoto(UpdateKidRequestDto updateKidRequestDto);

    //아이 정보 업데이트 - 사진 있을때
    void updateKidWithPhoto(UpdateKidRequestDto updateKidRequestDto,String uploadUrl);

    //아이 삭제
    void deleteKid(long kidSeq);

    //아이 seq로 부모 seq 조회
    long findParentSeqByKidSeq(long kidSeq);

    Optional<KidInfoResponseDto> findKidInfoByKidSeq(Long kidSeq);

    List<KidInfoResponseDto> findKidListByUserSeq(Long userSeq);

    List<KidParentResponseDto> getKidParentList(Long classSeq);

    AttendanceInfoResponseDto getKidInfo(Long kidSeq);
}
