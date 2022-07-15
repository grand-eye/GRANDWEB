package com.grand.admin.manager.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class ManagerVO extends CommonVO {
	private int  		ta_index;
	private String  ta_user_id;
	private String  ta_user_pw;
	private String  ta_user_name;
	private String  ta_phone;
	private String  ta_tel;
	private String  ta_email;
	private String  ta_group_code;
	private String  ta_team_code;
	private String  ta_reg_date;
	private String  ta_last_login_date;
	private String  ta_use_yn;
	private String  ta_del_yn;
	private String  ta_update_date;
	private String  ta_desc;
	private String  ta_use_yn_msg;
	private String ta_new_user_pw;
	
	private String ta_group_name;
	private String ta_team_name;
	
	
	private String cng_password;
	private String i_password;
	private String i_user_id;
	private String ta_now_loginDt;
	
	
	
	
}
