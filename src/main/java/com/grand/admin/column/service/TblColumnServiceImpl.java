package com.grand.admin.column.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.grand.admin.column.dao.TblColumnDAO;
import com.grand.admin.column.vo.TblColumnVO;

@Service
public class TblColumnServiceImpl implements TblColumnService {
	
	@Inject
	private TblColumnDAO tblColumnDao;

	@Override
	public List<TblColumnVO> selectColumnList(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		vo.setFile_gubun("column");
		return tblColumnDao.selectColumnList(vo);
	}
	
	@Override
	public int selectColumnCount(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblColumnDao.selectColumnCount(vo);
	}

	@Override
	public int insertColumn(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblColumnDao.insertColumn(vo);
	}

	@Override
	public int deleteColumn(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblColumnDao.deleteColumn(vo);
	}

	@Override
	public TblColumnVO selectColumn(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		vo.setFile_gubun("column");
		return tblColumnDao.selectColumn(vo);
	}

	@Override
	public List<TblColumnVO> selectColumnFileList(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblColumnDao.selectColumnFileList(vo);
	}

	@Override
	public int insertColumnFile(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		vo.setFile_gubun("column");
		return tblColumnDao.insertColumnFile(vo);
	}

	@Override
	public int deleteColumnFile(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		vo.setFile_gubun("column");
		return tblColumnDao.deleteColumnFile(vo);
	}

	@Override
	public int insertColumnBackup(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblColumnDao.insertColumnBackup(vo);
	}

}
