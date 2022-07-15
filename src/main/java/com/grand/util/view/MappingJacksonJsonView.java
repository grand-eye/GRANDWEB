package com.grand.util.view;

/**
 * @author Administrator
 *
 */
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;



public class MappingJacksonJsonView extends MappingJackson2JsonView {

	/**
	 * Default msie content type. Overridable as bean property.
	 */
	public static final String DEFAULT_MSIE_CONTENT_TYPE = "text/plain;charset=UTF-8";

	private String msieContentType = DEFAULT_MSIE_CONTENT_TYPE;

	public String getMsieContentType() {
		return msieContentType;
	}

	public void setMsieContentType(String msieContentType) {
		this.msieContentType = msieContentType;
	}

	@Override
	protected void prepareResponse(HttpServletRequest request, HttpServletResponse response) {
		super.prepareResponse(request, response);

		//System.err.println("agent :: " + request.getHeader("User-Agent"));
		
		if (StringUtils.contains(request.getHeader("User-Agent"), "MSIE")) {
			response.setContentType(getMsieContentType());
		}
	}
}