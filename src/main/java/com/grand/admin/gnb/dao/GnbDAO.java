package com.grand.admin.gnb.dao;

import java.util.List;
import com.grand.admin.gnb.vo.GnbVO;

public interface GnbDAO {
	public List<GnbVO> selectGnb(GnbVO vo) throws Exception;
	public int insertGnb(GnbVO vo) throws Exception;
	public int selectExistsGnb(GnbVO vo) throws Exception;
	public int selectGnbMax(GnbVO vo) throws Exception;
	public int insertGnbRule(GnbVO vo) throws Exception;
	public int deleteGnb(GnbVO vo) throws Exception;
	
	public List<GnbVO> selectGnbOnlyClient(GnbVO vo) throws Exception;
	public List<GnbVO> selectGnbOneData(GnbVO vo) throws Exception;
	
	
	
}
