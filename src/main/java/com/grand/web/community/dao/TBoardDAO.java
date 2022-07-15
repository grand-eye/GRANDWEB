package com.grand.web.community.dao;

import java.util.List;

import com.grand.web.community.vo.TBoardVO;

public interface TBoardDAO {
	public List<TBoardVO> selectCommunity(TBoardVO vo) throws Exception;
	public List<TBoardVO> selectNoticeList() throws Exception;
	
	public int selectNoticeCount(TBoardVO vo);
	
	public int insertBoard(TBoardVO vo) throws Exception;
	
	public int updateBoardCnt(TBoardVO vo) throws Exception;
	
	public int deleteBoard(TBoardVO vo) throws Exception;
	
	public int updateBoard(TBoardVO vo) throws Exception;
	
}
