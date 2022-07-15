package com.grand.web.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grand.web.community.vo.TBoardVO;
import com.grand.web.user.dao.TUserDAO;
import com.grand.web.user.vo.TUserVO;
import com.grand.admin.common.service.CommonService;
import com.grand.web.test.vo.TestVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private TUserDAO tUserDAO;
	
	@Autowired
	private CommonService commonService;

	@Override
	public int idCheck(TUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tUserDAO.selectUserCount(vo);
	}
	
	@Override
	public Map<String, Object> userCheck(TUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		TUserVO resultData = tUserDAO.selectUserOne(vo);
		
		String tempPassword = "";
		
		if ( resultData.getTblStrID() != null)
		{
			
			tempPassword = temporaryPassword(8);
			vo.setTblStrPass(tempPassword);
			int resultUpdate = tUserDAO.updateUser(vo);
			
			if( resultUpdate == 1 ) {
				TestVO testVo = new TestVO();
				testVo.setId(  	vo.getTblStrID()  );
				testVo.setName( vo.getTblStrName() );
				testVo.setTempPassword(tempPassword);
				testVo.setCaseBy(2);
				testVo.setMail( vo.getTblStrEmail() );
				
				Map<String, Object> resultMail = commonService.mainSendService(testVo);
				
				result.put("result", resultMail.get("result"));
			}
		}
		
		return result;
	}
	
	private static String temporaryPassword(int size) {

		StringBuffer buffer = new StringBuffer();

		Random random = new Random();
		String chars[] = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
				

		for (int i = 0; i < size; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}

		return buffer.toString();

	}

	@Override
	public List<TBoardVO> selectNoticeList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TBoardVO> selectCounsel(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectNoticeCount(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertConsult(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TBoardVO> selectCommunity(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertUser(TUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tUserDAO.insertUser(vo);
	}

	@Override
	public TUserVO userLogin(TUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tUserDAO.selectUser(vo);
	}

	@Override
	public int updateUser(TUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tUserDAO.updateUser(vo);
	}

	@Override
	public int deleteUser(TUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tUserDAO.deleteUser(vo);
	}



}
