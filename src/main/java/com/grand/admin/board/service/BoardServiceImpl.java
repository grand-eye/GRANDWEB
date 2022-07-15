package com.grand.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.grand.admin.board.dao.BoardDAO;
import com.grand.admin.board.dao.BoardNoteDAO;
import com.grand.admin.board.vo.BoardVO;
import com.grand.admin.board.vo.HospitalHolidayVO;
import com.grand.admin.board.vo.NoteVO;
import com.grand.admin.history.dao.HistoryDAO;
import com.grand.admin.history.vo.HistoryVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO boardDao;
	
	@Inject
	private BoardNoteDAO boardNoteDAO;
	
	@Inject
	private HistoryDAO historyDAO;

	@Override
	public List<BoardVO> selectBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoard(vo);
	}

	@Override
	public List<BoardVO> selectBoardOptionList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardOptionList(vo);
	}

	@Override
	public List<BoardVO> selectBoardTop(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardTop(vo);
	}
	
	@Override
	public List<BoardVO> selectBoardFileList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardFileList(vo);
	}

	@Override
	public int selectBoardCount(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardCount(vo);
	}

	@Override
	public int insertBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.insertBoard(vo);
	}

	@Override
	public int updateBoardCount(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.updateBoardCount(vo);
	}
	
	@Override
	public int deleteBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.deleteBoard(vo);
	}

	
	@Override
	public int insertBoardFile(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.insertBoardFile(vo);
	}

	@Override
	public int deleteBoardFile(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.deleteBoardFile(vo);
	}

	@Override
	public List<HospitalHolidayVO> selectHolidayList(HospitalHolidayVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectHolidayList(vo);
	}

	@Override
	public int deleteHoliday(HospitalHolidayVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.deleteHoliday(vo);
	}

	@Override
	public int insertHoliday(HospitalHolidayVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.insertHoliday(vo);
	}

	@Override
	public List<NoteVO> selectBoardNote(NoteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardNoteDAO.selectBoardNote(vo);
	}

	@Override
	public int insertNote(NoteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardNoteDAO.insertNote(vo);
	}

	@Override
	public int deleteNote(NoteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardNoteDAO.deleteNote(vo);
	}

	@Override
	public void updateGrid(BoardVO vo,HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
	}

	@Override
	public List<HistoryVO> selectHistory(HistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return historyDAO.selectHistory(vo);
	}

}
