package org.j4di.analytical.views;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HealthcareAnalyticsRepository
        extends JpaRepository<HealthcareAnalytics, Long> {
}
