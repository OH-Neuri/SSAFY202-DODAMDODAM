package com.wohaha.dodamdodam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManageKidRepository extends JpaRepository<Class, String>, ManageKidRepositoryCustom {

}
