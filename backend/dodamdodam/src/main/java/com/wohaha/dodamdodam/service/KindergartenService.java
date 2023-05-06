package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.KindergartenInfo;

import java.util.List;

public interface KindergartenService {

  List<KindergartenInfo> getKindergartenInfoList(String keyword);

}
