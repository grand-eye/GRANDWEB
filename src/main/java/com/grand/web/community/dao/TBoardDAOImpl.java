package com.grand.web.community.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.grand.web.community.vo.TBoardVO;

@Repository
public class TBoardDAOImpl implements TBoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	private String Namespace = this.getClass().getName() +".Mapper";
	
		 
	@Override
	public List<TBoardVO> selectCommunity(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(Namespace +".selectCommunity",vo);
	}


	@Override
	public List<TBoardVO> selectNoticeList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectNoticeList");
	}

	@Override
	public int selectNoticeCount(TBoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectNoticeCount",vo);
	}

	@Override
	public int insertBoard(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertBoard",vo);
	}


	@Override
	public int updateBoardCnt(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace +".updateBoardCnt",vo);
	}


	@Override
	public int deleteBoard(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".deleteBoard",vo);
	}


	@Override
	public int updateBoard(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace +".updateBoard",vo);
	}


	
	
}
