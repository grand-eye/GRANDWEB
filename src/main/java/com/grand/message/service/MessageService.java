package com.grand.message.service;

import java.util.List;

import com.grand.message.vo.MessageVO;
import com.grand.web.test.vo.TestVO;


public interface MessageService {
	public String getMsg(MessageVO vo) throws Exception;
	public List<MessageVO> selectMessage(MessageVO vo) throws Exception;
	public int selectMessageCount(MessageVO vo) throws Exception;
	public int selectExistsMessageCode(MessageVO vo) throws Exception;
	public int insertMessageCode(MessageVO vo) throws Exception;
	
}
