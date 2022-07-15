package com.grand.web.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grand.web.test.service.TestService;
import com.grand.web.test.vo.TestVO;

@Controller
public class TestController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private TestService testService;
	
	
    @RequestMapping(value = "/test/test1.do", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> home(Locale locale, Model model) throws Exception{
 
        logger.info("home");
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        List<TestVO> memberList = testService.selectMember();
        map.put("info", memberList);
 
        return map;
    }
	
	
    @RequestMapping(value = "/test/test2.do", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> home2(Locale locale, Model model) throws Exception{
 
        logger.info("home");
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        List<TestVO> memberList = testService.selectMember();
        map.put("info", memberList);
 
        return map;
    }    
	
    @RequestMapping(value = "/test/testPage.do", method = RequestMethod.GET)
	public String testPage(Locale locale, Model model) {
    		logger.info("Welcome home! The client locale is {}.", locale);
    		
    		Date date = new Date();
    		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    		
    		String formattedDate = dateFormat.format(date);
    		
    		model.addAttribute("serverTime", formattedDate );
    		
    		return "test1";
		
	}
    
    @RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> inset(TestVO vo) throws Exception{
    	
    	logger.info("inset");
    	
    	logger.info( vo.getId() );
    	logger.info( vo.getName() );
    	
    	
    	int result = testService.insertMember(vo);
    	Map<String, Object> map = new HashMap<String, Object>();
        List<TestVO> memberList = testService.selectMember();
        map.put("info", "Y");
        
    	
    	return map;
    }    
    
    @RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateMember(TestVO vo) throws Exception{
    	
    	logger.info("update");
    	int result = testService.updateMember(vo);
    	
    	 Map<String, Object> map = new HashMap<String, Object>();
         
         List<TestVO> memberList = testService.selectMember();
         map.put("info", memberList);
         
    	return map;
    }    
    
}
