package com.grand.web.test.service;

import java.util.List;
import com.grand.web.test.vo.TestVO;

public interface TestService {
	public List<TestVO> selectMember() throws Exception;
	public int insertMember(TestVO vo) throws Exception;
	public int updateMember(TestVO vo) throws Exception;

}
