package com.grand.admin.column.dao;


import java.util.List;

import com.grand.admin.column.vo.TblColumnVO;

public interface TblColumnDAO {
	
	public List<TblColumnVO> selectColumnList(TblColumnVO vo) throws Exception;
	
	public int selectColumnCount(TblColumnVO vo) throws Exception;
	
	public int insertColumn(TblColumnVO vo) throws Exception;
	
	public int insertColumnBackup(TblColumnVO vo) throws Exception;
	
	public int deleteColumn(TblColumnVO vo) throws Exception;
	
	public TblColumnVO selectColumn(TblColumnVO vo) throws Exception;
	
	public List<TblColumnVO> selectColumnFileList(TblColumnVO vo) throws Exception;
	
	public int insertColumnFile(TblColumnVO vo) throws Exception;
	
	public int deleteColumnFile(TblColumnVO vo) throws Exception;
	
}
