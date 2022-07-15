package com.grand.admin.history.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class HistoryVO extends CommonVO {

	private long history_idx;
	private long board_idx;
	private String board_content;
	private String board_reg_date;
	private String board_menu_code;
	private String board_reg_name;
	private String board_mod_id;
	private String board_start_date;
	private String board_end_date;
	
}
