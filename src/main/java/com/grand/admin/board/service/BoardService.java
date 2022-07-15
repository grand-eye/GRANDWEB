package com.grand.admin.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.grand.admin.board.vo.BoardVO;
import com.grand.admin.board.vo.HospitalHolidayVO;
import com.grand.admin.board.vo.NoteVO;
import com.grand.admin.history.vo.HistoryVO;

public interface BoardService {
	public List<BoardVO> selectBoard(BoardVO vo) throws Exception;
	public List<HistoryVO> selectHistory(HistoryVO vo) throws Exception;
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
	public List<NoteVO> selectBoardNote(NoteVO vo) throws Exception;
	public int insertNote(NoteVO vo) throws Exception;
	public int deleteNote(NoteVO vo) throws Exception;
	public void updateGrid(BoardVO vo,HttpServletRequest req) throws Exception;
}
