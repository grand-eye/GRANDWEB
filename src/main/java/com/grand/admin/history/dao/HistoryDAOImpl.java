package com.grand.admin.history.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.history.vo.HistoryVO;

@Repository("historyDAO")
public class HistoryDAOImpl implements HistoryDAO {
	 

	
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    	
	
	
	private String Namespace = this.getClass().getName() +".Mapper";



	@Override
	public List<HistoryVO> selectHistory(HistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectHistory", vo);
	}
	
		 
	
}
