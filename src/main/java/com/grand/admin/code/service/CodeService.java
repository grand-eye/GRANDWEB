package com.grand.admin.code.service;

import java.util.List;
import java.util.Map;

import com.grand.admin.code.vo.CodeDetailVO;
import com.grand.admin.code.vo.CodeVO;

public interface CodeService {
	public int selectMasterCodeCount(CodeVO vo) throws Exception;
	public List<CodeVO> selectMasterCode(CodeVO vo) throws Exception;
	public int insertCode(CodeVO vo) throws Exception;
	public int selectExistsCodeID(CodeVO vo) throws Exception;
	public List<Map<String, Object>> selectCodeDetail(CodeDetailVO vo) throws Exception;
	
	
	public List<CodeDetailVO> selectCodeDetailChild(CodeDetailVO vo) throws Exception;
	public int selectExistsCodeDetail(CodeDetailVO vo) throws Exception;
	public int insertCodeDetail(CodeDetailVO vo) throws Exception;
	
	
	public List<Map<String, Object>> selectCodeDetailLower(CodeDetailVO vo) throws Exception;	
}
