package com.grand.util.Interceptor;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.grand.util.IpCommon;
import com.grand.admin.gnb.service.GnbService;
import com.grand.admin.gnb.vo.GnbVO;
import com.grand.message.service.MessageService;
import com.grand.message.vo.MessageVO;
import com.grand.util.CommonUtil;
import com.grand.util.common.DateUtil;


public class GrandInterceptor extends HandlerInterceptorAdapter  {

	@Value("#{file['webPath']}") 	private String webPath;	
	@Value("#{config['GRAND_URL']}") 	private String grandPath;
		
	@Inject
	private MessageService messageService;
	
	@Resource(name="gnbService")
	private GnbService gnbService;	
	
	private static final String[] IP_HEADER_CANDIDATES = { 
	    "X-Forwarded-For",
	    "Proxy-Client-IP",
	    "WL-Proxy-Client-IP",
	    "HTTP_X_FORWARDED_FOR",
	    "HTTP_X_FORWARDED",
	    "HTTP_X_CLUSTER_CLIENT_IP",
	    "HTTP_CLIENT_IP",
	    "HTTP_FORWARDED_FOR",
	    "HTTP_FORWARDED",
	    "HTTP_VIA",
	    "REMOTE_ADDR" 
	};
	
	@Override
	public void afterCompletion(HttpServletRequest request,	HttpServletResponse response, Object handler, Exception ex)	throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
		try {
			HttpSession session = request.getSession();
			
			if( modelAndView != null && modelAndView.getModelMap() != null  ){
				
				ModelMap model = modelAndView.getModelMap();
				
				if(model != null)
				{
					if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) 
					{
						model.addAttribute("WebPath",  webPath);
					}
					else
					{
						String utm_source =   URLDecoder.decode( String.valueOf( request.getParameter("utm_source")  ), "UTF-8");
						String utm_medium = URLDecoder.decode(String.valueOf( request.getParameter("utm_medium")  ), "UTF-8"); 
						String utm_campaign = URLDecoder.decode(String.valueOf( request.getParameter("utm_campaign")  ), "UTF-8"); 
						String utm_term =		URLDecoder.decode(String.valueOf( request.getParameter("utm_term")  ), "UTF-8");  
						String utm_content = 	URLDecoder.decode(String.valueOf( request.getParameter("utm_content")  ), "UTF-8"); 
						
						if ( utm_source != null && !utm_source.equals("") && !utm_source.equals("null"))
						{
							Cookie cookie_utm_source = new Cookie("grand_utm_source", 				URLEncoder.encode( utm_source, "UTF-8")); // 쿠키 이름을 name으로 생성
							Cookie cookie_utm_medium = new Cookie("grand_utm_medium",  		URLEncoder.encode( utm_medium, "UTF-8")); // 쿠키 이름을 name으로 생성
							Cookie cookie_utm_campaign = new Cookie("grand_utm_campaign", 		URLEncoder.encode( utm_campaign, "UTF-8")); // 쿠키 이름을 name으로 생성
							Cookie cookie_utm_term= new Cookie("grand_utm_term", 					URLEncoder.encode( utm_term, "UTF-8")); // 쿠키 이름을 name으로 생성
							Cookie cookie_utm_content = new Cookie("grand_utm_content", 			URLEncoder.encode( utm_content, "UTF-8")); // 쿠키 이름을 name으로 생성
							
							cookie_utm_source.setMaxAge(60*60*24*365);
							cookie_utm_source.setPath("/");
							
							cookie_utm_medium.setMaxAge(60*60*24*365);
							cookie_utm_medium.setPath("/");
							
							cookie_utm_campaign.setMaxAge(60*60*24*365);
							cookie_utm_campaign.setPath("/");
							
							cookie_utm_term.setMaxAge(60*60*24*365);
							cookie_utm_term.setPath("/");

							cookie_utm_content.setMaxAge(60*60*24*365);
							cookie_utm_content.setPath("/");
							
							response.addCookie(cookie_utm_source);
							response.addCookie(cookie_utm_medium);
							response.addCookie(cookie_utm_campaign);
							response.addCookie(cookie_utm_term);
							response.addCookie(cookie_utm_content);
						}
						
						String reffers = "";
						Cookie[] getCookie = request.getCookies(); // 모든 쿠키 가져오기

						if(getCookie != null){ // 만약 쿠키가 없으면 쿠키 생성
								for(int i=0; i<getCookie.length; i++){
									Cookie c = getCookie[i]; // 객체 생성
									String name = c.getName(); // 쿠키 이름 가져오기
									String value = c.getValue(); // 쿠키 값 가져오기
									
									if ( name.equals("grand_reffer") )
									{
										reffers = URLDecoder.decode(value,"UTF-8");
									}
								}
						}
						
						String now_reffer = URLDecoder.decode( String.valueOf( request.getRequestURI() ), "UTF-8");
						String saveReffers = reffers + " > " + now_reffer;
						
						if (now_reffer.indexOf("/errorNotice") <= -1)
						{
							Cookie cReffer = new Cookie("grand_reffer", URLEncoder.encode( saveReffers, "UTF-8") ); // 쿠키 이름을 name으로 생성
							cReffer.setMaxAge(60*60*24*365);
							cReffer.setPath("/");
							response.addCookie(cReffer);							
						}

						model.addAttribute("WebPath",  webPath);
						model.addAttribute("GrandPath",  grandPath);
						model.addAttribute("domain"  ,  request.getScheme()+"://"+request.getServerName() + ":"+request.getServerPort()  );
						model.addAttribute("serverName"  ,  request.getServerName()   );
						
				    	DateUtil du = new DateUtil();
				    	String nowDateStr = du.getDateTime();					
				    	
				    	model.addAttribute("nowDateStr"  ,  nowDateStr  );
						
						String  GRAND_URI 	= request.getRequestURI().toLowerCase();
						String  GRAND_URL  = request.getRequestURL().toString();
						
						IpCommon ipSet 		= new IpCommon();
						
				        String userIp		= ipSet.getClientIpAddress(request);
				        String userIpServer	= ipSet.getLocalServerIp();
				        
				        model.addAttribute("_userIP",  userIp);
				        model.addAttribute("_userIP_Server",  userIpServer);		
				        
						if ( GRAND_URI.indexOf("/admin/") > -1 )	// 관리자라면
						{
							
						}
						else	// 현재 사용자의 페이지라면
						{
					    	GnbVO vvo = new GnbVO();
					        vvo.setS_category("GNB01");
					        vvo.setS_useyn("Y");
					        vvo.setS_level("0");
					        vvo.setS_ssl("Y");
					        
					        model.addAttribute("gnbData",  gnbService.selectGnbLower(vvo));
					        org.springframework.mobile.device.Device device = (Device) request.getAttribute("currentDevice");
					        model.addAttribute("_url",  GRAND_URL);
					        
			        		MessageVO mvo = new MessageVO();
			        		mvo.setMsg_code("default.share.title");
			        		mvo.setMsg_locale( "KR" );
			        		String defaultShareTitle     = messageService.getMsg(mvo);
			        		
			        		MessageVO mvo2 = new MessageVO();
			        		mvo2.setMsg_code(  "default.share.desc");
			        		mvo2.setMsg_locale( "KR" );
			        		String defaultShareDesc     = messageService.getMsg(mvo2);
			        		
			        		MessageVO mvo3 = new MessageVO();
			        		mvo3.setMsg_code(  "default.share.image");
			        		mvo3.setMsg_locale( "KR" );
			        		String defaultShareImg    = messageService.getMsg(mvo3);
			        		
			        		MessageVO mvo4 = new MessageVO();
			        		mvo4.setMsg_code(  "default.site.name");
			        		mvo4.setMsg_locale( "KR" );		        		
			        		
			        		String defaultSiteName = messageService.getMsg(mvo4);
			        		
			        		String defaultSiteTitle = "강남 그랜드안과";
			        		
			        		String REAL_GRAND_URI = GRAND_URI;
			        		
			        		if( GRAND_URI.indexOf("_detail") > -1 ) {
			        			
			        			String[] split_URI = GRAND_URI.split("_");
			        			GRAND_URI = split_URI[0];
			        		}
			        		
			        		GnbVO gvo = new GnbVO();
			        		gvo.setS_url(GRAND_URI);
			        		List<GnbVO> listGnbDataVO = gnbService.selectGnbOneData(gvo);
			        		
			        		List<Map<String, Object>> listGnbOneMap = null;
			        		listGnbOneMap = CommonUtil.convertListToMap(listGnbDataVO);			
			        		
			        		if ( listGnbOneMap.size() > 0 )
			        		{
			        			if ( listGnbOneMap.get(0).get("tm_share_title") != null )
			        			{
			        				defaultShareTitle   = listGnbOneMap.get(0).get("tm_share_title").toString();	
			        			}
			        			
			        			if ( listGnbOneMap.get(0).get("tm_share_desc") != null )
			        			{
			        				defaultShareDesc  = listGnbOneMap.get(0).get("tm_share_desc").toString();
			        			}
			        			
			        			if ( listGnbOneMap.get(0).get("tm_share_img") != null )
			        			{
			        				defaultShareImg   = listGnbOneMap.get(0).get("tm_share_img").toString();
			        			}		        			
			        			
			        			if ( listGnbOneMap.get(0).get("tm_prefix") != null )
			        			{
			        				defaultSiteName   = listGnbOneMap.get(0).get("tm_prefix").toString();
			        			}		
			        			
			        			if ( listGnbOneMap.get(0).get("tm_name") != null )
			        			{
			        				defaultSiteTitle   = listGnbOneMap.get(0).get("tm_name").toString();
			        			}				        			
			        		}
			        		
			        		

			        		model.addAttribute("share_uri", GRAND_URI);
			        		model.addAttribute("share_title", defaultShareTitle);
			        		model.addAttribute("share_url", GRAND_URI);
			        		model.addAttribute("share_image", defaultShareImg);
			        		model.addAttribute("share_desc", defaultShareDesc);
			        		model.addAttribute("share_keyword", defaultSiteName);
			        		model.addAttribute("share_page_title", defaultSiteTitle);
			        		
			        		
					        String setMemberID = (String)session.getAttribute("GRAND_USER_ID");
					        
					        
			        		if ( REAL_GRAND_URI.indexOf("/review_detail/") > -1 ) {
			        			if ( setMemberID == null || (  setMemberID.equals("") ) )
						        {
			        				response.sendRedirect("/user/login");
						        }
			        		}

					        /** 로그인 이후 처리 할 영역 **/
					        if ( setMemberID != null && !(  setMemberID.equals("") ) )
					        {
					        	
					        }
							else
							{
								/**비로그인 상태에서 처리 **/								
								String  tmpMemberID = (String) session.getAttribute("GRAND_TEMP_MEMBERID");
							}
						}
					}
				}
			}
			super.postHandle(request, response, handler, modelAndView);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			HttpSession session = request.getSession();
			
			String GRAND_URI = request.getRequestURI().toLowerCase();
			
			if ( GRAND_URI.indexOf("/admin") > -1
					&& GRAND_URI.indexOf("/admin/login") <= -1
					&& GRAND_URI.indexOf("/admin/img") <= -1
					&& GRAND_URI.indexOf("/admin/js") <= -1
					&& GRAND_URI.indexOf("/admin/interface/selectboard/") <= -1
					&& GRAND_URI.indexOf("/admin/interface/getgroupcode") <= -1 
					&& GRAND_URI.indexOf("/admin/interface/selectnutritionlist") <= -1
					&& GRAND_URI.indexOf("/admin/file/filecommonupload") <= -1
					&& GRAND_URI.indexOf("/admin/download") <= -1
					
					)
			{
				if ( GRAND_URI.indexOf("/admin/interface/") > -1 )	//로그인이 필요한 ajax요청은 Annotation response Body를 이용하기 때문에 model로 임의 데이터를 내릴수 없다 이에 따라 999상태코드로 에러 리턴
				{
					String session_user_admin_id = (String)session.getAttribute("GRANDADM_MANAGER_ID");
					if ( session_user_admin_id == null )
					{
						response.sendError(999);
						return false;
					}
				}	
				
				String  admLoginID 			= (String) session.getAttribute("GRANDADM_MANAGER_ID");
				if ( admLoginID == null )
				{
					String errMsg = URLEncoder.encode("로그인 이후 이용해주세요.", "UTF-8");
					response.sendRedirect("/error?errMsg="+errMsg+"&errUrl=admin/login");
					return false;
				}
			}
			else
			{
				if ( GRAND_URI.indexOf("/member/") > -1 )
				{
					String session_user_id = (String)session.getAttribute("GRAND_USER_ID");
					if ( session_user_id != null )
					{
						response.sendRedirect("/");
						return false;
					}
					
				}
				
				if ( GRAND_URI.indexOf("/grandtv/view/") > -1 )
				{
					String session_user_id = (String)session.getAttribute("GRAND_USER_ID");
					if ( session_user_id == null )
					{
						session.setAttribute("recallUrl", GRAND_URI);
						response.sendRedirect("/member/login");
						return false;
					}
					
				}
				
				if ( GRAND_URI.indexOf("/consult/review/view/") > -1 )
				{
					String session_user_id = (String)session.getAttribute("GRAND_USER_ID");
					if ( session_user_id == null )
					{
						session.setAttribute("recallUrl", GRAND_URI);
						response.sendRedirect("/member/login");
						return false;
					}
					
				}
				
				if ( GRAND_URI.indexOf("/grand/before") > -1 )
				{
					String session_user_id = (String)session.getAttribute("GRAND_USER_ID");
					if ( session_user_id == null )
					{
						
						session.removeAttribute("recallUrl");
						session.setAttribute("recallUrl", "https://grand.co.kr/grand/before-After");
						
						response.sendRedirect("/member/login");
						return false;
					}
					
				}
				
				if ( GRAND_URI.indexOf("/uinterface/") > -1  )	//로그인이 필요한 ajax요청은 Annotation response Body를 이용하기 때문에 model로 임의 데이터를 내릴수 없다 이에 따라 999상태코드로 에러 리턴
				{
					String session_user_id = (String)session.getAttribute("GRAND_USER_ID");
					if ( session_user_id == null )
					{
						response.sendError(999);
						return false;
					}
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
}