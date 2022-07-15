package com.grand.admin.banner;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grand.admin.banner.service.BannerService;
import com.grand.admin.banner.service.BannerwebService;
import com.grand.admin.banner.vo.BannerVO;
import com.grand.admin.banner.vo.BannerwebVO;


@Controller
public class BannerController {
	
	private static final Logger logger = LoggerFactory.getLogger(BannerController.class);
	
	@Resource(name="bannerService")
	private BannerService bannerService;
	
	 @Resource(name="bannerwebService")
		private BannerwebService bannerwebService;
	
	
    @RequestMapping(value = "/admin/banner/bannerForm", method = RequestMethod.GET)
	public String bannerForm(Locale locale, Model model, BannerVO vo) {
   		model.addAttribute("_prefix", "_bannerForm");
   		model.addAttribute("_banner", vo);
   		
   		return "admin/banner/bannerForm";
	}	
    	
	
    @RequestMapping(value = "/admin/banner/bannerManage", method = RequestMethod.GET)
	public String bannerManage(Locale locale, Model model) {
    		logger.info("Welcome home! The client locale is {}.", locale);
    		
    		model.addAttribute("_prefix", "_bannerManage");
    		
    		return "admin/banner/bannerManage";
		
	}	
    
    @RequestMapping(value = "/admin/interface/insertBanner", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertBanner(Locale locale, Model model, BannerVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int insertCount	= bannerService.insertbannerInfo(vo);
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
    
    @RequestMapping(value = "/admin/interface/insertBannersub", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertBannersub(Locale locale, Model model, BannerVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        if(vo.getBannersub_idx().equals(""))
        {
        	vo.setBannersub_idx(null);
        }
        int insertCount	= bannerService.insertbannersubInfo(vo);
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
    
    @RequestMapping(value = "/admin/interface/selectBannerInfo", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectBannerInfo(Locale locale, Model model, BannerVO vo) throws Exception {

    	Map<String, Object> map = new HashMap<String, Object>();
        int bannerCount 						= bannerService.selectbannerInfoCount(vo);
        List<BannerVO> bannerList 			= bannerService.selectbannerInfo(vo);
        
        map.put("rows", bannerList);
        map.put("total", bannerCount);
        return map;
	}
    
    @RequestMapping(value = "/admin/interface/selectBannersubInfo", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectBannersubInfo(Locale locale, Model model, BannerVO vo) throws Exception {

    	Map<String, Object> map = new HashMap<String, Object>();
        int bannersubCount 						= bannerService.selectbannersubInfoCount(vo);
        List<BannerVO> bannersubList 			= bannerService.selectbannersubInfo(vo);
        
        map.put("rows", bannersubList);
        map.put("total", bannersubCount);
        return map;
	}

    @RequestMapping(value = "/admin/interface/deleteBannerInfo", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteBannerInfo(Locale locale, Model model, BannerVO vo) throws Exception {

    	Map<String, Object> map = new HashMap<String, Object>();
        int deleteBannerInfo 						= bannerService.deleteBannerInfo(vo);
        
        map.put("result", deleteBannerInfo);
        return map;
	}
    
    
    @RequestMapping(value = "/admin/interface/selectBannersubUpdateInfo", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectBannersubUpdateInfo(Locale locale, Model model, BannerVO vo) throws Exception {

    	Map<String, Object> map = new HashMap<String, Object>();
        List<BannerVO> bannersubList 			= bannerService.selectBannersubUpdateInfo(vo);
        
        map.put("rows", bannersubList);
        return map;
	}
    
	
	/*
	 * @RequestMapping(value = "/admin/banner/bannerManage", method =
	 * RequestMethod.GET) public String bannerManage(Locale locale, Model model) {
	 * model.addAttribute("_prefix", "_bannerwebList");
	 * model.addAttribute("bannersub_parentidx", "52"); return
	 * "admin/banner/bannerList";
	 * 
	 * }
	 */
    
    @RequestMapping(value = "/admin/interface/selectBannerwebInfo", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectBannerwebInfo(Locale locale, Model model, BannerwebVO vo) throws Exception {

    	Map<String, Object> map = new HashMap<String, Object>();
        int bannersubCount 						= bannerwebService.selectbannerwebInfoCount(vo);
        List<BannerwebVO> bannerwebList 			= bannerwebService.selectbannerwebInfo(vo);
        
        map.put("rows", bannerwebList);
        map.put("total", bannersubCount);
        return map;
	}

    @RequestMapping(value = "/grand/interface/selectBannercommonInfo", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectBannercommonInfo(Locale locale, Model model, BannerwebVO vo) throws Exception {
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<BannerwebVO> bannerwebcommon = bannerwebService.selectBannercommonInfo(vo);
        map.put("row", bannerwebcommon);
        return map;
	}
    
}
