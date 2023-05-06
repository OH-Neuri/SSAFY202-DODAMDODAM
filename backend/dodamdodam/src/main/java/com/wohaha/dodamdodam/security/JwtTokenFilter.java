package com.wohaha.dodamdodam.security;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wohaha.dodamdodam.config.Constants;
import com.wohaha.dodamdodam.exception.BaseException;
import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.util.JwtTokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

public class JwtTokenFilter extends OncePerRequestFilter {

    private final AntPathMatcher antPathMatcher = new AntPathMatcher();
    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        try{
            String jwt = JwtTokenUtils.resolveAccessToken(request);
            if(jwt!=null){
                if(JwtTokenUtils.isValidToken(jwt)){
                    Authentication authentication = jwtTokenProvider.getAuthentication(jwt); // 정상 토큰이면 SecurityContext 저장
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                } else{ //만료된 경우
                    throw new BaseException(BaseResponseStatus.TOKEN_EXPIRED);
                }
            }
        } catch (BaseException e){
            request.setAttribute("exception", e.getStatus().name());
        }
        doFilter(request, response, filterChain);
    }
}
