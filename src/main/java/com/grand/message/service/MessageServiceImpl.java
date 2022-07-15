package com.grand.message.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.grand.message.dao.MessageDAO;
import com.grand.message.vo.MessageVO;



@Service
public class MessageServiceImpl implements MessageService {

	
	@Inject
	private MessageDAO messageDao;
	
	
	
	@Override
	public String getMsg(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return messageDao.getMsg(vo);
	}



	@Override
	public List<MessageVO> selectMessage(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return messageDao.selectMessage(vo);
	}



	@Override
	public int selectMessageCount(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return messageDao.selectMessageCount(vo);
	}



	@Override
	public int selectExistsMessageCode(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return messageDao.selectExistsMessageCode(vo);
	}



	@Override
	public int insertMessageCode(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		int msgExistCount = messageDao.selectExistsMessageCode(vo);
		if ( msgExistCount > 0 )
		{
			return 0;
		}
		else
		{
			return messageDao.insertMessageCode(vo);
		}
	}

}
