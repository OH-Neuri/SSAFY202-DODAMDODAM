package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public interface NoticeRepository extends JpaRepository<Notice,Long>, NoticeRepositoryCustom {
}
