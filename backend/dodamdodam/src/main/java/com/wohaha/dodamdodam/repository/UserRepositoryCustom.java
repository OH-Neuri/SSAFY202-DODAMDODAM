package com.wohaha.dodamdodam.repository;

import com.wohaha.dodamdodam.domain.User;
import java.util.Optional;

public interface UserRepositoryCustom {

  boolean isSignedUp(String phone, Integer role);

  Optional<User> findUserByIdAndRole(String id, Integer role);

}
