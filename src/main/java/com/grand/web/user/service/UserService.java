package com.grand.web.user.service;

import java.util.List;
import java.util.Map;

import com.grand.web.community.vo.TBoardVO;
import com.grand.web.user.vo.TUserVO;

public interface UserService {
	public List<TBoardVO> selectCommunity(TBoardVO vo) throws Exception;
	public List<TBoardVO> selectNoticeList() throws Exception;
	public List<TBoardVO> selectCounsel(TBoardVO vo) throws Exception;
	
	public int idCheck(TUserVO vo) throws Exception;
	
	public Map<String, Object> userCheck(TUserVO vo) throws Exception;
	
	public int insertUser(TUserVO vo) throws Exception;
	
	public TUserVO userLogin(TUserVO vo) throws Exception;
	
	public int selectNoticeCount(TBoardVO vo) throws Exception;
	
	public int insertConsult(TBoardVO vo) throws Exception;
	
	public int updateUser(TUserVO vo) throws Exception;
	
	public int deleteUser(TUserVO vo) throws Exception;
	
	
}
