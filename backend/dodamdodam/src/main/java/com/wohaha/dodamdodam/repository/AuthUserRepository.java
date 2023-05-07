package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.AuthUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthUserRepository extends CrudRepository<AuthUser, String> {

}

