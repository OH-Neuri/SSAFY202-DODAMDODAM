package com.wohaha.dodamdodam.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncodeUtils {

  public static String encode(String password) {
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    return passwordEncoder.encode(password);
  }

  public static boolean matches(String rawPassword, String encodedPassword) {
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    return passwordEncoder.matches(rawPassword, encodedPassword);
  }
}
