package com.grand.admin.landing.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.landing.vo.TblLandingVO;


@Repository("TblLandingDao")
public class TblLandingDAOImpl implements TblLandingDAO {
	
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    
    private String Namespace = this.getClass().getName() +".Mapper";

	@Override
	public List<TblLandingVO> selectLandingList(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectLandingList", vo);		
	}

	
	@Override
	public int selectLandingCount(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectLandingCount", vo);		
	}


	@Override
	public int insertLanding(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertLanding", vo);		
	}
	
	@Override
	public int deleteLanding(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace + ".deleteLanding", vo);		
	}


	@Override
	public TblLandingVO selectLanding(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectLanding", vo);		
	}


	@Override
	public List<TblLandingVO> selectLandingFileList(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectLandingFileList", vo);		
	}


	@Override
	public int insertLandingFile(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertLandingFile", vo);
	}


	@Override
	public int deleteLandingFile(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace + ".deleteLandingFile", vo);
	}
}
