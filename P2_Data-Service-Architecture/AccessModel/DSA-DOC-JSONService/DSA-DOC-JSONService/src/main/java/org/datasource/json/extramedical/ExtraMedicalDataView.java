package org.datasource.json.extramedical;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor(force = true)
public class ExtraMedicalDataView implements Serializable {

    private Long patient_id;
    private String occupation;
    private String marital_status;
    private String blood_type;
    private String smoking_status;
    private String alcohol_consumption;
    private String physical_activity;
    private EmergencyContact emergency_contact;
    private Insurance insurance;
    private String preferred_language;
    private String transportation;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor(force = true)
    public static class EmergencyContact implements Serializable {
        private String name;
        private String relationship;
        private String phone;
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor(force = true)
    public static class Insurance implements Serializable {
        private String provider;
        private String policy_number;
    }
}