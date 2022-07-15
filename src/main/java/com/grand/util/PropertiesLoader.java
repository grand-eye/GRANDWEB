package com.grand.util;

import java.io.File;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesLoader {
	private static Properties properties = null;
	private static File propertiesFile = null;
	private static long propertiesLastModified = 0;
	public static Properties getInstance(){
		if(properties == null || propertiesFile.lastModified() != propertiesLastModified){
			try{
				PropertiesLoader loader = new PropertiesLoader();
				InputStream is = loader.getClass().getResourceAsStream("/resources/properties/file.properties");
				propertiesFile = new File(loader.getClass().getResource("/resources/properties/file.properties").getPath());
				propertiesLastModified = propertiesFile.lastModified();
				properties = new Properties();
				properties.load(is);
				is.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return properties;
	}
}
