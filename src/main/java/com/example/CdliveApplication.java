package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class CdliveApplication {


	@GetMapping(value = "/hi", produces = MediaType.APPLICATION_JSON_VALUE)
	String hi (){
		return "ohai";
	}

	public static void main(String[] args) {
		SpringApplication.run(CdliveApplication.class, args);
	}
}


