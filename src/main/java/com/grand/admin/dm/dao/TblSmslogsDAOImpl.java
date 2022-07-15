package com.grand.admin.dm.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.dm.vo.SmsMsgSetVO;
import com.grand.admin.dm.vo.TblSmsConfigVO;
import com.grand.admin.dm.vo.TblSmslogsVO;


@Repository("tblSmslogsDAO")
public class TblSmslogsDAOImpl implements TblSmslogsDAO {
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String Namespace = this.getClass().getName() +".Mapper";

	
	@Override
	public List<TblSmslogsVO> selectSmslogsList(TblSmslogsVO tblSmslogsVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectSmslogsList", tblSmslogsVO);
	}

	@Override
	public int selectSmslogsCount(TblSmslogsVO tblSmslogsVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectSmslogsCount", tblSmslogsVO);
	}
	
	@Override
	public List<SmsMsgSetVO> selectSmsMsgList(SmsMsgSetVO smsMsgSetVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectSmsMsgList", smsMsgSetVO);
	}

	@Override
	public int selectSmsMsgCount(SmsMsgSetVO smsMsgSetVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectSmsMsgCount", smsMsgSetVO);
	}

	@Override
	public int insertSmsMsgSet(SmsMsgSetVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertSmsMsgSet", vo);
	}

	@Override
	public List<TblSmsConfigVO> selectSmsConfig(TblSmsConfigVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectSmsConfig", vo);
	}

	@Override
	public int updateSmsConfig(TblSmsConfigVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace +".updateSmsConfig", vo);
	}
	
}
