package com.grand.admin.gnb.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class GnbVO extends CommonVO {
	private int  tm_index;
	private String  tm_code;
	private int  tm_level;
	private String  tm_parent;
	private String  tm_name;
	private String  tm_url;
	private String  tm_prefix;
	private String  tm_path;
	private String  tm_share_img;
	private String  tm_share_title;
	private String  tm_share_desc;
	private String  tm_useyn;
	private int  tm_order;
	private String  tm_ssl;
	private String  tm_login;
	private String  tm_category;
	private String id;
	private String text;
	private String rule;
	private String gnb_group_code;
	
	private String tgr_index;
	
	
	private String s_code;
	private String s_category;
	private String s_parent;
	private String s_level;
	private String s_useyn;
	private String s_root;
	private String s_rule;
	private String s_group;
	private String s_ssl;
	private String s_login;
	
	private String s_url;
	private String s_layout; 
	private String s_rule_yn;
	
}
