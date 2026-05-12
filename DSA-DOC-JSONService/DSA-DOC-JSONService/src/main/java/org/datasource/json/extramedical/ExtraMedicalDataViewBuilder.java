package org.datasource.json.extramedical;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.core.io.ClassPathResource;

import java.io.InputStream;
import java.util.List;

public class ExtraMedicalDataViewBuilder {

    public static List<ExtraMedicalDataView> build() {
        try {
            ObjectMapper mapper = new ObjectMapper();

            InputStream inputStream =
                    new ClassPathResource("datasource/ExtraMedicalData.json")
                            .getInputStream();

            return mapper.readValue(
                    inputStream,
                    new TypeReference<List<ExtraMedicalDataView>>() {}
            );

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}