package com.grand.admin.landing.dao;


import java.util.List;

import com.grand.admin.landing.vo.TblLandingVO;

public interface TblLandingDAO {
	
	public List<TblLandingVO> selectLandingList(TblLandingVO vo) throws Exception;
	
	public int selectLandingCount(TblLandingVO vo) throws Exception;
	
	public int insertLanding(TblLandingVO vo) throws Exception;
	
	public int deleteLanding(TblLandingVO vo) throws Exception;
	
	public TblLandingVO selectLanding(TblLandingVO vo) throws Exception;
	
	public List<TblLandingVO> selectLandingFileList(TblLandingVO vo) throws Exception;
	
	public int insertLandingFile(TblLandingVO vo) throws Exception;
	
	public int deleteLandingFile(TblLandingVO vo) throws Exception;
	
}
