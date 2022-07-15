package com.grand.web.user.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.grand.web.community.vo.TBoardVO;
import com.grand.web.user.vo.TUserVO;

@Repository
public class TUserDAOImpl implements TUserDAO {
	
	@Inject
	private SqlSession sqlSession;
	private String Namespace = this.getClass().getName() +".Mapper";
	
		 
	@Override
	public List<TBoardVO> selectCommunity(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub]
		
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
	public int selectUserCount(TUserVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectUserCount",vo);
	}
	
	@Override
	public TUserVO selectUserOne(TUserVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectUserOne",vo);
	}

	@Override
	public int insertConsult(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertConsult",vo);
	}


	@Override
	public int insertUser(TUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertUser",vo);
	}


	@Override
	public TUserVO selectUser(TUserVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectUser",vo);
	}


	@Override
	public int updateUser(TUserVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace +".updateUser",vo);
	}

	@Override
	public int deleteUser(TUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace +".deleteUser",vo);
	}
	
	
	
}
