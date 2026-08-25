package com.dru.Skillgraph.config;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Session;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;

@Configuration
public class DatabaseSeeder {

    @Bean
    CommandLineRunner seedDatabase(Driver driver) {
        return args -> {

            Path seedFile = Path.of("../database/seed.cypher");

            if (!Files.exists(seedFile)) {
                System.out.println("Seed file not found: " + seedFile.toAbsolutePath());
                return;
            }

            String cypher = Files.readString(seedFile);

            String[] statements = Arrays.stream(cypher.split(";"))
                    .map(String::trim)
                    .filter(statement -> !statement.isBlank())
                    .toArray(String[]::new);

            try (Session session = driver.session()) {

                int executed = 0;

                for (String statement : statements) {

                    session.executeWrite(tx -> {
                        tx.run(statement).consume();
                        return null;
                    });

                    executed++;
                }

                System.out.println(
                        "Database seeding completed. Statements executed: " + executed
                );
            }
        };
    }
}