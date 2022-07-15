package com.grand.message.vo;

import java.util.Locale;
import com.grand.admin.common.vo.CommonVO;
import lombok.Data;
import lombok.Setter;

@Data
public class MessageVO extends CommonVO {
	
	private String msg_code;
	private String msg_text;
	private String msg_locale;
	private String msg_etc;
	private String msg_search;
	private int msg_order_num;
	
	
	
	
}
