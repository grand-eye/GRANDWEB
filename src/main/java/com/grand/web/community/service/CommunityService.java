package com.grand.web.community.service;

import java.util.List;

import com.grand.web.community.vo.TBoardVO;

public interface CommunityService {
	public List<TBoardVO> selectCommunity(TBoardVO vo) throws Exception;
	public List<TBoardVO> selectNoticeList() throws Exception;
	public List<TBoardVO> selectCounsel(TBoardVO vo) throws Exception;
	
	public int selectNoticeCount(TBoardVO vo) throws Exception;
	
	public int insertBoard(TBoardVO vo) throws Exception;
	
	public int updateBoardCnt(TBoardVO vo) throws Exception;
	
	public int deleteBoard(TBoardVO vo) throws Exception;
	
	public int updateBoard(TBoardVO vo) throws Exception;
}
