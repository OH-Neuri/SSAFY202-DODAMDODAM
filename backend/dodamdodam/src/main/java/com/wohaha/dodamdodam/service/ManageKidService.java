package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.CreateKidRequestDto;

public interface ManageKidService {
    //아이 등록
    boolean createKid(CreateKidRequestDto createKidRequestDto);
}
