package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Kindergarten;
import com.wohaha.dodamdodam.domain.KindergartenInfo;
import com.wohaha.dodamdodam.dto.request.KindergartenReqeustDto;
import com.wohaha.dodamdodam.repository.KindergartenInfoRepository;
import java.util.List;

import com.wohaha.dodamdodam.repository.KindergartenRepository;
import com.wohaha.dodamdodam.security.CustomAuthenticatedUser;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class KindergartenServiceImpl implements KindergartenService {

  private final KindergartenInfoRepository kindergartenInfoRepository;
  private final KindergartenRepository kindergartenRepository;

  @Override
  public Boolean createKindergarten(KindergartenReqeustDto kindergartenReqeustDto) {
    Long userSeq = ((CustomAuthenticatedUser)SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
    System.out.println(userSeq);
    Kindergarten kindergarten = Kindergarten.builder()
            .userSeq(userSeq)
            .name(kindergartenReqeustDto.getName())
            .address(kindergartenReqeustDto.getAddress())
            .build();
    kindergartenRepository.save(kindergarten);
    return true;
  }


  @Override
  public List<KindergartenInfo> getKindergartenInfoList(String keyword) {
    return kindergartenInfoRepository.searchByKeyword(keyword);
  }
}
