package com.wohaha.dodamdodam.config;

public class Constants {
    //URIS
    public static final String[] SECURITY_WEB_EXCLUDE_URIS = {"/resources/**", "/csrf", "/error", "/swagger*/**", "favicon.ico", "/webjars/**","/swagger-ui/**"};
    public static final String[] SECURITY_HTTP_EXCLUDE_URIS = {"/v3/api-docs/**", "/swagger-ui/**", "/swagger-resources/**"};
    public static final String[] CORS_HEADER_URIS = {"Authorization", "Refresh", "content-type"};


}
