package com.grand.admin.manager.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.grand.admin.manager.dao.ManagerDAO;
import com.grand.admin.manager.vo.ManagerHistoryVO;
import com.grand.admin.manager.vo.ManagerVO;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

	@Resource(name = "managerDao")
	ManagerDAO managerDao;

	@Override
	public int selectManagerLoginStateCount(ManagerHistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return  managerDao.selectManagerLoginStateCount(vo);
	}

	@Override
	public int selectManagerLoginDayCount(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return managerDao.selectManagerLoginDayCount(vo);
	}

	@Override
	public List<ManagerVO> selectGetManager(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return managerDao.selectGetManager(vo);
	}

	@Override
	public List<ManagerVO> selectManagerLogin(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return managerDao.selectManagerLogin(vo);
	}

	@Override
	public int insertManagerHistory(ManagerHistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return managerDao.insertManagerHistory(vo);
	}

	@Override
	public int updateManagerLoginDate(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return managerDao.updateManagerLoginDate(vo);
	}

	@Override
	public int selectExistsManagerID(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return managerDao.selectExistsManagerID(vo);
	}

	@Override
	public int updateManager(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return managerDao.updateManager(vo);
	}

	@Override
	public int insertManager(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return managerDao.insertManager(vo);
	}	
	
}
