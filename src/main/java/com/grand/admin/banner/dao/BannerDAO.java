package com.grand.admin.banner.dao;

import java.util.List;

import com.grand.admin.banner.vo.BannerVO;

public interface BannerDAO {
	public List<BannerVO> selectbannerInfo(BannerVO vo) throws Exception;
	public int insertbannerInfo(BannerVO vo) throws Exception;
	public int insertBannersub(BannerVO vo) throws Exception;
	public int updatebannerInfo(BannerVO vo) throws Exception;
	public int deleteBannerInfo(BannerVO vo) throws Exception;
	public List<BannerVO> selectbannersubInfo(BannerVO vo) throws Exception;
	public List<BannerVO> selectBannersubUpdateInfo(BannerVO vo) throws Exception;
	public int selectbannersubInfoCount(BannerVO vo) throws Exception;
	public int selectbannerInfoCount(BannerVO vo) throws Exception;
	public BannerVO selectbannerConfig(BannerVO vo) throws Exception;
}
