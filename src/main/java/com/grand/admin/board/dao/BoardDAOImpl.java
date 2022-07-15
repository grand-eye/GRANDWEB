package com.grand.admin.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.grand.admin.board.vo.BoardVO;
import com.grand.admin.board.vo.HospitalHolidayVO;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	private String Namespace = this.getClass().getName() + ".Mapper";

	@Override
	public List<BoardVO> selectBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectBoard", vo);
	}

	@Override
	public List<BoardVO> selectBoardOptionList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectBoardOptionList", vo);
	}
	
	@Override
	public List<BoardVO> selectBoardTop(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectBoardTop", vo);
	}
	
	@Override
	public List<BoardVO> selectBoardFileList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectBoardFileList", vo);
	}
	
	@Override
	public int selectBoardCount(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectBoardCount", vo);
	}

	@Override
	public int insertBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertBoard", vo);
	}

	@Override
	public int updateBoardCount(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace + ".updateBoardCount", vo);
	}
	
	@Override
	public int deleteBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace + ".deleteBoard", vo);
	}
	
	@Override
	public int insertBoardFile(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertBoardFile", vo);
	}

	@Override
	public int deleteBoardFile(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace + ".deleteBoardFile", vo);
	}

	@Override
	public List<HospitalHolidayVO> selectHolidayList(HospitalHolidayVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectHolidayList", vo);
	}

	@Override
	public int deleteHoliday(HospitalHolidayVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace + ".deleteHoliday", vo);
	}

	@Override
	public int insertHoliday(HospitalHolidayVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertHoliday", vo);
	}

	@Override
	public void updateGrid(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace + ".updateGrid",vo);
	}

	@Override
	public void insertHistory(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(Namespace + ".insertHistory",vo);
	}
	
}
