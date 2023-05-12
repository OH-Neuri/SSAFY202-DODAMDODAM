package com.wohaha.dodamdodam.security;

import java.util.Collection;
import java.util.Collections;

import com.wohaha.dodamdodam.util.JwtTokenUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

@Service
public class JwtTokenProvider{

    // token에 담겨있는 정보를 이용해 Authentication 객체를 리턴
    public Authentication getAuthentication(String token) {

        String role = JwtTokenUtils.getClaimAttribute(token, "role");
        Collection<SimpleGrantedAuthority> authorities = Collections.singleton(new SimpleGrantedAuthority(role));
        String userSeq = JwtTokenUtils.getClaimAttribute(token, "userSeq");

        CustomAuthenticatedUser cau = new CustomAuthenticatedUser(authorities, Long.valueOf(userSeq), Integer.valueOf(role), true);
        return cau;
    }


}
