package com.grand.admin.board.dao;

import java.util.List;

import com.grand.admin.board.vo.BoardVO;
import com.grand.admin.board.vo.HospitalHolidayVO;

public interface BoardDAO {

	public List<BoardVO> selectBoard(BoardVO vo) throws Exception;

	public int selectBoardCount(BoardVO vo) throws Exception;

	public int insertBoard(BoardVO vo) throws Exception;
	
	public int updateBoardCount(BoardVO vo) throws Exception;
	
	public int deleteBoard(BoardVO vo) throws Exception;
	
	public int insertBoardFile(BoardVO vo) throws Exception;
	
	public int deleteBoardFile(BoardVO vo) throws Exception;
	
	public List<BoardVO> selectBoardOptionList(BoardVO vo) throws Exception;
	
	public List<BoardVO> selectBoardTop(BoardVO vo) throws Exception;
	
	public List<BoardVO> selectBoardFileList(BoardVO vo) throws Exception;
	
	public List<HospitalHolidayVO> selectHolidayList(HospitalHolidayVO vo) throws Exception;

	public int deleteHoliday(HospitalHolidayVO vo) throws Exception;
	
	public int insertHoliday(HospitalHolidayVO vo) throws Exception;
	
	public void updateGrid(BoardVO vo) throws Exception;
	
	public void insertHistory(BoardVO vo) throws Exception;
	
}
