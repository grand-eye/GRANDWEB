package com.grand.admin.code;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grand.admin.code.service.CodeService;
import com.grand.admin.code.vo.CodeDetailVO;
import com.grand.admin.code.vo.CodeVO;
import com.grand.admin.file.FileController;
import com.grand.admin.file.service.FileService;
import com.grand.message.vo.MessageVO;


@Controller
public class CodeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	
	
    @RequestMapping(value = "/admin/interface/insertCodeDetail", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertCodeDetail(Locale locale, Model model, CodeDetailVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int existsCount	= codeService.insertCodeDetail(vo);
        
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
	
    @RequestMapping(value = "/admin/interface/selectExistsCodeDetail", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectExistsCodeDetail(Locale locale, Model model, CodeDetailVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int existsCount	= codeService.selectExistsCodeDetail(vo);
        
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
    	
    @RequestMapping(value = "/admin/code/codeForm", method = RequestMethod.GET)
	public String codeForm(Locale locale, Model model, CodeDetailVO vo) {

		model.addAttribute("_prefix"				, "_codeForm");
		model.addAttribute("_codeDetail"		, vo);
		
		return "admin/code/codeForm";
		
	}
    	
	
	
    @RequestMapping(value = "/admin/code/codeSet", method = RequestMethod.GET)
	public String codeSet(Locale locale, Model model) {
    		model.addAttribute("_prefix", "_CodeSet");
    		return "admin/code/codeSet";
		
	}
    
    
    @RequestMapping(value = "/admin/interface/selectCodeDetailNoRoot", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectCodeDetailNoRoot(Locale locale, Model model, CodeDetailVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
        Map<String, Object> resultData = new HashMap<String, Object>();
        
        map.put("rows", codeService.selectCodeDetail(vo));
        return map;
	}    
    
    @RequestMapping(value = "/admin/interface/selectCodeDetail", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectCodeDetail(Locale locale, Model model, CodeDetailVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
        Map<String, Object> resultData = new HashMap<String, Object>();
        
        resultData.put("tcd_code"   	, "" );
        resultData.put("tcd_index"   	, "" );
        resultData.put("tcd_title"     	, "root");
        resultData.put("tcd_useyn"  	, "Y");
        resultData.put("tcd_attr1"  	, "");
        resultData.put("tcd_attr2"  	, "");
        resultData.put("tcd_attr3"  	, "");
        resultData.put("children"  , codeService.selectCodeDetail(vo));

        list.add((HashMap<String, Object>) resultData);
        
        map.put("rows", list);
        return map;
	}
    
    @RequestMapping(value = "/admin/interface/selectCodeDetailTree", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> selectCodeDetailTree(Locale locale, Model model, CodeDetailVO vo) throws Exception {
    	Map<String, Object> map = new HashMap<String, Object>();
        ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
        Map<String, Object> resultData = new HashMap<String, Object>();
        
        resultData.put("id"  				, "root");
        resultData.put("tcd_title" 		 	, "즐겨찾기매장");
        resultData.put("tcd_code" 		 	, "All");
        resultData.put("tcd_attr1" 		 	, "");
        resultData.put("children"  , codeService.selectCodeDetail(vo));
        	
        list.add((HashMap<String, Object>) resultData);
        map.put("rows", list);

        return map;
	}    

    @RequestMapping(value = "/admin/interface/insertCode", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertCode(Locale locale, Model model, CodeVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int existsCount	= codeService.insertCode(vo);
        
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
    
    @RequestMapping(value = "/admin/interface/selectMasterCode", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectMasterCode(Locale locale, Model model, CodeVO vo) throws Exception {
        logger.info("home");
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        int messageCount 						= codeService.selectMasterCodeCount(vo);
        List<CodeVO> messageList 	= codeService.selectMasterCode(vo);
        
        map.put("rows", messageList);
        map.put("total", messageCount);

        return map;
		
	}	    
    
    @RequestMapping(value = "/admin/interface/selectExistsCodeID", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectExistsCodeID(Locale locale, Model model, CodeVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int existsCount	= codeService.selectExistsCodeID(vo);
        
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
    
    
    
	
	
}
