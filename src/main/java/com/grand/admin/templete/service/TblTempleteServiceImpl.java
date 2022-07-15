package com.grand.admin.templete.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.grand.admin.templete.dao.TblTempleteDAO;
import com.grand.admin.templete.vo.TblTempleteVO;
import com.grand.util.common.Constants;

@Service
public class TblTempleteServiceImpl implements TblTempleteService {
	
	@Inject
	private TblTempleteDAO tblTempleteDao;

	@Override
	public List<TblTempleteVO> selectTempleteList(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub		
		return tblTempleteDao.selectTempleteList(vo);
	}
	
	@Override
	public int selectTempleteCount(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblTempleteDao.selectTempleteCount(vo);
	}

	@Override
	public TblTempleteVO selectTemplete(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblTempleteDao.selectTemplete(vo);
	}

	@Override
	public int insertTemplete(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblTempleteDao.insertTemplete(vo);
	}

	@Override
	public int deleteTemplete(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblTempleteDao.deleteTemplete(vo);
	}
	
	@Override
	public int deleteTempleteFile(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblTempleteDao.deleteTempleteFile(vo);
	}
	
	@Override
	public int insertTempleteFile(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblTempleteDao.insertTempleteFile(vo);
	}
	
	@Override
	public List<TblTempleteVO> selectTempleteFileList(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblTempleteDao.selectTempleteFileList(vo);
	}

}
