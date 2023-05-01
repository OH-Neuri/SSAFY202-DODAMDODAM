package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.ClassInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManageClassRepository extends JpaRepository<ClassInfo, Long>, ManageClassRepositoryCustom {


}
