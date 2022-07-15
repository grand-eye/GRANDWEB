package com.grand.admin.landing.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class TblLandingVO extends CommonVO {
	
	private int		landing_idx;
	private String 	landing_cate;
	private String 	landing_title;
	private String 	landing_key;
	private String	landing_useyn;
	private String	landing_content;
	private String	landing_url;
	private String	landing_reg_id;
	private String	landing_reg_name;
	private String	landing_reg_date;
	private String	landing_mod_id;
	private String	landing_mod_name;
	private String	landing_mod_date;
	private String	landing_thum;
	
	private String	board_search;
	private String	board_search_show;
	private String 	fileName;
	private String   orgName;
	private String	filePath;
	private String	extension;
	private String	file_gubun;
	private String	file_name;
	private String	file_original;
	
	private String	landing_path;
	private String	landing_update;
	
	private int	idx;
	
}
