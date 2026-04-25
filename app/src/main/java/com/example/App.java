package com.example;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String home() {
        return "🚀 App is running successfully!";
    }

    @GetMapping("/health")
    public String health() {
        return "OK";
    }
}