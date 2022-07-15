package com.grand.admin.banner.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.banner.vo.BannerVO;

@Repository("bannerDAO")
public class BannerDAOImpl implements BannerDAO {
	 

	
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    	
	
	
	private String Namespace = this.getClass().getName() +".Mapper";
	
		 
	@Override
	public List<BannerVO> selectbannerInfo(BannerVO vo) throws Exception {
		return sqlSession.selectList(Namespace +".selectbannerInfo", vo);
	}
	@Override
	public List<BannerVO> selectbannersubInfo(BannerVO vo) throws Exception {
		return sqlSession.selectList(Namespace +".selectbannersubInfo", vo);
	}
	
	@Override
	public List<BannerVO> selectBannersubUpdateInfo(BannerVO vo) throws Exception {
		return sqlSession.selectList(Namespace +".selectBannersubUpdateInfo", vo);
	}
	
	@Override
	public int selectbannersubInfoCount(BannerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectbannersubInfoCount" , vo);
	}
	
	@Override
	public int insertBannersub(BannerVO vo) {
		return sqlSession.insert(Namespace +".insertBannersub", vo);
	}
	
	@Override
	public BannerVO selectbannerConfig(BannerVO vo) throws Exception {
		return sqlSession.selectOne(Namespace +".selectbannerConfig", vo);
	}
	
	@Override
	public int insertbannerInfo(BannerVO vo) {
		return sqlSession.insert(Namespace +".insertbannerInfo", vo);
	}
	
	@Override
	public int updatebannerInfo(BannerVO vo) {
		return sqlSession.update(Namespace +".updatebannerInfo", vo);
	}

	@Override
	public int selectbannerInfoCount(BannerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectbannerInfoCount" , vo);
	}
	
	@Override
	public int deleteBannerInfo(BannerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace +".deleteBannerInfo" , vo);
	}
	
}
