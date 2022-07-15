package com.grand.admin.code.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.code.vo.CodeDetailVO;
import com.grand.admin.code.vo.CodeVO;

@Repository("codeDao")
public class CodeDAOImpl implements CodeDAO{
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    
    private String Namespace = this.getClass().getName() +".Mapper";

	@Override
	public int selectMasterCodeCount(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectMasterCodeCount" , vo);
	}

	@Override
	public List<CodeVO> selectMasterCode(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectMasterCode" , vo);
	}

	@Override
	public int insertCode(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertCode", vo);
	}

	@Override
	public int selectExistsCodeID(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectExistsCodeID", vo);
	}

	@Override
	public List<CodeDetailVO> selectCodeDetail(CodeDetailVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectCodeDetail" , vo);
	}

	@Override
	public int selectExistsCodeDetail(CodeDetailVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectExistsCodeDetail", vo);
	}

	@Override
	public int insertCodeDetail(CodeDetailVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertCodeDetail", vo);
	}
    
    
    
    
}
