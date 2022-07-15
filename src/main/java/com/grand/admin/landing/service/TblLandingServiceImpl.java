package com.grand.admin.landing.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.grand.admin.landing.dao.TblLandingDAO;
import com.grand.admin.landing.vo.TblLandingVO;

@Service
public class TblLandingServiceImpl implements TblLandingService {
	
	@Inject
	private TblLandingDAO tblLandingDao;

	@Override
	public List<TblLandingVO> selectLandingList(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		vo.setFile_gubun("landing");
		return tblLandingDao.selectLandingList(vo);
	}
	
	@Override
	public int selectLandingCount(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblLandingDao.selectLandingCount(vo);
	}

	@Override
	public int insertLanding(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblLandingDao.insertLanding(vo);
	}

	@Override
	public int deleteLanding(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblLandingDao.deleteLanding(vo);
	}

	@Override
	public TblLandingVO selectLanding(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		vo.setFile_gubun("landing");
		return tblLandingDao.selectLanding(vo);
	}

	@Override
	public List<TblLandingVO> selectLandingFileList(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return tblLandingDao.selectLandingFileList(vo);
	}

	@Override
	public int insertLandingFile(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		vo.setFile_gubun("landing");
		return tblLandingDao.insertLandingFile(vo);
	}

	@Override
	public int deleteLandingFile(TblLandingVO vo) throws Exception {
		// TODO Auto-generated method stub
		vo.setFile_gubun("landing");
		return tblLandingDao.deleteLandingFile(vo);
	}

}
