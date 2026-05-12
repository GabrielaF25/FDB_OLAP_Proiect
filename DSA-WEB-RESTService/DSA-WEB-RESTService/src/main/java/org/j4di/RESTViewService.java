package org.j4di;

import org.j4di.analytical.views.HealthcareAnalytics;
import org.j4di.analytical.views.HealthcareAnalyticsRepository;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.logging.Logger;

@RestController
@RequestMapping("/OLAP")
public class RESTViewService {

	private static Logger logger = Logger.getLogger(RESTViewService.class.getName());

	private final HealthcareAnalyticsRepository healthcareAnalyticsRepository;

	public RESTViewService(HealthcareAnalyticsRepository healthcareAnalyticsRepository) {
		this.healthcareAnalyticsRepository = healthcareAnalyticsRepository;
	}

	@GetMapping(value = "/ping", produces = MediaType.TEXT_PLAIN_VALUE)
	public String pingDataSource() {
		logger.info(">>>> DSA-WEB-RESTService is Up!");
		return "Ping response from DSA-WEB-RESTService!";
	}

	@GetMapping(value = "/VW_HEALTHCARE_ANALYTICS",
			produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public List<HealthcareAnalytics> getHealthcareAnalytics() {
		return healthcareAnalyticsRepository.findAll();
	}
}