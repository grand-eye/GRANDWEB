package com.grand.web.test.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.grand.web.test.vo.TestVO;

@Repository
public class TestDAOImpl implements TestDAO {
	
	@Inject
	private SqlSession sqlSession;
	private String Namespace = this.getClass().getName() +".Mapper";
	
		 
	@Override
	public List<TestVO> selectMember() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectMember");
	}
	
	public int insertMember(TestVO vo) {
		return sqlSession.insert(Namespace +".insertMember", vo);
	}
	
	public int updateMember(TestVO vo) {
		return sqlSession.update(Namespace +".updateMember", vo);
		
	}
}
