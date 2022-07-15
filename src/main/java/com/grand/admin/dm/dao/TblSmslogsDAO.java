package com.grand.admin.dm.dao;

import java.util.List;

import com.grand.admin.dm.vo.SmsMsgSetVO;
import com.grand.admin.dm.vo.TblSmsConfigVO;
import com.grand.admin.dm.vo.TblSmslogsVO;


public interface TblSmslogsDAO {
	
	public List<TblSmslogsVO> selectSmslogsList(TblSmslogsVO vo) throws Exception;
	
	public int selectSmslogsCount(TblSmslogsVO vo) throws Exception;
	
	public List<SmsMsgSetVO> selectSmsMsgList(SmsMsgSetVO vo) throws Exception;
	
	public int selectSmsMsgCount(SmsMsgSetVO vo) throws Exception;
	
	public int insertSmsMsgSet(SmsMsgSetVO vo) throws Exception;
	
	public List<TblSmsConfigVO> selectSmsConfig(TblSmsConfigVO vo) throws Exception;
	
	public int updateSmsConfig(TblSmsConfigVO vo) throws Exception;
	
}
