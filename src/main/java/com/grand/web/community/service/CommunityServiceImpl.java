package com.grand.web.community.service;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.grand.web.community.dao.TBoardDAO;
import com.grand.web.community.vo.TBoardVO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Inject
	private TBoardDAO tBoardDAO;
	
	@Override
	public List<TBoardVO> selectCommunity(TBoardVO vo) throws Exception {
		
		if( vo.getSearch_category() !=null && vo.getSearch_category() !="" ) {
			vo.setSearch_category_split(vo.getSearch_category().split(","));
		}
		
		// TODO Auto-generated method stub
		return tBoardDAO.selectCommunity(vo);
	}
	
	@Override
	public List<TBoardVO> selectCounsel(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tBoardDAO.selectCommunity(vo);
	}

	@Override
	public List<TBoardVO> selectNoticeList() throws Exception {
		// TODO Auto-generated method stub
		return tBoardDAO.selectNoticeList();
	}
	@Override
	public int selectNoticeCount(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tBoardDAO.selectNoticeCount(vo);
	}

	@Override
	public int insertBoard(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tBoardDAO.insertBoard(vo);
	}

	@Override
	public int updateBoardCnt(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tBoardDAO.updateBoardCnt(vo);
	}

	@Override
	public int deleteBoard(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tBoardDAO.deleteBoard(vo);
	}

	@Override
	public int updateBoard(TBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tBoardDAO.updateBoard(vo);
	}

	


}
