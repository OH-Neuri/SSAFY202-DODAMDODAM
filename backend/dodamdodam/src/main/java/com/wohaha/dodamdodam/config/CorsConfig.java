package com.wohaha.dodamdodam.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class CorsConfig {
  @Bean
  public CorsFilter corsFilter() {

    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    CorsConfiguration config = new CorsConfiguration();

    //origin 설정 ??
//    config.addAllowedOriginPattern("*");
    config.addAllowedOrigin("http://localhost:3000");
//    config.setAllowCredentials(true);

    //method 설정
    config.addAllowedMethod("*");

    //custom header 설정
    config.addAllowedHeader("*");
    config.addExposedHeader("*");

    //모든 패턴 요청에 대해 해당 config 등록
    source.registerCorsConfiguration("/**", config);

    return new CorsFilter(source);
  }

}

