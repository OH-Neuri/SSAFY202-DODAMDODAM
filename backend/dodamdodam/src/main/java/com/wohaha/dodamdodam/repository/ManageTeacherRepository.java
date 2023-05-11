package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.ClassTeacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManageTeacherRepository extends JpaRepository<ClassTeacher,Long>,ManageTeacherRepositoryCustom {
}
