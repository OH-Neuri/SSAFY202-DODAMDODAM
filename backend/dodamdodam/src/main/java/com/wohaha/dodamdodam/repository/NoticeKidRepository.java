package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.NoticeKid;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeKidRepository extends JpaRepository<NoticeKid,Long> {
}
