package com.grand.admin.banner.service;

import java.util.List;
import java.util.Map;

import com.grand.admin.banner.vo.BannerwebVO;

public interface BannerwebService {
	public List<BannerwebVO> selectbannerwebInfo(BannerwebVO vo) throws Exception;
	public int selectbannerwebInfoCount(BannerwebVO vo) throws Exception;
	public List<BannerwebVO> selectBannercommonInfo(BannerwebVO vo) throws Exception;
}
