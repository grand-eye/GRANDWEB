package com.grand.message.dao;

import java.util.List;

import com.grand.message.vo.MessageVO;

public interface MessageDAO {
	
	public String getMsg(MessageVO vo) throws Exception;
	public List<MessageVO> selectMessage(MessageVO vo) throws Exception;
	public int selectMessageCount(MessageVO vo) throws Exception;
	
	
	public int selectExistsMessageCode(MessageVO vo) throws Exception;
	public int insertMessageCode(MessageVO vo) throws Exception;
	
}
