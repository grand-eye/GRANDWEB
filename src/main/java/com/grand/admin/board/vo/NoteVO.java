package com.grand.admin.board.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class NoteVO extends CommonVO {

	private long board_idx;
	private String board_name;
	private String board_detail;
	private String board_reg_date;
	private String board_update_date;
	private String board_use_yn;
	private String board_delete_yn;
	
}
