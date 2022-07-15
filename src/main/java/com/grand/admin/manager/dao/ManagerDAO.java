package com.grand.admin.manager.dao;


import java.util.List;

import com.grand.admin.manager.vo.ManagerHistoryVO;
import com.grand.admin.manager.vo.ManagerVO;

public interface ManagerDAO {
	public int selectManagerLoginStateCount(ManagerHistoryVO vo) throws Exception;
	public int selectManagerLoginDayCount(ManagerVO vo) throws Exception;
	public List<ManagerVO> selectGetManager(ManagerVO vo) throws Exception;
	public List<ManagerVO> selectManagerLogin(ManagerVO vo) throws Exception;
	public int insertManagerHistory(ManagerHistoryVO vo) throws Exception;
	public int updateManagerLoginDate(ManagerVO vo) throws Exception;
	public int selectExistsManagerID(ManagerVO vo) throws Exception;
	public int updateManager(ManagerVO vo) throws Exception;
	public int insertManager(ManagerVO vo) throws Exception;
	
		
	
	
	
}
