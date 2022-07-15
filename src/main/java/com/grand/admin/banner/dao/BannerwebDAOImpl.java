package com.grand.admin.banner.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.banner.vo.BannerwebVO;

@Repository("bannerwebDAO")
public class BannerwebDAOImpl implements BannerwebDAO {
		
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    	
	
	
	private String Namespace = this.getClass().getName() +".Mapper";
	
		 
	@Override
	public List<BannerwebVO> selectbannerwebInfo(BannerwebVO vo) throws Exception {
		return sqlSession.selectList(Namespace +".selectbannerwebInfo", vo);
	}
	
	@Override
	public List<BannerwebVO> selectBannercommonInfo(BannerwebVO vo) throws Exception {
		return sqlSession.selectList(Namespace +".selectBannercommonInfo", vo);
	}
	
	@Override
	public int selectbannerwebInfoCount(BannerwebVO vo) throws Exception {
		return sqlSession.selectOne(Namespace +".selectbannerwebInfoCount", vo);
	}

	
}
