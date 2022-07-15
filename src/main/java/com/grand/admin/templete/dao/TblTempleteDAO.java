package com.grand.admin.templete.dao;


import java.util.List;

import com.grand.admin.templete.vo.TblTempleteVO;

public interface TblTempleteDAO {
	
	public List<TblTempleteVO> selectTempleteList(TblTempleteVO vo) throws Exception;
	
	public int selectTempleteCount(TblTempleteVO vo) throws Exception;
	
	public TblTempleteVO selectTemplete(TblTempleteVO vo) throws Exception;
	
	public int insertTemplete(TblTempleteVO vo) throws Exception;
	
	public int deleteTemplete(TblTempleteVO vo) throws Exception;
	
	public List<TblTempleteVO> selectTempleteFileList(TblTempleteVO vo) throws Exception;
	
	public int insertTempleteFile(TblTempleteVO vo) throws Exception;
	
	public int deleteTempleteFile(TblTempleteVO vo) throws Exception;
	
}
