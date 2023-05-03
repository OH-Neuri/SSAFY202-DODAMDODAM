package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Kid;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManageKidRepository extends JpaRepository<Kid,Long>, ManageKidRepositoryCustom {
}
