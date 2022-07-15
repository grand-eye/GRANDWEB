package com.grand.admin.dm;

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

import com.grand.admin.dm.service.TblSmslogsService;
import com.grand.admin.dm.vo.SmsMsgSetVO;
import com.grand.admin.dm.vo.TblSmsConfigVO;
import com.grand.admin.dm.vo.TblSmslogsVO;


@Controller
public class TblSmslogsControler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private TblSmslogsService tblSmslogsService;
	
	@RequestMapping(value = "/admin/dm/smslogs", method = RequestMethod.GET)
	public String smslogsList(Model model) {
		model.addAttribute("_prefix", "_smslogs");
		return "admin/dm/smslogs";
	}	
	
	@RequestMapping(value = "/admin/interface/selectSmslogsList")
	@ResponseBody
	public Map<String, Object> selectSmsLogsList(Locale locale, Model model, TblSmslogsVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		int smslogsCount = tblSmslogsService.selectSmslogsCount(vo);		
		List<TblSmslogsVO> smsLogsList = tblSmslogsService.selectSmslogsList(vo);
		
		map.put("total", smslogsCount);
		map.put("rows", smsLogsList);

		return map;

	}
	
	@RequestMapping(value = "/admin/dm/smsMsgSet", method = RequestMethod.GET)
	public String smsMsgSet(Model model) {
		model.addAttribute("_prefix", "_smsMsgSet");
		return "admin/dm/smsMsgSet";
	}	
	
	@RequestMapping(value = "/admin/interface/selectSmsMsgSetList")
	@ResponseBody
	public Map<String, Object> selectSmsMsgSetList(Locale locale, Model model, SmsMsgSetVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		int smsMsgCount = tblSmslogsService.selectSmsMsgCount(vo);		
		List<SmsMsgSetVO> smsMsgList = tblSmslogsService.selectSmsMsgList(vo);
		
		map.put("total", smsMsgCount);
		map.put("rows", smsMsgList);

		return map;

	}
	
	@RequestMapping(value = "/admin/interface/insertSmsMsgSet")
	@ResponseBody
	public Map<String, Object> insertSmsMsgSet(Locale locale, Model model, SmsMsgSetVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		 int insertCount	= tblSmslogsService.insertSmsMsgSet(vo);
		 
		 if ( insertCount > 0) 
	        {
				map.put("resultCode", "Y");
	        } else {
				map.put("resultCode", "N");
			}
		 map.put("resultCount", insertCount);

		return map;

	}
	
	@RequestMapping(value = "/admin/dm/smsConfig", method = RequestMethod.GET)
	public String smsConfig(Model model) {
		model.addAttribute("_prefix", "_smsConfig");
		return "admin/dm/smsConfig";
	}	
	
	@RequestMapping(value = "/admin/interface/selectSmsConfig")
	@ResponseBody
	public Map<String, Object> selectSmsConfig(Locale locale, Model model, TblSmsConfigVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		List<TblSmsConfigVO> smsConfig = tblSmslogsService.selectSmsConfig(vo);
		
		map.put("rows", smsConfig);

		return map;

	}
	
	@RequestMapping(value = "/admin/interface/updateSmsConfig")
	@ResponseBody
	public Map<String, Object> updateSmsConfig(Locale locale, Model model, TblSmsConfigVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		 int updateCount	= tblSmslogsService.updateSmsConfig(vo);
		 
		 if ( updateCount > 0) 
	        {
				map.put("resultCode", "Y");
	        } else {
				map.put("resultCode", "N");
			}
		 
		 map.put("resultCount", updateCount);

		return map;

	}
	
	@RequestMapping(value = "/admin/dm/smsMsgSend", method = RequestMethod.GET)
	public String smsMsgSend(Model model) {
		model.addAttribute("_prefix", "_smsMsgSend");
		return "admin/dm/smsMsgSend";
	}	
	
	
}
