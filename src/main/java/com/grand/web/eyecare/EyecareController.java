package com.grand.web.eyecare;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class EyecareController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @RequestMapping(value = "/eyecare/checkup", method = RequestMethod.GET)
    public String checkup(Locale locale) throws Exception{
 
        return "/front/eyecare/eyecare_checkup";
    }
    
    @RequestMapping(value = "/eyecare/sty", method = RequestMethod.GET)
    public String sty(Locale locale) throws Exception{
 
        return "/front/eyecare/eyecare_sty";
    }
    
    @RequestMapping(value = "/eyecare/dry", method = RequestMethod.GET)
    public String dry(Locale locale) throws Exception{
 
        return "/front/eyecare/eyecare_dry";
    }
    
    @RequestMapping(value = "/eyecare/allergy", method = RequestMethod.GET)
    public String allergy(Locale locale) throws Exception{
 
        return "/front/eyecare/eyecare_allergy";
    }
}
