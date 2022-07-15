package com.grand.admin.banner.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.grand.admin.banner.dao.BannerwebDAO;
import com.grand.admin.banner.vo.BannerwebVO;

@Service("bannerwebService")
public class BannerwebServiceImpl implements BannerwebService {
	
	@Resource(name = "bannerwebDAO")
	BannerwebDAO bannerwebDAO;	
	
	@Override
	public List<BannerwebVO> selectbannerwebInfo(BannerwebVO vo) throws Exception {
		return bannerwebDAO.selectbannerwebInfo(vo);
	}
	@Override
	public List<BannerwebVO> selectBannercommonInfo(BannerwebVO vo) throws Exception {
		return bannerwebDAO.selectBannercommonInfo(vo);
	}
	
	@Override
	public int selectbannerwebInfoCount(BannerwebVO vo) throws Exception {
		// TODO Auto-generated method stub
		return bannerwebDAO.selectbannerwebInfoCount(vo);
	}

	
}



