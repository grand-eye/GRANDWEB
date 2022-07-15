package com.grand.admin.member.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.grand.admin.member.dao.TblMemberDAO;
import com.grand.admin.member.vo.TblMemberVO;

@Service("tblMemberService")
public class TblMemberServiceImpl implements TblMemberService {

	@Resource(name="tblMemberDAO")
	TblMemberDAO tblMemberDAO;
	
	@Override
	public List<TblMemberVO> selectMemberList(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return tblMemberDAO.selectMemberList(tblMemberVO);
	}
	
	@Override
	public int selectMemberCount(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return tblMemberDAO.selectMemberCount(tblMemberVO);
	}
	
	@Override
	public TblMemberVO selectMember(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return tblMemberDAO.selectMember(tblMemberVO);
	}
	
	@Override
	public int insertMember(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return tblMemberDAO.insertMember(tblMemberVO);
	}
	
	@Override
	public int deleteMember(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return tblMemberDAO.deleteMember(tblMemberVO);
	}
	
}
