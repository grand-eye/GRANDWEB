package com.grand.admin.file.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.grand.admin.file.dao.FileDAO;
import com.grand.admin.file.vo.FileVO;
import com.grand.admin.file.vo.FileWhiteVO;

@Service("fileService")
public class FileServiceImpl implements FileService {
	

	@Resource(name = "fileDao")
	FileDAO fileDao;	

	
	@Override
	public List<FileVO> selectFileInfo(FileVO vo) throws Exception {
		return fileDao.selectFileInfo(vo);
	}
	
	@Override
	public FileVO selectFileConfig(FileVO vo) throws Exception {
		return fileDao.selectFileConfig(vo);
	}
	
	@Override
	public int setFile(FileVO vo) throws Exception {
		return fileDao.setFile(vo); 
	}
	
	
	@Override
	public int setFileInfo(FileVO vo) throws Exception {
		return fileDao.insertFileInfo(vo);
	}

	@Override
	public int selectFileInfoCount(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return fileDao.selectFileInfoCount(vo);
	}

	@Override
	public int insertFileWhite(FileWhiteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return fileDao.insertFileWhite(vo);
	}

	@Override
	public List<FileWhiteVO> selectFileWhiteList(FileWhiteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return fileDao.selectFileWhiteList(vo);
	}

	@Override
	public List<FileVO> selectFileList(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return fileDao.selectFileList(vo);
	}
	
	@Override
	public List<FileVO> selectDownloadFile(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return fileDao.selectDownloadFile(vo);
	}

	@Override
	public int selectFileListCount(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return fileDao.selectFileListCount(vo);
	}

	@Override
	public void deleteFile(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		fileDao.deleteFile(vo);
	}
}



