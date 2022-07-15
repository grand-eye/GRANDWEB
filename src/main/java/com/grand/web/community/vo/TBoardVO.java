package com.grand.web.community.vo;

import com.grand.admin.common.vo.CommonVO;

import lombok.Data;

@Data
public class TBoardVO extends CommonVO {
	
	private long board_idx;
	private String ui_id;
	private String row_num;
	private String board_menu_code;
	private String board_title;
	private String board_reg_name;
	private String board_reg_pass;
	private String board_etc1;
	private String board_etc2;
	private String board_etc3;
	private String board_etc4;
	private String birthday;
	private String board_mobile;
	private String board_email;
	private String board_cate_L;
	private String board_cate_M;
	private String board_cate_S;
	private String board_reg_date;
	private String board_mod_date;
	private String board_useyn;
	private String board_notice;
	private String board_show_str_date;
	private String board_show_end_date;
	private String board_show;
	private String board_secret;
	private String board_detail;
	private String board_upload_drop;
	private String board_cnt;
	private String board_reply;
	private String board_reg_date_type;
	private String board_show_str_date_type;
	private String board_search;
	private String utm_source;
	private String tcd_title;
	private String save_file;
	private String board_flag;
	private String search_category;
	private String board_url;
	private int board_etc10;
	private String[] search_category_split;
	
	private long rnum;
    
}
