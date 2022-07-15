package com.grand.message.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.grand.message.vo.MessageVO;
import com.grand.web.test.vo.TestVO;


@Repository
public class MessageDAOImpl implements MessageDAO {

	@Inject
	private SqlSession sqlSession;
	private String Namespace = this.getClass().getName() +".Mapper";
	
	

	@Override
	public String getMsg(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".getMsg" , vo);
	}



	@Override
	public List<MessageVO> selectMessage(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectMessage" , vo);
	}



	@Override
	public int selectMessageCount(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectMessageCount" , vo);
	}



	@Override
	public int selectExistsMessageCode(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		//public int selectExistsMessageCode(MessageVO vo) throws Exception;
		return sqlSession.selectOne(Namespace +".selectExistsMessageCode" , vo);
	}



	@Override
	public int insertMessageCode(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertMessageCode", vo);
	}

}
