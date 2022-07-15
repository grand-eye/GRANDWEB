package com.grand.admin.consult.vo;

import java.util.List;
import java.util.Map;

import com.grand.admin.common.vo.CommonVO;
import lombok.Data;

@Data
public class SiteConsultVO extends CommonVO {
	
	private int mh_no;
	private String mh_type;
	private String mb_id;
	private String mh_name;
	private String mh_email;
	private String mh_category;
	private String mh_message;
	private String mh_reply;
	private String mh_hp;
	private String mh_datetime;
	private String mh_booking;
	private String mh_log;
	private String mh_ip;
	private String mh_consult;
	private String mh_reservation;
	private String mh_responsetime;
	private String is_mobile;
	private String mh_etc1;
	private String mh_etc2;
	private String mh_etc3;
	private String mh_etc4;
	private String mh_etc5;
	private String mh_flow;
	private String mh_keyword;
	private String vi_referer;
	private String utm_source;
	private String utm_medium;
	private String utm_campaign;
	
	private String utm_term;
	private String utm_content;
	private String utm_path;
	
	
	private String mh_reservation_name;
	private String listType;
	private String searchType;
	
	private String board_search;
	private String board_search_divide;
	private String board_start_date;
	private String board_end_date;

	private String tcd_code;
	private String tcd_title;
	
	private String consult_state;
	private String reservation_state;
	private String visit_state;
	private String contract_state;
	
	private List<Map<String, Object>> grid;
	
}
