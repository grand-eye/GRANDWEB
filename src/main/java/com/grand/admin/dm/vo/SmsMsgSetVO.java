package com.grand.admin.dm.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class SmsMsgSetVO extends CommonVO {
	
	private int idx;
	private String send_type;
	private String send_action;
	private String send_location;
	private String send_state;
	private String send_msg;
	private String comment;
	private String send_msg_length;
	
}
