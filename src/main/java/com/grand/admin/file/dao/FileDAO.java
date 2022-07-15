package com.grand.admin.file.dao;

import java.util.List;

import com.grand.admin.file.vo.FileVO;
import com.grand.admin.file.vo.FileWhiteVO;

public interface FileDAO {
	public List<FileVO> selectFileInfo(FileVO vo) throws Exception;
	public int insertFileInfo(FileVO vo) throws Exception;
	public int updateFileInfo(FileVO vo) throws Exception;
	public int selectFileInfoCount(FileVO vo) throws Exception;
	public int setFile(FileVO vo) throws Exception;
	public FileVO selectFileConfig(FileVO vo) throws Exception;
	public int insertFileWhite(FileWhiteVO vo) throws Exception;
	public List<FileWhiteVO> selectFileWhiteList(FileWhiteVO vo) throws Exception;	
	public List<FileVO> selectFileList(FileVO vo) throws Exception;	
	public List<FileVO> selectDownloadFile(FileVO vo) throws Exception;
	
	
	public int selectFileListCount(FileVO vo) throws Exception;	
	public void deleteFile(FileVO vo) throws Exception;
	
	
	
}
