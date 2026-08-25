package com.dru.Skillgraph.service;

import com.dru.Skillgraph.repository.GraphRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GraphService {

    private final GraphRepository graphRepository;

    public GraphService(GraphRepository graphRepository) {
        this.graphRepository = graphRepository;
    }

    public List<Map<String, Object>> findDevelopersByJobRole(String roleName) {
        return graphRepository.findDevelopersByJobRole(roleName);
    }

    public Map<String, Object> findSkillDetails(String skillName) {
        return graphRepository.findSkillDetails(skillName);
    }

    public Map<String, Object> findSkillGraph(String skillName) {
        return graphRepository.findSkillGraph(skillName);
    }

    public List<Map<String, Object>> findDevelopersBySkill(String skillName) {
        return graphRepository.findDevelopersBySkill(skillName);
    }
}