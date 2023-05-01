package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Kindergarten;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import java.util.Optional;

@Repository
public interface KindergartenRepository extends JpaRepository<Kindergarten, Long>, KindergartenRepositoryCustom {

}
