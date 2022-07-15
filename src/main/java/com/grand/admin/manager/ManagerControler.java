package com.grand.admin.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.grand.admin.manager.service.ManagerService;
import com.grand.admin.manager.vo.ManagerHistoryVO;
import com.grand.admin.manager.vo.ManagerVO;
import com.grand.util.CommonUtil;
import com.grand.util.IpCommon;
import com.grand.util.common.StringUtil;

@Controller
public class ManagerControler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="managerService")
	private ManagerService managerService;
	
	
    @RequestMapping(value = "/admin/manager/manager", method = RequestMethod.GET)
	public String testPage(Locale locale, Model model) {
    		model.addAttribute("_prefix", "_manager");
    		return "admin/manager/managerSet";
	}		
    
    
    @RequestMapping(value = "/admin/manager/managerForm", method = RequestMethod.GET)
	public String managerForm(Locale locale, Model model, ManagerVO vo) {
    		model.addAttribute("_prefix", "_managerForm");
    		model.addAttribute("_vo", vo);
    		
    		return "admin/manager/managerForm";
	}		    
    
    
    @RequestMapping(value = "/admin/interface/selectGetManager", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectGetManager(Locale locale, Model model, ManagerVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        List<ManagerVO> managerList 		= managerService.selectGetManager(vo);
        map.put("rows", managerList);

        return map;
	}	    

    
    @RequestMapping(value = "/admin/interface/selectExistsManagerID", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectExistsManagerID(Locale locale, Model model, ManagerVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int existsCount	= managerService.selectExistsManagerID(vo);
        
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
    
    
    @RequestMapping(value = "/admin/interface/logOut", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> AdminLogOut(Locale locale, Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	Map<String, Object> map = new HashMap<String, Object>();

    	HttpSession session = req.getSession();
    	
    	session.removeAttribute("GRANDADM_MANAGER_ID");
    	session.removeAttribute("GRANDADM_MANAGER_NM");
    	session.removeAttribute("GRANDADM_LOGIN_DT");
    	session.removeAttribute("GRANDADM_GRP_CD");
    	session.removeAttribute("GRANDADM_GRP_NM");
    	session.removeAttribute("GRANDADM_TEAM_CD");
    	session.removeAttribute("GRANDADM_TEAM_NM");
   	
    	map.put("resultCode"	, "Y");
    	return map;
    }       
    
    
    
    @RequestMapping(value = "/adm/interface/selectManagerLogin", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectManagerLogin(Locale locale, Model model, ManagerVO vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        List<ManagerVO> managerList 		= managerService.selectManagerLogin(vo);
        HttpSession session = req.getSession();
        
        session.setMaxInactiveInterval(60 * 60);	// 세션 유지시간 1시간으로..
		
        if ( managerList.size() > 0 )
        {
    		List<Map<String, Object>> managerMap = null;
    		managerMap = CommonUtil.convertListToMap(managerList);	
    		
    		ManagerVO vvo = new ManagerVO();
    		ManagerHistoryVO history = new ManagerHistoryVO();
    		
    		for(int i = 0 ; i < managerMap.size() ; i++)
    		{
    			for (String mapkey : managerMap.get(i).keySet())
    			{
    				
					if ( mapkey.equals("ta_user_id"))
					{
						
						vvo.setTa_user_id( String.valueOf( managerMap.get(i).get(mapkey) )   );
						history.setTal_user_id( String.valueOf(managerMap.get(i).get(mapkey)) );
						
						
						session.setAttribute("GRANDADM_MANAGER_ID",	   String.valueOf(  managerMap.get(i).get(mapkey)) );
					}
					
					
					if ( mapkey.equals("ta_user_name"))
					{
						session.setAttribute("GRANDADM_MANAGER_NM",	 String.valueOf(  managerMap.get(i).get(mapkey))  );
					}					
					
					
					if ( mapkey.equals("ta_now_loginDt"))
					{
						session.setAttribute("GRANDADM_LOGIN_DT",	 String.valueOf(  managerMap.get(i).get(mapkey))  );
					}					
										
					
					if ( mapkey.equals("ta_group_code"))
					{
						session.setAttribute("GRANDADM_GRP_CD",	 String.valueOf(  managerMap.get(i).get(mapkey))  );
					}		
					
					if ( mapkey.equals("ta_group_name"))
					{
						session.setAttribute("GRANDADM_GRP_NM",	 String.valueOf(  managerMap.get(i).get(mapkey)) );
					}		
					 
					if ( mapkey.equals("ta_team_code"))
					{
						session.setAttribute("GRANDADM_TEAM_CD",	 String.valueOf(  managerMap.get(i).get(mapkey)) );
					}		
					
					if ( mapkey.equals("ta_team_name"))
					{
						session.setAttribute("GRANDADM_TEAM_NM",	 String.valueOf(  managerMap.get(i).get(mapkey))  );
					}							
					
    			}
    		}
    		
    		int updM1 		= managerService.updateManagerLoginDate(vvo);
    		
    		
    		history.setTal_login_state("Y");
    		
			IpCommon ipSet 		= new IpCommon();
			
	        String userIp				= ipSet.getClientIpAddress(req);
	        String userIpServer	= ipSet.getLocalServerIp();
	        
	        history.setTal_ip(userIp);
	        
	        String agent = req.getHeader("User-Agent");
	        history.setTal_agent(agent);
	        
	        int updM2 = managerService.insertManagerHistory(history);
	        
            map.put("resultCode", "Y");
            map.put("resultMessage", "");        		        
    		
        }
        else
        {
            map.put("resultCode", "N");
            map.put("resultMessage", "로그인이 실패 하였습니다.");        	
        }
        return map;
		
	}       
    
    
    @RequestMapping(value = "/admin/interface/insertManager", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertManager(Locale locale, Model model, ManagerVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int existsCount	= managerService.insertManager(vo);
        
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
    
}
