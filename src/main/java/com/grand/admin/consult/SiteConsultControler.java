package com.grand.admin.consult;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.grand.admin.consult.service.SiteConsultService;
import com.grand.admin.consult.vo.SiteConsultVO;

@Controller
public class SiteConsultControler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private SiteConsultService siteConsultService;

	
    @RequestMapping(value = "/admin/consult/siteConsult", method = RequestMethod.GET)
	public String ruleSet(Locale locale, Model model) {
    		model.addAttribute("_prefix", "_siteConsult");
    		return "admin/consult/siteConsult";
	}
       
	@RequestMapping(value = "/admin/consult/siteConsultForm", method = RequestMethod.GET)
	public String siteConsultForm(Model model, SiteConsultVO vo) throws Exception  {
						
	   		model.addAttribute("_prefix", "_siteConsultForm");
	   		model.addAttribute("_siteConsult", vo);
	   		
	   		return "admin/consult/siteConsultForm";
	}
	
	
	@RequestMapping(value = "/admin/interface/selectSiteConsultList")
	@ResponseBody
	public Map<String, Object> selectsiteConsultList(Locale locale, Model model, SiteConsultVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		int count = siteConsultService.selectSiteConsultCount(vo);	
		List<SiteConsultVO> list = null;
				
		if (count > 0) {			
			list = siteConsultService.selectSiteConsultList(vo);
		}
		
		map.put("total", count);
		map.put("rows", list);

		return map;

	}
	
	@RequestMapping(value = "/admin/interface/selectSiteConsult")
	@ResponseBody
	public String selectSiteConsult(Locale locale, Model model, SiteConsultVO vo) throws Exception {
		
		SiteConsultVO siteConsult 	= siteConsultService.selectSiteConsult(vo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writeValueAsString(siteConsult);
        return jsonInString;		

	}
	
	@RequestMapping(value = "/admin/interface/updateSiteConsult", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> updateSiteConsult(Model model, SiteConsultVO vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultCode", "N");
        
        
        int updateCount	= siteConsultService.updateSiteConsult(vo);
        
        if ( updateCount > 0) 
        {
            map.put("resultCode", "Y");
        }
        map.put("resultCount", updateCount);
        return map;
	}
	
	@RequestMapping(value = "/admin/interface/updateSiteConsultGrid", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> updateSiteConsultGrid(HttpServletRequest req, @RequestBody SiteConsultVO vo) throws Exception {
		
		System.out.println(vo);
		
        Map<String, Object> map = new HashMap<String, Object>();

        siteConsultService.updateSiteConsultGrid(vo,req);
        
        return map;
	}
	
	@RequestMapping("/admin/consult/excelDownload")
    public String excelTransform(@RequestParam Map<String, Object> paramMap, Map<String, Object> ModelMap, HttpServletResponse response, SiteConsultVO vo) throws Exception{

        String file 		 		= paramMap.get("file").toString();
        String excelType  	= paramMap.get("target").toString();
        String searchType  = paramMap.get("searchType").toString();
        
        //response.setHeader("Content-disposition", "attachment; filename=" + file + ".xlsx"); 
        response.setHeader("Content-Disposition", "attachment; filename="+new String(file.getBytes("euc-kr"),"8859_1")+".xlsx");
        
        if( !searchType.equals("") && searchType != null ) {        	
        	vo.setMh_type(searchType);
        }
        
        vo.setListType("excel");
        
        
        
        List<SiteConsultVO> excelList= siteConsultService.selectSiteConsultList(vo); 
         
        ModelMap.put("excelList", excelList); 
        ModelMap.put("target", excelType);
        ModelMap.put("file", file);
        
        return "excelView";
 
    }
	
}
