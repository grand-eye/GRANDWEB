package com.grand.admin.code.vo;

import com.grand.admin.common.vo.CommonVO;

import lombok.Data;


@Data
public class CodeVO extends CommonVO{
	private String code_index;
	private String code_id;
	private String code_name;
	private String code_useyn;
	private String code_parent;
	private String code_attr_01;
	private String code_attr_02;
	private String code_attr_03;
	private String code_order;
	private String code_level;
	private String code_path;
	private String code_search;
	
	
	private String code_attr_04;
	private String code_attr_05;
	private String code_attr_06;
}
