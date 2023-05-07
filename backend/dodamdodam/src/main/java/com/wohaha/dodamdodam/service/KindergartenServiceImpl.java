package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.KindergartenInfo;
import com.wohaha.dodamdodam.repository.KindergartenInfoRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class KindergartenServiceImpl implements KindergartenService {

  @Autowired
  KindergartenInfoRepository kindergartenInfoRepository;

  @Override
  public List<KindergartenInfo> getKindergartenInfoList(String keyword) {
    return kindergartenInfoRepository.searchByKeyword(keyword);
  }
}
