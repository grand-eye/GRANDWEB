package com.grand.admin.landing;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.grand.admin.landing.service.TblLandingService;
import com.grand.admin.landing.vo.TblLandingVO;
import com.grand.message.service.MessageService;
import com.grand.message.vo.MessageVO;

@Controller
public class TblLandingControler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private TblLandingService tblLandingService;
	
	@Inject
	private MessageService messageService;
	
	@Value("#{file['webPath']}") 	private String webPath;
	
	@RequestMapping(value = "/admin/landing/landing", method = RequestMethod.GET)
	public String landing(Model model, TblLandingVO vo) throws Exception {
		
		model.addAttribute("_prefix", "_landing");
		model.addAttribute("_webPath", webPath);
		
		return "admin/landing/landing";
	}
	
	@RequestMapping(value = "/admin/interface/selectLandingList")
	@ResponseBody
	public Map<String, Object> selectLandingList(Locale locale, Model model, TblLandingVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		int landingCount = tblLandingService.selectLandingCount(vo);	
		List<TblLandingVO> landingList = null;
				
		if (landingCount > 0) {			
			landingList = tblLandingService.selectLandingList(vo);
		}
		
		map.put("total", landingCount);
		map.put("rows", landingList);

		return map;

	}
	
	@RequestMapping(value = "/admin/landing/landingForm")
	public String bannerForm(Locale locale, Model model, TblLandingVO vo) throws Exception  {
		
		MessageVO mvo = new MessageVO();
		mvo.setMsg_code( "landing" );
		mvo.setMsg_locale( locale.getCountry() );
		String messageDbString     = messageService.getMsg(mvo);
		
		model.addAttribute("_fileInfo"  , messageDbString);
		
		List<TblLandingVO> landingFileList = null;
		
		if( vo.getLanding_idx() > 0 ) {
			landingFileList = tblLandingService.selectLandingFileList(vo);
		}
		
		if( landingFileList != null && landingFileList.size() >0 ) {
			model.addAttribute("landingFileList", landingFileList);
		}
		
		model.addAttribute("_prefix", "_landingForm");
   		model.addAttribute("_landing"	, vo);
   		
   		return "admin/landing/landingForm";
   		
	}
	
	@RequestMapping(value = "/admin/landing/landingContent")
	public String bannerContent(Model model, TblLandingVO vo) throws Exception  {
		
		model.addAttribute("_prefix", "_landingContent");
   		model.addAttribute("_landing"	, vo);
   		
   		return "admin/landing/landingContent";
   		
	}
	
	@RequestMapping(value = "/admin/interface/selectLanding")
	@ResponseBody
	public String selectLanding(Locale locale, Model model, TblLandingVO vo) throws Exception {
		
		TblLandingVO landing 	= tblLandingService.selectLanding(vo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writeValueAsString(landing);
        return jsonInString;		

	}
	
	
	@RequestMapping(value = "/admin/interface/insertLanding", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertLanding(Model model, TblLandingVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int insertCount	= tblLandingService.insertLanding(vo);
          
        int insertFileCount = 0;
        
        if (vo.getLanding_idx() >  0 && vo.getFile_name() != "") {
        	
        	tblLandingService.deleteLandingFile(vo);
        	
			insertFileCount = tblLandingService.insertLandingFile(vo);
		}
        
        
        if ( insertCount > 0) 
        {        
        	if(vo.getFile_name() != ""){
        		if (insertFileCount > 0) {
					map.put("resultCode", "Y");
				} else {
					map.put("resultCode", "N");
				}
        	} else {        		
        		map.put("resultCode", "Y");			
        	}
        } else {
			map.put("resultCode", "N");
		}
        
        map.put("resultCount", insertCount);
        return map;
	}	 
	
	@RequestMapping(value = "/admin/interface/deleteLanding", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteLanding(Model model, TblLandingVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        int deleteCount	= tblLandingService.deleteLanding(vo);
                
        if ( deleteCount > 0) 
        {        	
			map.put("resultCode", "Y");			
        } else {
			map.put("resultCode", "N");
		}
        
        map.put("resultCount", deleteCount);
        return map;
	}	 
	
	@RequestMapping(value = "/admin/landing/{code}", method = RequestMethod.GET)
	public String landingPage(Locale locale, Model model, @PathVariable String code, TblLandingVO vo) throws Exception {
		
		vo.setLanding_path(code);
		
		model.addAttribute("_prefix", "_" + code);
		model.addAttribute("vo"	, vo);
		model.addAttribute("landing_path"	, code);
		
   		return "admin/landing/index";
	}
	
	@RequestMapping(value = "/admin/interface/selectLandingKeyCount")
	@ResponseBody
	public Map<String, Object> selectLandingKeyCount(Locale locale, Model model, TblLandingVO vo) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count 	= tblLandingService.selectLandingCount(vo);
		
		 if ( count > 0) 
        {        	
			map.put("result", "N");			
        } else {
			map.put("result", "Y");
		}
	        
	     map.put("resultCount", count);
	     return map;	

	}

	@RequestMapping(value = "/admin/landing/previewPopup")
	public String previewPopup(Locale locale, Model model, HttpServletRequest request) throws Exception {
		return "admin/landing/previewPopup";
	}
}
