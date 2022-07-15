package com.grand.admin.member.dao;

import java.util.List;

import com.grand.admin.member.vo.TblMemberVO;

public interface TblMemberDAO {
	
	public List<TblMemberVO> selectMemberList(TblMemberVO vo) throws Exception;
	
	public int selectMemberCount(TblMemberVO vo) throws Exception;
	
	public TblMemberVO selectMember(TblMemberVO vo) throws Exception;
	
	public int insertMember(TblMemberVO vo) throws Exception;
	
	public int deleteMember(TblMemberVO vo) throws Exception;
}
