//package com.example.gateway.config;
//
//import org.springframework.context.annotation.Bean;
////import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;
//import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
//
//public class CorsConfigurationSource {
//    @Bean
//    public CorsConfigurationSource corsConfigurationSource() {
//        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//        CorsConfiguration corsConfiguration = new CorsConfiguration();
//        corsConfiguration.addAllowedHeader("*");
//        corsConfiguration.addAllowedOrigin("*");
//        corsConfiguration.addAllowedMethod("*");
//        corsConfiguration.setAllowCredentials(true);
//        source.registerCorsConfiguration("/**", corsConfiguration);
//        return source;
//    }
//
//    @Bean
//    public CorsWebFilter corsWebFilter() {
//        return new CorsWebFilter(corsConfigurationSource());
//    }
//}
