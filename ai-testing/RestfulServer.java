
// Description: This is a test file for the AI testing framework
// Author: Michael Hunsinger
// Restful server for test access token and authonization for postman testing 

package com.example.demo;       
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@SpringBootApplication

@RestController

public class RestfulServer {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
        
    }

    @RequestMapping("/test")
    public String test() {
        return "Hello World!";
    }

}


