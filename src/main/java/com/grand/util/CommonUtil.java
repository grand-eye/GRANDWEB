package com.grand.util;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class CommonUtil {
	
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapFromJsonObject( JSONObject jsonObj ) {
		Map<String, Object> map = null;
		try {
			map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class) ;
		} catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return map;
	}
	
	public static <T> List<Map<String, Object>> convertListToMap(Collection<T> target) {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		
		for (T element : target) {
			Map<String,Object> resultMap = new HashMap<String,Object>();
			Field[] fieldList = element.getClass().getDeclaredFields();
			if (fieldList != null && fieldList.length > 0) {
				try {
					for (int i = 0; i < fieldList.length; i++) {
						String curInsName = fieldList[i].getName();
						Field field = element.getClass().getDeclaredField(curInsName);
						field.setAccessible(true);
						Object targetValue = field.get(element);
						resultMap.put(curInsName, targetValue);
					}
					resultList.add(resultMap);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return resultList;
	}
	
	
	
}
