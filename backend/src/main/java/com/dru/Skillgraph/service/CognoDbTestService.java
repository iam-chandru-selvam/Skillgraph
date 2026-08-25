package com.dru.Skillgraph.service;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Session;
import org.springframework.stereotype.Service;

@Service
public class CognoDbTestService {

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
        }
    }
}