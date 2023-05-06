package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.ClassInfo;
import com.wohaha.dodamdodam.domain.Medicine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicineRepository extends JpaRepository<Medicine, Long>, MedicineRepositoryCustom {


}
