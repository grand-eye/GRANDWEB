package com.grand.admin.member.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class TblMemberVO extends CommonVO {
	
	private long tblNumber;
	private String tblStrID;
	private String tblStrName;
	private String tblSection;
	private String tblPassType;
	private String tblStrPass;
	private String tblSnsType;
	private String tblStrPhone;
	private String tblStrMobile;
	private String tblBlnEmail;
	private String tblBlnSms;
	private String tblStrEmail;
	private String tblDtmStrDate;
	private String tblDtmRegDate;
	private String tblDtmLastDate;
	private String tblDtmRegIp;
	private long tblIntGP;
	private long tblIntLevel;
	private String tblStrMemo;
	private String tblDtmEndDate;
	private String memDel;
	private long memDel_reason;
	private String memDel_hope;
	private String memDel_date;
	private String site;
	private String etc1;
	private String etc2;
	private String etc3;
	private String etc4;
	private String etc5;	
	
	private String board_search;
	private String board_search_str_date;
	private String board_search_end_date;
	private String board_search_email;
	private String board_search_sms;
	private String board_search_memDel;
	private String board_search_option;
	
	private String levelName;
	private String regionName;
	private String partName;
	private String joinName;
	
	private String listType;
	
}
