package com.grand.web.retina;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class RetinaController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @RequestMapping(value = "/retina/bimun", method = RequestMethod.GET)
    public String bimun(Locale locale) throws Exception{
 
        return "/front/retina/retina_bimun";
    }
    
    @RequestMapping(value = "/retina/diabetic", method = RequestMethod.GET)
    public String diabetic(Locale locale) throws Exception{
 
        return "/front/retina/retina_diabetic";
    }
    
    @RequestMapping(value = "/retina/gc", method = RequestMethod.GET)
    public String gc(Locale locale) throws Exception{
 
        return "/front/retina/retina_gc";
    }
    
    @RequestMapping(value = "/retina/md", method = RequestMethod.GET)
    public String md(Locale locale) throws Exception{
 
        return "/front/retina/retina_md";
    }
    
    @RequestMapping(value = "/retina/shottreat", method = RequestMethod.GET)
    public String shottreat(Locale locale) throws Exception{
 
        return "/front/retina/retina_shottreat";
    }
}
