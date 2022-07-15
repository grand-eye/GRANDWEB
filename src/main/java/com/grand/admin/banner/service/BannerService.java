package com.grand.admin.banner.service;

import java.util.List;

import com.grand.admin.banner.vo.BannerVO;

public interface BannerService {
	public List<BannerVO> selectbannerInfo(BannerVO vo) throws Exception;
	public int insertbannerInfo(BannerVO vo) throws Exception;
	public int insertbannersubInfo(BannerVO vo) throws Exception;
	public int selectbannerInfoCount(BannerVO vo) throws Exception;
	public int deleteBannerInfo(BannerVO vo) throws Exception;
	public BannerVO selectbannerConfig(BannerVO vo) throws Exception;
	public List<BannerVO> selectbannersubInfo(BannerVO vo) throws Exception;
	public List<BannerVO> selectBannersubUpdateInfo(BannerVO vo) throws Exception;
	public int selectbannersubInfoCount(BannerVO vo) throws Exception;
}
