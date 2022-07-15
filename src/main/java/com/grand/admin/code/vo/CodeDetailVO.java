package com.grand.admin.code.vo;

import java.util.List;
import com.grand.admin.common.vo.CommonVO;
import lombok.Data;


@Data
public class CodeDetailVO {
	
	
	private String tcd_index;
	private String tcd_master_code;
	private String tcd_level;
	private String tcd_parent;
	private String tcd_path;
	private String tcd_title;
	private String id;
	private String tcd_code;
	private String tcd_attr1;
	private String tcd_attr2;
	private String tcd_attr3;
	
	private String tcd_attr4;
	private String tcd_attr5;
	private String tcd_attr6;
	
	
	private String tcd_useyn;
	private int tcd_order = 99;

	
	private String search_code;
	private String search_parent;
	private String search_master;
	private String search_level;

	private String search_useyn;
	private String checkState;
	
	private String s_attr_1;
	private String s_attr_2;
	private String s_attr_3;
	private String s_attr_4;
	private String s_attr_5;
	private String s_attr_6;
	
	private String codeOpt;
	
	
	
}
