package com.grand.web.intro;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grand.util.SMSComponent;


@Controller
public class IntroController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @RequestMapping(value = "/intro/grand", method = RequestMethod.GET)
    public String communityList(Locale locale) throws Exception{
 
        return "/front/intro/grand_introduce";
    }
    
    @RequestMapping(value = "/intro/doctor", method = RequestMethod.GET)
    public String introduceDoctor(Locale locale) throws Exception{
 
        return "/front/intro/grand_doctor";
    }
    
    @RequestMapping(value = "/intro/equipment", method = RequestMethod.GET)
    public String introduceEquipment(Locale locale) throws Exception{
 
        return "/front/intro/grand_equipment";
    }
    
    @RequestMapping(value = "/intro/info", method = RequestMethod.GET)
    public String introInfo(Locale locale) throws Exception{
 
        return "/front/intro/grand_information";
    }
    
    @RequestMapping(value = "/intro/partnership", method = RequestMethod.GET)
    public String introPartner(Locale locale) throws Exception{
 
        return "/front/intro/grand_partnership";
    }
    
    @RequestMapping(value="/intro/interface/sendMsg")
	@ResponseBody
	public Map<String, Object> sendMsg(@RequestParam(value="strDestList", required=false ,defaultValue="0") String strDestList,@RequestParam(value="strCallBack" , required=false ,defaultValue="0") String strCallBack,@RequestParam(value="strSubject", required=false ,defaultValue="0") String strSubject
			,@RequestParam(value="strData", required=false ,defaultValue="0") String strData,@RequestParam(value="nCount", required=false ,defaultValue="0") int nCount) throws Exception {
		
		SMSComponent sms = new SMSComponent();
		String resultMsg = sms.SendMsg(strDestList, strCallBack, strSubject, strData, nCount);
		Map<String, Object> resMsg = new HashMap<String, Object>();
		resMsg.put("result", resultMsg);
		return resMsg;
	}
    
}
