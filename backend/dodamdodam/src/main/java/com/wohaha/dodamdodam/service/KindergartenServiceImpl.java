package com.wohaha.dodamdodam.service;

import com.wohaha.dodamdodam.domain.Kindergarten;
import com.wohaha.dodamdodam.domain.KindergartenInfo;
import com.wohaha.dodamdodam.dto.request.KindergartenReqeustDto;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
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
  public Kindergarten getKindergarten() {
    Long userSeq = ((CustomAuthenticatedUser)SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
    Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
            .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));
    return kindergartenRepository.findById(kindergartenSeq).orElseThrow(() -> new BaseException(BaseResponseStatus.KINDERGARTEN_NULL_FAIL));
  }

  @Override
  public Boolean updateKindergarten(KindergartenReqeustDto kindergartenReqeustDto) {
    Long userSeq = ((CustomAuthenticatedUser)SecurityContextHolder.getContext().getAuthentication()).getUserSeq();
    Long kindergartenSeq = kindergartenRepository.findKindergartenSeqByUserSeq(userSeq)
            .orElseThrow(() -> new BaseException(BaseResponseStatus.UNREGISTERED_KINDERGARTEN));
    return kindergartenRepository.updateKindergarten(kindergartenSeq, kindergartenReqeustDto) > 0;
  }


  @Override
  public List<KindergartenInfo> getKindergartenInfoList(String keyword) {
    return kindergartenInfoRepository.searchByKeyword(keyword);
  }
}
