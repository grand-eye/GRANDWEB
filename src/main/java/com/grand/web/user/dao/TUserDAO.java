package com.grand.web.user.dao;

import java.util.List;

import com.grand.web.community.vo.TBoardVO;
import com.grand.web.user.vo.TUserVO;

public interface TUserDAO {
	public List<TBoardVO> selectCommunity(TBoardVO vo) throws Exception;
	public List<TBoardVO> selectNoticeList() throws Exception;
	
	public int selectNoticeCount(TBoardVO vo);
	
	public int selectUserCount(TUserVO vo);
	
	public int updateUser(TUserVO vo);
	
	public TUserVO selectUserOne(TUserVO vo);
	
	public TUserVO selectUser(TUserVO vo);
	
	public int insertUser(TUserVO vo) throws Exception;
	
	public int insertConsult(TBoardVO vo) throws Exception;
	
	public int deleteUser(TUserVO vo) throws Exception;
	
}
