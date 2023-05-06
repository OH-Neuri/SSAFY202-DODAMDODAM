package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.ClassTeacher;
import com.wohaha.dodamdodam.domain.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClassTeacherRepository extends JpaRepository<ClassTeacher, Long>, ClassTeacherRepositoryCustom {
}
