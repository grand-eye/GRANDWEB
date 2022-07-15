package com.grand.admin.dm.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class TblSmsConfigVO extends CommonVO {
	
	private String cf_id;
	private String cf_pw;
	private String cf_ip;
	private String cf_port;
	private String cf_phone;
	private String cf_admin;
	private String cf_register;
	private String cf_datetime;
	private int cf_member;
	private int cf_level;
	private int cf_point;
	private int cf_day_count;
	
}
