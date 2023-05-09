package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Attendance;
import com.wohaha.dodamdodam.domain.Kid;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Long>, AttendanceRepositoryCustom {
}

