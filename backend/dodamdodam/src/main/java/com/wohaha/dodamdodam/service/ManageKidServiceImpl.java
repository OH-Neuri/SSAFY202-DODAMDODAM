package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.dto.response.request.CreateKidRequestDto;
import lombok.RequiredArgsConstructor;
import org.jboss.jandex.ClassInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ManageKidServiceImpl implements ManageKidService{
    @Override
    public boolean createKid(CreateKidRequestDto createKidRequestDto) {
        //dto to entity
        //ClassInfo class = Class.builder()

        return true;
    }
}
