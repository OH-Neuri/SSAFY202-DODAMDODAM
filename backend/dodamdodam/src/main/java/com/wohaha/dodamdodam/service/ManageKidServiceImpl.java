package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Kid;
import com.wohaha.dodamdodam.dto.response.request.CreateKidRequestDto;
import com.wohaha.dodamdodam.repository.ManageKidRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class ManageKidServiceImpl implements ManageKidService{
    @Autowired
    private ManageKidRepository manageKidRepository;
    @Override
    public boolean createKid(CreateKidRequestDto createKidRequestDto, String uploadUrl) {
        //dto to entity
        Kid kid = Kid.builder()
                .name(createKidRequestDto.getKidName())
                .birth(createKidRequestDto.getBirth())
                .photo(uploadUrl)
                .gender(createKidRequestDto.getGender())
                .classSeq(createKidRequestDto.getClassSeq())
                .build();
        //아이등록
        manageKidRepository.save(kid);

        return true;
    }
}
