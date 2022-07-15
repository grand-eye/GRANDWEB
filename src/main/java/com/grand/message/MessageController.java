package com.grand.message;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grand.message.service.MessageService;
import com.grand.message.vo.MessageVO;
import com.grand.web.test.service.TestService;
import com.grand.web.test.vo.TestVO;

@Controller
public class MessageController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Value("#{config['GRAND_URL']}") private String GRAND_URL;
	
	
	@Inject
	private MessageService messageService;
	
	
    @RequestMapping(value = "/admin/manager/message", method = RequestMethod.GET)
	public String testPage(Locale locale, Model model) {
    		model.addAttribute("_prefix", "_message");
    		return "admin/message/message";
		
	}	
    
    
    @RequestMapping(value = "/admin/interface/insertMessageCode", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertMessageCode(Locale locale, Model model, MessageVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int insertCount	= messageService.insertMessageCode(vo);
        String result = "Y";
        if ( insertCount > 0)
        {
            map.put("resultCode", "Y");
        }
        else
        {
            map.put("resultCode", "N");
        }
        
        map.put("resultCount", insertCount);
        return map;
	}	    
    
    @RequestMapping(value = "/admin/interface/selectExistsMessageCode", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectExistsMessageCode(Locale locale, Model model, MessageVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int existsCount	= messageService.selectExistsMessageCode(vo);
        
        String result = "Y";
        if ( existsCount > 0)
        {
        	result = "N";
        }
        else
        {
        	result = "Y";
        }
       
        map.put("resultCode", result);
        map.put("resultCodeExists", existsCount);
        return map;
		
	}	    
	
    
    @RequestMapping(value = "/admin/interface/selectMessage", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectMessage(Locale locale, Model model, MessageVO vo) throws Exception {
        logger.info("home");
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        int messageCount 						= messageService.selectMessageCount(vo);
        List<MessageVO> messageList 	= messageService.selectMessage(vo);
        
        map.put("rows", messageList);
        map.put("total", messageCount);

 
        return map;
		
	}	    
	
}
