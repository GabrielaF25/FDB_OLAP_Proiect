package org.j4di.analytical.views;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "vw_olap_risk_patients")
@Data
public class RiskPatients {
    @Id
    @Column(name = "smoking_status")
    private String smokingStatus;

    @Column(name = "physical_activity")
    private String physicalActivity;

    @Column(name = "blood_type")
    private String bloodType;

    @Column(name = "total_records")
    private Long totalRecords;

    @Column(name = "average_age")
    private Double averageAge;

    @Column(name = "unique_patients")
    private Long uniquePatients;
}