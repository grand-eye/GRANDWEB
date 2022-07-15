package com.grand.admin.banner.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.grand.admin.banner.dao.BannerDAO;
import com.grand.admin.banner.vo.BannerVO;

@Service("bannerService")
public class BannerServiceImpl implements BannerService {
	
	@Resource(name = "bannerDAO")
	BannerDAO bannerDAO;	

	@Override
	public List<BannerVO> selectbannerInfo(BannerVO vo) throws Exception {
		return bannerDAO.selectbannerInfo(vo);
	}
	
	@Override
	public List<BannerVO> selectbannersubInfo(BannerVO vo) throws Exception {
		return bannerDAO.selectbannersubInfo(vo);
	}
	
	@Override
	public List<BannerVO> selectBannersubUpdateInfo(BannerVO vo) throws Exception {
		return bannerDAO.selectBannersubUpdateInfo(vo);
	}
	
	@Override
	public int selectbannersubInfoCount(BannerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bannerDAO.selectbannersubInfoCount(vo);
	}
	
	@Override
	public BannerVO selectbannerConfig(BannerVO vo) throws Exception {
		return bannerDAO.selectbannerConfig(vo);
	}
	
	
	@Override
	public int insertbannerInfo(BannerVO vo) throws Exception {
		return bannerDAO.insertbannerInfo(vo);
	}
	
	@Override
	public int insertbannersubInfo(BannerVO vo) throws Exception {
		return bannerDAO.insertBannersub(vo);
	}

	@Override
	public int selectbannerInfoCount(BannerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bannerDAO.selectbannerInfoCount(vo);
	}
	
	
	@Override
	public int deleteBannerInfo(BannerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bannerDAO.deleteBannerInfo(vo);
	}
	
}



