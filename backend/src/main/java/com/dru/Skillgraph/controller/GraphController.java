package com.dru.Skillgraph.controller;

import com.dru.Skillgraph.service.GraphService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class GraphController {

    private final GraphService graphService;

    public GraphController(GraphService graphService) {
        this.graphService = graphService;
    }

    @GetMapping("/api/developers")
    public List<Map<String, Object>> getDevelopersBySkill(
            @RequestParam String skill
    ) {
        return graphService.findDevelopersBySkill(skill);
    }

    @GetMapping("/api/skills")
    public Map<String, Object> getSkillDetails(
            @RequestParam String name
    ) {
        return graphService.findSkillDetails(name);
    }

    @GetMapping("/api/graph")
    public Map<String, Object> getSkillGraph(
            @RequestParam String name
    ) {
        return graphService.findSkillGraph(name);
    }

    @GetMapping("/api/recommendations")
    public List<Map<String, Object>> getRecommendations(
            @RequestParam String role
    ) {
        return graphService.findDevelopersByJobRole(role);
    }
}