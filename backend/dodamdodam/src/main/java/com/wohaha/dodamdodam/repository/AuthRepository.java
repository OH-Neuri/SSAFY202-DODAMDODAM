package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.Auth;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthRepository extends JpaRepository<Auth, String>, AuthRepositoryCustom {

}
