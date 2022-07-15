package com.grand.util;

import java.net.URI;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialArray;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.parser.JSONParser;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import org.json.simple.JSONObject;

public class IpApi {

	private static final String[] IP_HEADER_CANDIDATES = { 
		    "X-Forwarded-For",
		    "Proxy-Client-IP",
		    "WL-Proxy-Client-IP",
		    "HTTP_X_FORWARDED_FOR",
		    "HTTP_X_FORWARDED",
		    "HTTP_X_CLUSTER_CLIENT_IP",
		    "HTTP_CLIENT_IP",
		    "HTTP_FORWARDED_FOR",
		    "HTTP_FORWARDED",
		    "HTTP_VIA",
		    "REMOTE_ADDR" 
	};

	
	
	public HashMap<String, String> getLngLatMap(HttpServletRequest request){
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		try {
			JSONParser parser = new JSONParser();
			
			IpCommon ipSet = new IpCommon();
			
			
			String userIp = ipSet.getLocalServerIp();		// 아이피가 Proxy환경등에서 정상적으로 가져올수 없기 때문에 별도 로직을 추가
			
			userIp = "106.10.56.78";
			RestTemplate restTemplate = new RestTemplate();
			String jsonString = restTemplate.getForObject("http://ip-api.com/json/{userip}", String.class, userIp);
			JSONObject jsonObject = (JSONObject) parser.parse(jsonString);
			
			if(jsonObject.get("status").toString().equals("success")){
				map.put("lat", jsonObject.get("lat").toString());
				map.put("lng", jsonObject.get("lon").toString());
				map.put("countr yCode", jsonObject.get("countryCode").toString());
				map.put("status", "success");
			}else{
				map.put("status", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", "fail");
		}
		return map;
	}
	
	
    private RestTemplate getRestTempalte() {
        HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
        factory.setReadTimeout(1000 * 60 * 5);  // 5분
        factory.setConnectTimeout(5000);
        RestTemplate restTemplate = new RestTemplate(factory);
        return restTemplate;
    }

    
	public static String getClientIpAddress(HttpServletRequest request) {
	    for (String header : IP_HEADER_CANDIDATES) {
	        String ip = request.getHeader(header);
	        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
	            return ip;
	        }
	    }
	    return request.getRemoteAddr();
	}	
}
