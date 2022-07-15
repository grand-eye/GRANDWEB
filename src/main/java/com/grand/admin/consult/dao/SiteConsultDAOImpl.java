package com.grand.admin.consult.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.consult.vo.SiteConsultVO;



@Repository("siteConsultDAO")
public class SiteConsultDAOImpl implements SiteConsultDAO {
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String Namespace = this.getClass().getName() +".Mapper";

	
	@Override
	public List<SiteConsultVO> selectSiteConsultList(SiteConsultVO siteConsultVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectSiteConsultList", siteConsultVO);
	}
	
	@Override
	public int selectSiteConsultCount(SiteConsultVO siteConsultVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectSiteConsultCount", siteConsultVO);
	}
	
	@Override
	public SiteConsultVO selectSiteConsult(SiteConsultVO siteConsultVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectSiteConsult", siteConsultVO);
	}
	
	@Override
	public int updateSiteConsult(SiteConsultVO siteConsultVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".updateSiteConsult", siteConsultVO);
	}
	
	@Override
	public void updateSiteConsultGrid(SiteConsultVO siteConsultVO) throws Exception {
		sqlSession.update(Namespace +".updateSiteConsultGrid", siteConsultVO);
	}

}
