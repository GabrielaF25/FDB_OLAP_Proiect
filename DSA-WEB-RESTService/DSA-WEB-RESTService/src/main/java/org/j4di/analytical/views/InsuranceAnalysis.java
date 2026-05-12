package org.j4di.analytical.views;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "vw_olap_insurance_analysis")
public class InsuranceAnalysis {

    @Id
    @Column(name = "insurance_provider")
    private String insuranceProvider;

    @Column(name = "total_appointments")
    private Integer totalAppointments;

    @Column(name = "total_patients")
    private Integer totalPatients;

    @Column(name = "avg_age")
    private Double avgAge;

    @Column(name = "smokers_count")
    private Integer smokersCount;

    public String getInsuranceProvider() {
        return insuranceProvider;
    }

    public Integer getTotalAppointments() {
        return totalAppointments;
    }

    public Integer getTotalPatients() {
        return totalPatients;
    }

    public Double getAvgAge() {
        return avgAge;
    }

    public Integer getSmokersCount() {
        return smokersCount;
    }
}