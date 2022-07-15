package com.grand.admin.templete.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.templete.vo.TblTempleteVO;

@Repository("TblTempleteDao")
public class TblTempleteDAOImpl implements TblTempleteDAO {
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    
    private String Namespace = this.getClass().getName() +".Mapper";

	@Override
	public List<TblTempleteVO> selectTempleteList(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectTempleteList", vo);		
	}

	
	@Override
	public int selectTempleteCount(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectTempleteCount", vo);		
	}


	@Override
	public TblTempleteVO selectTemplete(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectTemplete", vo);		
	}


	@Override
	public int insertTemplete(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertTemplete", vo);		
	}


	@Override
	public int deleteTemplete(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace + ".deleteTemplete", vo);
	}

	@Override
	public List<TblTempleteVO> selectTempleteFileList(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectTempleteFileList", vo);		
	}
	
	@Override
	public int insertTempleteFile(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertTempleteFile", vo);		
	}


	@Override
	public int deleteTempleteFile(TblTempleteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace + ".deleteTempleteFile", vo);
	}

}
