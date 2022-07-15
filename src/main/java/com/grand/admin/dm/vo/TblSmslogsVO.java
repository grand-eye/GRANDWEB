package com.grand.admin.dm.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class TblSmslogsVO extends CommonVO {
	
	private int tblNumber;
	private String tblStrSender;
	private String tblStrAddressee;
	private String tblStrComment;
	private String tblStrIp;
	private String tblStrStatus;
	private String tblRetMsg;
	private String tblRetCode;
	private String tblDtmRegDate;
	
	private String board_search;
	private String board_search_option;
	
}
