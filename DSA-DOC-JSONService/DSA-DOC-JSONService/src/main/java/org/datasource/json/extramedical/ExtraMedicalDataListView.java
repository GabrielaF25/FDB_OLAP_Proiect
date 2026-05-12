package org.datasource.json.extramedical;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor(force = true)
public class ExtraMedicalDataListView {

    private List<ExtraMedicalDataView> extraMedicalData;
}