package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Kindergarten;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FoodRepository extends JpaRepository<Kindergarten, Long>, FoodRepositoryCustom {
}
