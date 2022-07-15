package com.grand.admin.manager.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.manager.vo.ManagerHistoryVO;
import com.grand.admin.manager.vo.ManagerVO;

@Repository("managerDao")
public class ManagerDAOImpl implements ManagerDAO {
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
    
    private String Namespace = this.getClass().getName() +".Mapper";

	@Override
	public int selectManagerLoginStateCount(ManagerHistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectManagerLoginStateCount", vo);
	}

	@Override
	public int selectManagerLoginDayCount(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectManagerLoginDayCount", vo);
	}

	@Override
	public List<ManagerVO> selectGetManager(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectGetManager" , vo);
	}

	@Override
	public List<ManagerVO> selectManagerLogin(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectManagerLogin" , vo);
	}

	@Override
	public int insertManagerHistory(ManagerHistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertManagerHistory", vo);
	}

	@Override
	public int updateManagerLoginDate(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace +".updateManagerLoginDate", vo);
	}

	@Override
	public int selectExistsManagerID(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectExistsManagerID", vo);
	}

	@Override
	public int updateManager(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace +".updateManager", vo);
	}

	@Override
	public int insertManager(ManagerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertManager", vo);
	}
    
    
    
    

}
