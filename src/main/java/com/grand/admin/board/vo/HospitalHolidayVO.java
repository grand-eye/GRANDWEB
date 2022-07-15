package com.grand.admin.board.vo;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class HospitalHolidayVO extends CommonVO {

	private int idx;
	private String date;
	private String time;
	private long gubun;
	private String date_full;
	
}
