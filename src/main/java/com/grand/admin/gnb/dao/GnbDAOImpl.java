package com.grand.admin.gnb.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.gnb.vo.GnbVO;

@Repository("gnbDao")
public class GnbDAOImpl implements GnbDAO {
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    
    private String Namespace = this.getClass().getName() +".Mapper";

	@Override
	public List<GnbVO> selectGnb(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectGnb" , vo);
	}

	@Override
	public int insertGnb(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertGnb", vo);
	}

	@Override
	public int selectExistsGnb(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectExistsGnb", vo);
	}

	@Override
	public int selectGnbMax(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectGnbMax", vo);
	}

	@Override
	public int insertGnbRule(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertGnbRule", vo);
	}

	@Override
	public List<GnbVO> selectGnbOnlyClient(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectGnbOnlyClient" , vo);
	}

	@Override
	public List<GnbVO> selectGnbOneData(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectGnbOneData" , vo);
	}

	@Override
	public int deleteGnb(GnbVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace +".deleteGnb" , vo);
	}
}
