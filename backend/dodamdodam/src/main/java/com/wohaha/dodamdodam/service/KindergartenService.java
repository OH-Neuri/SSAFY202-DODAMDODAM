package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Kindergarten;
import com.wohaha.dodamdodam.domain.KindergartenInfo;
import com.wohaha.dodamdodam.dto.request.KindergartenReqeustDto;

import java.util.List;

public interface KindergartenService {
    Boolean createKindergarten(KindergartenReqeustDto kindergartenReqeustDto);

    Kindergarten getKindergarten();

    Boolean updateKindergarten(KindergartenReqeustDto kindergartenReqeustDto);

    List<KindergartenInfo> getKindergartenInfoList(String keyword);

}
