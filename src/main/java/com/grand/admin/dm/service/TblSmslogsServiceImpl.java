package com.grand.admin.dm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.grand.admin.dm.dao.TblSmslogsDAO;
import com.grand.admin.dm.vo.SmsMsgSetVO;
import com.grand.admin.dm.vo.TblSmsConfigVO;
import com.grand.admin.dm.vo.TblSmslogsVO;


@Service("tblSmslogsService")
public class TblSmslogsServiceImpl implements TblSmslogsService {

	@Resource(name="tblSmslogsDAO")
	TblSmslogsDAO tblSmslogsDAO;
	
	@Override
	public List<TblSmslogsVO> selectSmslogsList(TblSmslogsVO tblSmslogsVO) throws Exception {
		// TODO Auto-generated method stub
		return tblSmslogsDAO.selectSmslogsList(tblSmslogsVO);
	}
	
	@Override
	public int selectSmslogsCount(TblSmslogsVO tblSmslogsVO) throws Exception {
		// TODO Auto-generated method stub
		return tblSmslogsDAO.selectSmslogsCount(tblSmslogsVO);
	}
	
	@Override
	public List<SmsMsgSetVO> selectSmsMsgList(SmsMsgSetVO smsMsgSetVO) throws Exception {
		// TODO Auto-generated method stub
		return tblSmslogsDAO.selectSmsMsgList(smsMsgSetVO);
	}

	@Override
	public int selectSmsMsgCount(SmsMsgSetVO smsMsgSetVO) throws Exception {
		// TODO Auto-generated method stub
		return tblSmslogsDAO.selectSmsMsgCount(smsMsgSetVO);
	}

	@Override
	public int insertSmsMsgSet(SmsMsgSetVO smsMsgSetVO) throws Exception {
		// TODO Auto-generated method stub
		return tblSmslogsDAO.insertSmsMsgSet(smsMsgSetVO);
	}

	@Override
	public List<TblSmsConfigVO> selectSmsConfig(TblSmsConfigVO tblSmsConfigVO) throws Exception {
		// TODO Auto-generated method stub
		return tblSmslogsDAO.selectSmsConfig(tblSmsConfigVO);
	}

	@Override
	public int updateSmsConfig(TblSmsConfigVO tblSmsConfigVO) throws Exception {
		// TODO Auto-generated method stub
		return tblSmslogsDAO.updateSmsConfig(tblSmsConfigVO);
	}
}
