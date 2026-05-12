package org.j4di;

import org.j4di.analytical.views.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Transactional(readOnly = true)
@RestController
@RequestMapping("/analytics")
public class HealthcareAnalyticsController {

    private final HealthcareAnalyticsRepository healthcareRepository;
    private final SpecializationAnalysisRepository specializationRepository;
    private final ClinicPerformanceRepository clinicRepository;
    private final RiskPatientsRepository riskRepository;
    private final DoctorAnalysisRepository doctorRepository;
    private final InsuranceAnalysisRepository insuranceRepository;

    public HealthcareAnalyticsController(
            HealthcareAnalyticsRepository healthcareRepository,
            SpecializationAnalysisRepository specializationRepository,
            ClinicPerformanceRepository clinicRepository,
            RiskPatientsRepository riskRepository,
            DoctorAnalysisRepository doctorRepository,
            InsuranceAnalysisRepository insuranceRepository
    ) {
        this.healthcareRepository = healthcareRepository;
        this.specializationRepository = specializationRepository;
        this.clinicRepository = clinicRepository;
        this.riskRepository = riskRepository;
        this.doctorRepository = doctorRepository;
        this.insuranceRepository = insuranceRepository;
    }

    // Main integrated healthcare view
    @GetMapping("/healthcare")
    public List<HealthcareAnalytics> getHealthcareAnalytics() {
        return healthcareRepository.findAll();
    }

    // OLAP - specialization analysis
    @GetMapping("/specialization-analysis")
    public List<SpecializationAnalysis> getSpecializationAnalysis() {
        return specializationRepository.findAll();
    }

    // OLAP - clinic performance
    @GetMapping("/clinic-performance")
    public List<ClinicPerformance> getClinicPerformance() {
        return clinicRepository.findAll();
    }

    // OLAP - risk patients
    @GetMapping("/risk-patients")
    public List<RiskPatients> getRiskPatients() {
        return riskRepository.findAll();
    }

    // OLAP - doctor analysis
    @GetMapping("/doctor-analysis")
    public List<DoctorAnalysis> getDoctorAnalysis() {
        return doctorRepository.findAll();
    }

    // OLAP - insurance analysis
    @GetMapping(value="/insurance-analysis", produces = "application/json")
    public List<InsuranceAnalysis> getInsuranceAnalysis() {
        return insuranceRepository.findAll();
    }
}