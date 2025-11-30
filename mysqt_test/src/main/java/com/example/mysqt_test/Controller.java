package com.example.mysqt_test;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @Value("${spring.datasource.password}")
    private String dbPassword;


    @GetMapping("/db")
    public String test(){
        return dbPassword;
    }
}
