package com.grand.admin.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.member.vo.TblMemberVO;


@Repository("tblMemberDAO")
public class TblMemberDAOImpl implements TblMemberDAO {
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String Namespace = this.getClass().getName() +".Mapper";

	
	@Override
	public List<TblMemberVO> selectMemberList(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectMemberList", tblMemberVO);
	}
	
	@Override
	public int selectMemberCount(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectMemberCount", tblMemberVO);
	}
	
	@Override
	public TblMemberVO selectMember(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectMember", tblMemberVO);
	}
	
	@Override
	public int insertMember(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertMember", tblMemberVO);
	}
	
	@Override
	public int deleteMember(TblMemberVO tblMemberVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace +".deleteMember", tblMemberVO);
	}
	
}
