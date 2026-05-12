package org.datasource;

import org.datasource.json.extramedical.*;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.logging.Logger;

@RestController
@RequestMapping("/locations")
public class RESTViewServiceJSON {

	private static Logger logger = Logger.getLogger(RESTViewServiceJSON.class.getName());

	@RequestMapping(value = "/ping", method = RequestMethod.GET,
			produces = {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String pingDataSource() {
		logger.info(">>>> RESTViewServiceJSON is Up!");
		return "Ping response from RESTViewServiceJSON!";
	}

	@RequestMapping(value = "/ExtraMedicalDataView", method = RequestMethod.GET,
			produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	public List<ExtraMedicalDataView> get_ExtraMedicalDataView() {
		return ExtraMedicalDataViewBuilder.build();
	}
}