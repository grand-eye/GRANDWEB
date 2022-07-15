package com.grand.admin.member;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.grand.admin.member.service.TblMemberService;
import com.grand.admin.member.vo.TblMemberVO;
import com.grand.util.IpCommon;


@Controller
public class TblMemberControler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private TblMemberService tblMemberService;
	
	@RequestMapping(value = "/admin/member/member", method = RequestMethod.GET)
	public String eventList(Model model) {
		model.addAttribute("_prefix", "_member");
		return "admin/member/member";
	}	
	
	@RequestMapping(value = "/admin/interface/selectMemberList")
	@ResponseBody
	public Map<String, Object> selectMemberList(Locale locale, Model model, TblMemberVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		int memberCount = tblMemberService.selectMemberCount(vo);		
		List<TblMemberVO> memberList = tblMemberService.selectMemberList(vo);
		
		map.put("total", memberCount);
		map.put("rows", memberList);

		return map;

	}
	
	@RequestMapping(value = "/admin/member/memberForm", method = RequestMethod.GET)
	public String memberForm(Model model, TblMemberVO vo) throws Exception  {
						
	   		model.addAttribute("_prefix", "_memberForm");
	   		model.addAttribute("_member", vo);
	   		
	   		return "admin/member/memberForm";
	}
	
	
	@RequestMapping(value = "/admin/interface/selectMember")
	@ResponseBody
	public String selectMember(Locale locale, Model model, TblMemberVO vo) throws Exception {
		
		TblMemberVO menber 	= tblMemberService.selectMember(vo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writeValueAsString(menber);
        return jsonInString;		

	}
	
    @RequestMapping(value = "/admin/interface/insertMember", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertEvent(Model model, TblMemberVO vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultCode", "N");
        
        IpCommon ipSet 		= new IpCommon();		
        String userIp				= ipSet.getClientIpAddress(req);
        String userIpServer	= ipSet.getLocalServerIp();
        vo.setTblDtmRegIp(userIp);
        
        int insertCount	= tblMemberService.insertMember(vo);
        if ( insertCount > 0) 
        {
            map.put("resultCode", "Y");
        }
        map.put("resultCount", insertCount);
        return map;
	}	    
    
    @RequestMapping(value = "/admin/interface/deleteMember", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteEvent(Model model, TblMemberVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("resultCode", "N");
        
		/*
		 * int deleteCount = tblMemberService.deleteMember(vo); if ( deleteCount > 0) {
		 * map.put("resultCode", "Y"); }
		 */
        
        return map;
	}
    
    @RequestMapping("/admin/member/excelDownload")
    public String excelTransform(@RequestParam Map<String, Object> paramMap, Map<String, Object> ModelMap, HttpServletResponse response, TblMemberVO vo) throws Exception{

        String file 		 		= paramMap.get("file").toString();
        String excelType  	= paramMap.get("target").toString();
         
        //response.setHeader("Content-disposition", "attachment; filename=" + file + ".xlsx"); 
        response.setHeader("Content-Disposition", "attachment; filename="+new String(file.getBytes("euc-kr"),"8859_1")+".xlsx");
        
        vo.setListType("excel");
        
        List<TblMemberVO> excelList= tblMemberService.selectMemberList(vo); 
         
        ModelMap.put("excelList", excelList); 
        ModelMap.put("target", excelType);
        ModelMap.put("file", file);
        
        return "excelView";
 
    }
	
}
