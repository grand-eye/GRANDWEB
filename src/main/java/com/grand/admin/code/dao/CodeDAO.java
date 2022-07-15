package com.grand.admin.code.dao;

import java.util.List;

import com.grand.admin.code.vo.CodeDetailVO;
import com.grand.admin.code.vo.CodeVO;


public interface CodeDAO {
	public int selectMasterCodeCount(CodeVO vo) throws Exception;
	public List<CodeVO> selectMasterCode(CodeVO vo) throws Exception;
	public int insertCode(CodeVO vo) throws Exception;
	public int selectExistsCodeID(CodeVO vo) throws Exception;
	
	
	public List<CodeDetailVO> selectCodeDetail(CodeDetailVO vo) throws Exception;
	public int selectExistsCodeDetail(CodeDetailVO vo) throws Exception;
	public int insertCodeDetail(CodeDetailVO vo) throws Exception;
	
	//insertCodeDetail
}