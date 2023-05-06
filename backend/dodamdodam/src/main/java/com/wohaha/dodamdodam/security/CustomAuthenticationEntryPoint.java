package com.wohaha.dodamdodam.security;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wohaha.dodamdodam.exception.BaseResponseStatus;
import com.wohaha.dodamdodam.util.JsonUtils;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

//Spring Security 내에서 전역적으로 사용되는 EntryPoint
//authenticate 과정에서 에러가 발생하면 (anonymous user일 경우) ExceptionTranslationFilter에서 넘어옴
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException {

        authException.printStackTrace();

        if (authException instanceof InsufficientAuthenticationException) {
            JsonUtils.writeJsonExceptionResponse(response, BaseResponseStatus.TOKEN_NULL_ERROR);
        }

    }
}
