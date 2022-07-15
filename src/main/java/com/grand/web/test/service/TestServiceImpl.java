package com.grand.web.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.grand.web.test.dao.TestDAO;
import com.grand.web.test.vo.TestVO;

@Service
public class TestServiceImpl implements TestService {
	
	@Inject
	private TestDAO testDao;
	
	@Override
	public List<TestVO> selectMember() throws Exception {
		// TODO Auto-generated method stub
		return testDao.selectMember();
	}
	@Override
	public int insertMember(TestVO vo) throws Exception {
		// TODO Auto-generated method stub
		return testDao.insertMember(vo);
	}
	
	@Override
	public int updateMember(TestVO vo) throws Exception {
		// TODO Auto-generated method stub
		return testDao.updateMember(vo);
	}

}
