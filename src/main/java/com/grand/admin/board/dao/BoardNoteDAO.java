package com.grand.admin.board.dao;

import java.util.List;

import com.grand.admin.board.vo.NoteVO;

public interface BoardNoteDAO {

	public List<NoteVO> selectBoardNote(NoteVO vo) throws Exception;
	public int insertNote(NoteVO vo) throws Exception;
	public int deleteNote(NoteVO vo) throws Exception;
	
}
