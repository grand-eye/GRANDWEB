package com.grand.admin.templete.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class TblTempleteVO extends CommonVO {
	
	private int		templete_idx;
	private String 	templete_cate;
	private String 	templete_title;
	private String	templete_type;
	private String	templete_useyn;
	private String	templete_css;
	private String	templete_js;
	private String	templete_content;
	private String	templete_thum;
	private String	templete_reg_id;
	private String	templete_reg_name;
	private String	templete_reg_date;
	private String	templete_mod_id;
	private String	templete_mod_name;
	private String	templete_mod_date;
	
	private String	templete_search;
	private String	templete_cate_name;
	
	private String	board_menu_code;
	private String	board_menu_code_text;
	
	private String file_name_arr;
	private String file_original_arr;
	private String tcd_attr3;
	
	private String filePath;
	private String fileName;
	
	private String idx;
	private String orgName;
	private String extension;
	
}
