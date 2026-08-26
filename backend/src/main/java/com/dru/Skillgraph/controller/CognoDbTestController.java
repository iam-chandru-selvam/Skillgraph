package com.dru.Skillgraph.controller;

import com.dru.Skillgraph.service.CognoDbTestService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CognoDbTestController {

    private final CognoDbTestService testService;

    public CognoDbTestController(CognoDbTestService testService) {
        this.testService = testService;
    }

    @GetMapping("/api/cognodb/test")
    public String testCognoDb() {

        return testService.testConnection();
    }
}