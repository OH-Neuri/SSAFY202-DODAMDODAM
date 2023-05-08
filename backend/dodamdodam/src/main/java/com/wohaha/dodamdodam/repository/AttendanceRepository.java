package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Kid;
import com.wohaha.dodamdodam.dto.response.KidAttendanceListResponseDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface AttendanceRepository extends JpaRepository<Kid, Long>, AttendanceRepositoryCustom {
}

