package com.grand.admin.gnb.service;

import java.util.List;
import java.util.Map;

import com.grand.admin.gnb.vo.GnbVO;

public interface GnbService {
	public List<Map<String, Object>> selectGnb(GnbVO vo) throws Exception;
	public int insertGnb(GnbVO vo) throws Exception;
	public int selectExistsGnb(GnbVO vo) throws Exception;
	public int selectGnbMax(GnbVO vo) throws Exception;
	public int insertGnbRule(List<Map<String, Object>>  param ) throws Exception;
	public int deleteGnb(GnbVO vo) throws Exception;
	
	public List<Map<String, Object>> selectGnbLower(GnbVO vo) throws Exception;
	
	public List<GnbVO> selectGnbOneData(GnbVO vo) throws Exception;
	
}
