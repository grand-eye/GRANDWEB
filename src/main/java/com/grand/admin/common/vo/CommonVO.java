package com.grand.admin.common.vo;


import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.grand.util.IpCommon;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.Cookie;

public class CommonVO {

	private int rows		= 50;
	private int pagesize 	= 20;
	private int page       	= 1;
	private int startpage =  ( rows * page) - rows;
	private int recordcount = 0;
	private int codeExits = 0;
	private String code   = "";
	private String reg_id   = "";
	private String reg_nm   = "";
	private String mod_id   = "";
	private String mod_nm   = "";
    private String device;
    
    private String c_utm_source;
    private String c_utm_medium;
    private String c_utm_campaign;
    private String c_utm_term;
    private String c_utm_content;
    //private String c_reffers;
    
    
    private String sort;
    private String order;    
    private String commonIp;
    
    
    
    
    public CommonVO()  {
    	
    	ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    	HttpSession session = attr.getRequest().getSession();
    	
    	IpCommon ipSet = new IpCommon();
    	this.commonIp = ipSet.getClientIpAddress( attr.getRequest() );
    	
    	String  admLoginID 			= (String) session.getAttribute("GRANDADM_MANAGER_ID");
    	String  admLoginNM 			= (String) session.getAttribute("GRANDADM_MANAGER_NM");
    	
    	if ( admLoginID != null && !(admLoginID.equals("")) )
    	{
    		this.reg_id = admLoginID;
    		this.mod_id = admLoginID;    		
    	}
    	
    	if ( admLoginNM != null && !(admLoginNM.equals("")) )
    	{
    		this.reg_nm = admLoginNM;
    		this.mod_nm = admLoginNM;    		
    	}
    	
    	Cookie[] getCookie = attr.getRequest().getCookies(); // 모든 쿠키 가져오기
    	
		if(getCookie != null){ // 만약 쿠키가 없으면 쿠키 생성
			for(int i=0; i<getCookie.length; i++){
				Cookie c = getCookie[i]; // 객체 생성
				String name = c.getName(); // 쿠키 이름 가져오기
				String value = c.getValue(); // 쿠키 값 가져오기
				
				if ( name.equals("grand_utm_source") )
				{
					
					
					try {
						this.c_utm_source = URLDecoder.decode( value, "UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if ( name.equals("grand_utm_medium") )
				{
					try {
						this.c_utm_medium = URLDecoder.decode( value, "UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						//e.printStackTrace();
					}
				}
				
				if ( name.equals("grand_utm_campaign") )
				{
					try {
						this.c_utm_campaign = URLDecoder.decode( value, "UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						//e.printStackTrace();
					}
				}
				
				if ( name.equals("grand_utm_term") )
				{
					try {
						this.c_utm_term = URLDecoder.decode( value, "UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						//e.printStackTrace();
					}
				}
				
				if ( name.equals("grand_utm_content") )
				{
					try {
						this.c_utm_content = URLDecoder.decode( value, "UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						//e.printStackTrace();
					}
				}		
				
				/*
				 * if ( name.equals("grand_reffer") ) { try { this.c_reffers =
				 * URLDecoder.decode( value, "UTF-8"); } catch (UnsupportedEncodingException e)
				 * { // TODO Auto-generated catch block //e.printStackTrace(); } }
				 */					
			}
		}
    }

    
    
    
	public String getCommonIp() {
		return commonIp;
	}




	public void setCommonIp(String commonIp) {
		this.commonIp = commonIp;
	}




	public String getSort() {
		return sort;
	}




	public void setSort(String sort) {
		this.sort = sort;
	}




	public String getOrder() {
		return order;
	}




	public void setOrder(String order) {
		this.order = order;
	}




	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}


	public String getC_utm_source() {
		return c_utm_source;
	}


	public void setC_utm_source(String c_utm_source) {
		this.c_utm_source = c_utm_source;
	}


	public String getC_utm_medium() {
		return c_utm_medium;
	}


	public void setC_utm_medium(String c_utm_medium) {
		this.c_utm_medium = c_utm_medium;
	}


	public String getC_utm_campaign() {
		return c_utm_campaign;
	}


	public void setC_utm_campaign(String c_utm_campaign) {
		this.c_utm_campaign = c_utm_campaign;
	}


	public String getC_utm_term() {
		return c_utm_term;
	}


	public void setC_utm_term(String c_utm_term) {
		this.c_utm_term = c_utm_term;
	}


	public String getC_utm_content() {
		return c_utm_content;
	}


	public void setC_utm_content(String c_utm_content) {
		this.c_utm_content = c_utm_content;
	}


	/*
	 * public String getC_reffers() { return c_reffers; }
	 * 
	 * 
	 * public void setC_reffers(String c_reffers) { this.c_reffers = c_reffers; }
	 */


	public int getCodeExits() {
		return codeExits;
	}
	public void setCodeExits(int codeExits) {
		this.codeExits = codeExits;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		startpage = ( rows * page) - rows;
		this.rows = rows;
	}
	public int getRecordcount() {
		return recordcount;
	}
	public void setRecordcount(int recordcount) {
		this.recordcount = recordcount;
	}

	
	
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public String getReg_nm() {
		return reg_nm;
	}
	public void setReg_nm(String reg_nm) {
		this.reg_nm = reg_nm;
	}
	public String getMod_id() {
		return mod_id;
	}
	public void setMod_id(String mod_id) {
		this.mod_id = mod_id;
	}
	public String getMod_nm() {
		return mod_nm;
	}
	public void setMod_nm(String mod_nm) {
		this.mod_nm = mod_nm;
	}	
	
	
}
