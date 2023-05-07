package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.KindergartenInfo;
import java.util.List;

public interface KindergartenInfoRepositoryCustom {

  List<KindergartenInfo> searchByKeyword(String keyword);

}
