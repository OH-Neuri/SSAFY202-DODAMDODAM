package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Auth;
import com.wohaha.dodamdodam.domain.KindergartenInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KindergartenInfoRepository extends JpaRepository<KindergartenInfo, Long>, KindergartenInfoRepositoryCustom {

}
