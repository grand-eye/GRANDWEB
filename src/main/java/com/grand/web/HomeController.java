package com.grand.web;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Value("#{config['GRAND_URL']}") private String svrURI;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale) throws Exception {
		return "front/index";
	}	
	
	
	@RequestMapping(value = "/pub/{fm}/{pm}", method = RequestMethod.GET)
	public String html5View(@PathVariable String fm, @PathVariable String pm,  Model model) throws Exception {
		return "/front/" + fm + "/" + pm;
	}	
		
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String indexMain(Locale locale) throws Exception {
		return "front/index";
	}
	
	@RequestMapping(value = "/nonbenefit", method = RequestMethod.GET)
	public String nonbenefit(Locale locale) throws Exception {
		return "/front/nonbenefit";
	}
	
	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public String privacy(Locale locale) throws Exception {
		return "/front/privacy";
	}
	
	@RequestMapping(value = "/right", method = RequestMethod.GET)
	public String right(Locale locale) throws Exception {
		return "/front/right";
	}
	
	@RequestMapping(value = "/terms", method = RequestMethod.GET)
	public String terms(Locale locale) throws Exception {
		return "/front/terms";
	}
	
}
