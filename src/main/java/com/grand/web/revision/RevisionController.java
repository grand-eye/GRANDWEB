package com.grand.web.revision;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class RevisionController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @RequestMapping(value = "/revision/care", method = RequestMethod.GET)
    public String care(Locale locale) throws Exception{
 
        return "/front/revision/revision_care";
    }
    
    @RequestMapping(value = "/revision/dream", method = RequestMethod.GET)
    public String dream(Locale locale) throws Exception{
 
        return "/front/revision/revision_myopia";
    }
    
    @RequestMapping(value = "/revision/implant", method = RequestMethod.GET)
    public String implant(Locale locale) throws Exception{
 
        return "/front/revision/revision_implant";
    }
    
    @RequestMapping(value = "/revision/lasik", method = RequestMethod.GET)
    public String lasik(Locale locale) throws Exception{
 
        return "/front/revision/revision_lasik";
    }
    
    @RequestMapping(value = "/revision/premium", method = RequestMethod.GET)
    public String premium(Locale locale) throws Exception{
 
        return "/front/revision/revision_premium";
    }
    
    @RequestMapping(value = "/revision/myopia", method = RequestMethod.GET)
    public String myopia() throws Exception {

    	return "/front/revision/revision_myopia";
    }
}
