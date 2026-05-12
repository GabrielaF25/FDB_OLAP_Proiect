package org.j4di;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.JpaTransactionManager;
import jakarta.persistence.EntityManagerFactory;

@Configuration
public class HiveTransactionConfig {

    @Bean
    public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
        return new JpaTransactionManager(emf) {
            @Override
            protected void doCommit(
                    org.springframework.transaction.support.DefaultTransactionStatus status) {
                // no-op — Hive/Spark SQL nu suporta commit
            }
            @Override
            protected void doRollback(
                    org.springframework.transaction.support.DefaultTransactionStatus status) {
                // no-op — Hive/Spark SQL nu suporta rollback
            }
        };
    }
}