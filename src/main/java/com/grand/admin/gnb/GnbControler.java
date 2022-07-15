package com.grand.admin.gnb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.grand.admin.code.vo.CodeDetailVO;
import com.grand.admin.gnb.service.GnbService;
import com.grand.admin.gnb.vo.GnbVO;
import com.grand.util.common.StringUtil;

@Controller
public class GnbControler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="gnbService")
	private GnbService gnbService;

	
	
    @RequestMapping(value = "/admin/interface/insertGnbRule", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertGnbRule(Locale locale, Model model, @RequestBody List<Map<String, Object>> param ) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        int result = gnbService.insertGnbRule(param);
        
        map.put("resultCount", result);
        return map;
	}	
	
    @RequestMapping(value = "/admin/manager/ruleSet", method = RequestMethod.GET)
	public String ruleSet(Locale locale, Model model) {
    		model.addAttribute("_prefix", "_GnbRuleSet");
    		return "admin/gnb/gnbRuleSet";
	}
    
    
	
    @RequestMapping(value = "/admin/gnb/gnbSet", method = RequestMethod.GET)
	public String gnbSet(Locale locale, Model model) {
    		model.addAttribute("_prefix", "_GnbSet");
    		return "admin/gnb/gnbSet";
	}
    
    
    
    @RequestMapping(value = "/admin/gnb/gnbForm", method = RequestMethod.GET)
	public String codeForm(Locale locale, Model model, GnbVO vo) throws Exception {
    	
    		int maxCount	= gnbService.selectGnbMax(vo);
    		
    		String padNew = StringUtil.lefPad(  (maxCount +1) + "" , 5 , "0");
    		String randomStr = StringUtil.getRandomString(6);
    		String new_code = vo.getS_category() + "_"+randomStr;

    		model.addAttribute("_prefix"				, "_gnbForm");
    		model.addAttribute("_gnb"				, vo);
    		model.addAttribute("_new"				, new_code);
    		return "admin/gnb/gnbForm";
	}
    	    

	
    @RequestMapping(value = "/admin/interface/insertGnb", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertCodeDetail(Locale locale, Model model, GnbVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int existsCount	= gnbService.insertGnb(vo);
        
        String result = "Y";
        if ( existsCount > 0)
        {
        	result = "Y";
        }
        else
        {
        	result = "N";
        }
       
        map.put("resultCode", result);
        map.put("resultCodeExists", existsCount);
        return map;
	}
    
    
    @RequestMapping(value = "/admin/interface/selectGnbMax", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectGnbMax(Locale locale, Model model, GnbVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        int maxCount	= gnbService.selectGnbMax(vo);

        map.put("maxCount", maxCount);
        return map;
		
	}	        
    
    @RequestMapping(value = "/admin/interface/selectExistsGnb", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectExistsGnb(Locale locale, Model model, GnbVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int existsCount	= gnbService.selectExistsGnb(vo);
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
    
    @RequestMapping(value = "/admin/interface/selectGnb", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectGnb(Locale locale, Model model, GnbVO vo) throws Exception {
    	Map<String, Object> map = new HashMap<String, Object>();
        ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
        Map<String, Object> resultData = new HashMap<String, Object>();
        
        String rootYN = vo.getS_root();
        String rootCategory = vo.getS_category();
        
        if( rootYN == null || rootYN.equals("") || rootYN.equals("Y") )
        {
            resultData.put("tm_code"   	, "" );
            resultData.put("tm_name"    , "root");
            resultData.put("tm_useyn"  	, "Y");
            resultData.put("id"  				, "root");
            
            if ( rootCategory.equals("GNB01") )
            {
            	resultData.put("text" 		 	, "Web Service");
            }
            else
            {
            	resultData.put("text" 		 	, "Administrator");
            }

            resultData.put("children"  , gnbService.selectGnb(vo));
            
            list.add((HashMap<String, Object>) resultData);
            map.put("rows", list);
        }
        else
        {
        	map.put("rows", gnbService.selectGnb(vo));
        }
        return map;
	}    
    
    @RequestMapping(value = "/admin/interface/deleteGnb", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteGnb(Locale locale, Model model, GnbVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        int result	= gnbService.deleteGnb(vo);
        
        String resultCode;
        
        if( result > 0 ) {
        	resultCode = "Y";
        }else {
        	resultCode = "N";
        }
        
        map.put("resultCode", resultCode);
        return map;
		
	}	
    
    @RequestMapping(value = "/admin/interface/selectGnbList", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectGnbLower(Locale locale, Model model, GnbVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        List<Map<String, Object>> selectGnbLower	= gnbService.selectGnbLower(vo);
       
        map.put("gnbList", selectGnbLower);
        return map;
		
	}
    
    
    
	
	
}
