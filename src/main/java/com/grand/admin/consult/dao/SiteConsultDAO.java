package com.grand.admin.consult.dao;

import java.util.List;

import com.grand.admin.consult.vo.SiteConsultVO;


public interface SiteConsultDAO {
	
	public List<SiteConsultVO> selectSiteConsultList(SiteConsultVO vo) throws Exception;
	
	public int selectSiteConsultCount(SiteConsultVO vo) throws Exception;
	
	public int updateSiteConsult(SiteConsultVO vo) throws Exception;
	
	public SiteConsultVO selectSiteConsult(SiteConsultVO vo) throws Exception;

	public void updateSiteConsultGrid(SiteConsultVO vo) throws Exception;
	
}
