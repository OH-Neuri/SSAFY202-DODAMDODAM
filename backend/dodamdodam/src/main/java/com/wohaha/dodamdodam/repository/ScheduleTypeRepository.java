package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.ScheduleType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScheduleTypeRepository extends JpaRepository<ScheduleType, Long>, ScheduleTypeRepositoryCustom {
}
