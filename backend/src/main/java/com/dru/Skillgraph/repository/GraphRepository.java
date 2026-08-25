package com.dru.Skillgraph.repository;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Record;
import org.neo4j.driver.Session;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GraphRepository {

    private final Driver driver;

    public GraphRepository(Driver driver) {
        this.driver = driver;
    }

    // Find developers who have skills required by a specific job role
    public List<Map<String, Object>> findDevelopersByJobRole(String roleName) {

        String cypher = """
                MATCH (d:Developer)-[:HAS_SKILL]->(s:Skill)
                      <-[:REQUIRES]-(r:JobRole)
                WHERE r.name = $roleName
                RETURN d.name AS developer,
                       collect(s.name) AS matchingSkills,
                       count(s) AS matchCount
                ORDER BY matchCount DESC
                """;

        try (Session session = driver.session()) {

            return session.executeRead(tx ->
                    tx.run(cypher, Map.of("roleName", roleName))
                            .list(Record::asMap)
            );
        }
    }

    // Find developers who have a particular skill
    public List<Map<String, Object>> findDevelopersBySkill(String skillName) {

        String cypher = """
                MATCH (d:Developer)-[:HAS_SKILL]->(s:Skill)
                WHERE toLower(s.name) = toLower($skillName)
                RETURN d.name AS developer,
                       d.location AS location,
                       d.experienceYears AS experienceYears
                ORDER BY d.name
                """;

        try (Session session = driver.session()) {

            return session.executeRead(tx ->
                    tx.run(cypher, Map.of("skillName", skillName))
                            .list(Record::asMap)
            );
        }
    }

    // Find complete details about a skill
    public Map<String, Object> findSkillDetails(String skillName) {

        String cypher = """
                MATCH (s:Skill)
                WHERE toLower(s.name) = toLower($skillName)

                OPTIONAL MATCH (d:Developer)-[:HAS_SKILL]->(s)

                OPTIONAL MATCH (s)-[:RELATED_TO]-(related:Skill)

                OPTIONAL MATCH (r:JobRole)-[:REQUIRES]->(s)

                RETURN s.name AS skill,
                       collect(DISTINCT {
                           name: d.name,
                           location: d.location,
                           experienceYears: d.experienceYears
                       }) AS developers,
                       collect(DISTINCT related.name) AS relatedSkills,
                       collect(DISTINCT r.name) AS jobRoles
                """;

        try (Session session = driver.session()) {

            return session.executeRead(tx ->
                    tx.run(cypher, Map.of("skillName", skillName))
                            .single()
                            .asMap()
            );
        }
    }

    // Find graph relationships around a skill
    public Map<String, Object> findSkillGraph(String skillName) {

        String cypher = """
                MATCH (d:Developer)-[r:HAS_SKILL]->(s:Skill)
                WHERE toLower(s.name) = toLower($skillName)
                RETURN d.name AS sourceName,
                       'Developer' AS sourceType,
                       s.name AS targetName,
                       'Skill' AS targetType,
                       type(r) AS relationship

                UNION ALL

                MATCH (s:Skill)-[r:RELATED_TO]->(related:Skill)
                WHERE toLower(s.name) = toLower($skillName)
                RETURN s.name AS sourceName,
                       'Skill' AS sourceType,
                       related.name AS targetName,
                       'Skill' AS targetType,
                       type(r) AS relationship

                UNION ALL

                MATCH (role:JobRole)-[r:REQUIRES]->(s:Skill)
                WHERE toLower(s.name) = toLower($skillName)
                RETURN role.name AS sourceName,
                       'JobRole' AS sourceType,
                       s.name AS targetName,
                       'Skill' AS targetType,
                       type(r) AS relationship
                """;

        try (Session session = driver.session()) {

            List<Record> records = session.executeRead(tx ->
                    tx.run(cypher, Map.of("skillName", skillName))
                            .list()
            );

            Map<String, Map<String, Object>> nodes =
                    new java.util.LinkedHashMap<>();

            List<Map<String, Object>> links =
                    new java.util.ArrayList<>();

            for (Record record : records) {

                String sourceName = record.get("sourceName").asString();
                String sourceType = record.get("sourceType").asString();

                String targetName = record.get("targetName").asString();
                String targetType = record.get("targetType").asString();

                String relationship =
                        record.get("relationship").asString();

                String sourceId = sourceType + ":" + sourceName;
                String targetId = targetType + ":" + targetName;

                nodes.putIfAbsent(
                        sourceId,
                        Map.of(
                                "id", sourceId,
                                "label", sourceName,
                                "type", sourceType
                        )
                );

                nodes.putIfAbsent(
                        targetId,
                        Map.of(
                                "id", targetId,
                                "label", targetName,
                                "type", targetType
                        )
                );

                links.add(
                        Map.of(
                                "source", sourceId,
                                "target", targetId,
                                "label", relationship
                        )
                );
            }

            return Map.of(
                    "nodes", nodes.values(),
                    "links", links
            );
        }
    }
}