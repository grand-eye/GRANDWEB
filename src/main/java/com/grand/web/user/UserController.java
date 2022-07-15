package com.grand.web.user;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grand.web.community.service.CommunityService;
import com.grand.web.community.vo.TBoardVO;
import com.grand.web.user.service.UserService;
import com.grand.web.user.vo.TUserVO;


@Controller
public class UserController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private UserService userService;
	
    @RequestMapping(value = "/user/interface/id_check", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> idCheck(Locale locale, Model model,TUserVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("result",userService.idCheck(vo));
        
        return map;
    }
	
	@RequestMapping(value = "/user/interface/user_check", method = RequestMethod.POST)
	@ResponseBody
	    public Map<String, Object> user_check(Locale locale, Model model,TUserVO vo) throws Exception{
	    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("result",userService.userCheck(vo));
	    
	    return map;
	}
    
    @RequestMapping(value = "/user/interface/insertUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertUser(Locale locale, Model model,TUserVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("result",userService.insertUser(vo));
        
        return map;
    }
    
    @RequestMapping(value = "/user/interface/updateUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateUser(Locale locale, Model model,TUserVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("result",userService.updateUser(vo));
        
        return map;
    }
    
    @RequestMapping(value = "/user/interface/deleteUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteUser(Locale locale, Model model,TUserVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("result",userService.deleteUser(vo));
        
        return map;
    }
    
    @RequestMapping(value = "/user/interface/login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> loginAPI(HttpServletRequest req,Locale locale, Model model,TUserVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        TUserVO rtn = userService.userLogin(vo);
        
        if(rtn != null ) {
			rtn.getTblStrID();
			 
			map.put("result",rtn.getTblStrID());
			 
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(60 * 60);	// 세션 유지시간 1시간으로..
			 
			session.setAttribute("GRAND_USER_ID",		(String) rtn.getTblStrID());
			session.setAttribute("GRAND_USER_NAME",	(String) rtn.getTblStrName());
			session.setAttribute("GRAND_USER_MOBILE",	(String) rtn.getTblStrMobile());
			session.setAttribute("GRAND_USER_EMAIL",	(String) rtn.getTblStrEmail());
        }else {
        	map.put("result","fail");
        }
        
        return map;
    }
    
    @RequestMapping(value = "/user/interface/logout", method = {RequestMethod.GET,RequestMethod.POST} ) 
	public String userLogout(HttpServletRequest req) throws Exception {
		
		//req.getSession().invalidate();
		HttpSession session = req.getSession();
		session.removeAttribute("GRAND_USER_ID");
    	session.removeAttribute("GRAND_USER_NAME");
    	session.removeAttribute("GRAND_USER_MOBILE");
    	session.removeAttribute("GRAND_USER_EMAIL");
		return "redirect:/";
	}
    
    @RequestMapping(value = "/user/interface/snsLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> snsLoginAPI(HttpServletRequest req,Locale locale, Model model,TUserVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        TUserVO rtn = userService.userLogin(vo);
        
        rtn.getTblStrID();
        
        map.put("result",rtn.getTblStrID());
        
        HttpSession session = req.getSession();
        session.setMaxInactiveInterval(60 * 60);	// 세션 유지시간 1시간으로..
        
        return map;
    }
    
    
    @RequestMapping(value = "/user/join_cmplt", method = RequestMethod.GET)
    public String join_cmplt(Locale locale) throws Exception{
 
        return "/front/user/join_cmplt";
    }
    
    @RequestMapping(value = "/user/join_info", method = RequestMethod.GET)
    public String join_info(Locale locale) throws Exception{
 
        return "/front/user/join_info";
    }
    
    @RequestMapping(value = "/user/mypage", method = RequestMethod.GET)
    public String mypage(Locale locale) throws Exception{
 
        return "/front/user/mypage";
    }
    
    @RequestMapping(value = "/user/join_terms", method = RequestMethod.GET)
    public String join_terms(Locale locale) throws Exception{
 
        return "/front/user/join_terms";
    }
    
    @RequestMapping(value = "/user/login", method = RequestMethod.GET)
    public String login(Locale locale) throws Exception{
 
        return "/front/user/login";
    }
    
    @RequestMapping(value = "/user/id_password_search", method = RequestMethod.GET)
    public String id_password_search(Locale locale) throws Exception{
 
        return "/front/user/id_password_search";
    }
    
}
