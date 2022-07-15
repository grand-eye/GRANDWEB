package com.grand.web.presbyopia;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class PresbyopiaController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @RequestMapping(value = "/presbyopia/care", method = RequestMethod.GET)
    public String care(Locale locale) throws Exception{
 
        return "/front/presbyopia/presbyopia_care";
    }
    
    @RequestMapping(value = "/presbyopia/clinic", method = RequestMethod.GET)
    public String clinic(Locale locale) throws Exception{
 
        return "/front/presbyopia/presbyopia_clinic";
    }
    
    @RequestMapping(value = "/presbyopia/premium", method = RequestMethod.GET)
    public String premium(Locale locale) throws Exception{
 
        return "/front/presbyopia/presbyopia_premium";
    }
    
}
