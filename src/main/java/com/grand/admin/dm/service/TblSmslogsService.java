package com.grand.admin.dm.service;

import java.util.List;

import com.grand.admin.dm.vo.SmsMsgSetVO;
import com.grand.admin.dm.vo.TblSmsConfigVO;
import com.grand.admin.dm.vo.TblSmslogsVO;

public interface TblSmslogsService {	
	
	public List<TblSmslogsVO> selectSmslogsList(TblSmslogsVO tblSmslogsVO) throws Exception;
	
	public int selectSmslogsCount(TblSmslogsVO tblSmslogsVO) throws Exception;
	
	public List<SmsMsgSetVO> selectSmsMsgList(SmsMsgSetVO smsMsgSetVO) throws Exception;
	
	public int selectSmsMsgCount(SmsMsgSetVO smsMsgSetVO) throws Exception;
	
	public int insertSmsMsgSet(SmsMsgSetVO smsMsgSetVO) throws Exception;
	
	public List<TblSmsConfigVO> selectSmsConfig(TblSmsConfigVO tblSmsConfigVO) throws Exception;
	
	public int updateSmsConfig(TblSmsConfigVO tblSmsConfigVO) throws Exception;
		
}
