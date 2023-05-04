package com.wohaha.dodamdodam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class DodamdodamApplication {

	public static void main(String[] args) {
		SpringApplication.run(DodamdodamApplication.class, args);
	}

}
