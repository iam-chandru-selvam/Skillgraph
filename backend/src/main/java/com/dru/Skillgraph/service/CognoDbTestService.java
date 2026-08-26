package com.dru.Skillgraph.service;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class CognoDbTestService {

    private static final Logger log =
            LoggerFactory.getLogger(CognoDbTestService.class);

    private final Driver driver;

    public CognoDbTestService(Driver driver) {
        this.driver = driver;
    }

    public String testConnection() {

        try (Session session = driver.session()) {

            return session.executeRead(tx ->
                    tx.run("""
                            RETURN 'CognoDB connection successful' AS message
                            """)
                            .single()
                            .get("message")
                            .asString()
            );

        } catch (Exception e) {

            log.error("========== CognoDB CONNECTION TEST FAILED ==========");
            log.error("Exception type: {}", e.getClass().getName());
            log.error("Exception message: {}", e.getMessage());
            log.error("Full CognoDB exception:", e);
            log.error("====================================================");

            throw e;
        }
    }
}