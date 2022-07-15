package com.grand.admin.column.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.column.vo.TblColumnVO;


@Repository("TblColumnDao")
public class TblColumnDAOImpl implements TblColumnDAO {
	
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    
    private String Namespace = this.getClass().getName() +".Mapper";

	@Override
	public List<TblColumnVO> selectColumnList(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectColumnList", vo);		
	}

	
	@Override
	public int selectColumnCount(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectColumnCount", vo);		
	}


	@Override
	public int insertColumn(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertColumn", vo);		
	}
	
	@Override
	public int deleteColumn(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace + ".deleteColumn", vo);		
	}


	@Override
	public TblColumnVO selectColumn(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".selectColumn", vo);		
	}


	@Override
	public List<TblColumnVO> selectColumnFileList(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectColumnFileList", vo);		
	}


	@Override
	public int insertColumnFile(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertColumnFile", vo);
	}


	@Override
	public int deleteColumnFile(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace + ".deleteColumnFile", vo);
	}


	@Override
	public int insertColumnBackup(TblColumnVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace + ".insertColumnBackup", vo);
	}
}
