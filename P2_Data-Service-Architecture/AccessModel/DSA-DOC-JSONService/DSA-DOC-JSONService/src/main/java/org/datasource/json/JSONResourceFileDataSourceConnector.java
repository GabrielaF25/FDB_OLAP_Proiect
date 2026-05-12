package org.datasource.json;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import java.io.File;
import java.nio.file.StandardCopyOption;
import java.util.logging.Logger;

@Component
public class JSONResourceFileDataSourceConnector {
	private static Logger logger = Logger.getLogger(JSONResourceFileDataSourceConnector.class.getName());

	@Value("${json.data.source.file.path}")
	protected String JSONFilePath;
	//
	protected File JSONFile;

	public File getJSONFile() throws Exception {
		logger.info("Filepath accessed: " + this.JSONFilePath);
		if (this.JSONFile == null) {
			this.JSONFile = new File(this.JSONFilePath);
			if(!this.JSONFile.exists()){
				this.JSONFile = new File("temp.xml");
				java.nio.file.Files.copy(
						new ClassPathResource(this.JSONFilePath).getInputStream(),
						this.JSONFile.toPath(),
						StandardCopyOption.REPLACE_EXISTING);
				logger.info("... loaded from ClassPathResource!");
			}else
				logger.info("... loaded from local FileSystem!");
		}
		return JSONFile;
	}
}
