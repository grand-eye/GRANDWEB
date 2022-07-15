package com.grand.admin.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.grand.admin.board.vo.NoteVO;

@Repository("BoardNoteDAO")
public class BoardNoteDAOImpl implements BoardNoteDAO {

	@Inject
	private SqlSession sqlSession;
	private String Namespace = this.getClass().getName() + ".Mapper";

	@Override
	public List<NoteVO> selectBoardNote(NoteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectBoardNote",vo);
	}

	@Override
	public int insertNote(NoteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertNote",vo);
	}

	@Override
	public int deleteNote(NoteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace + ".deleteNote",vo);
	}
	
}
