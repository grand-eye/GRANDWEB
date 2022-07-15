package com.grand.web.user.vo;

import com.grand.admin.common.vo.CommonVO;

import lombok.Data;

@Data
public class TUserVO extends CommonVO {
	
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
	
}
