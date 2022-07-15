package com.grand.admin.member.service;

import java.util.List;

import com.grand.admin.member.vo.TblMemberVO;

public interface TblMemberService {	
	
	public List<TblMemberVO> selectMemberList(TblMemberVO tblMemberVO) throws Exception;
	
	public int selectMemberCount(TblMemberVO tblMemberVO) throws Exception;
	
	public TblMemberVO selectMember(TblMemberVO tblMemberVO) throws Exception;
	
	public int insertMember(TblMemberVO tblMemberVO) throws Exception;
	
	public int deleteMember(TblMemberVO tblMemberVO) throws Exception;
	
}
