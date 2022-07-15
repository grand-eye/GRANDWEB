package com.grand.admin.file.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grand.admin.file.vo.FileVO;
import com.grand.admin.file.vo.FileWhiteVO;

@Repository("fileDao")
public class FileDAOImpl implements FileDAO {
	
    @Autowired
    @Resource(name="sqlSession")
    private SqlSession sqlSession;
	
	private String Namespace = this.getClass().getName() +".Mapper";
	
		 
	@Override
	public List<FileVO> selectFileInfo(FileVO vo) throws Exception {
		return sqlSession.selectList(Namespace +".selectFileInfo", vo);
	}
	
	@Override
	public int setFile(FileVO vo) throws Exception {
		return sqlSession.insert(Namespace +".setFile", vo);
	}
	
	@Override
	public FileVO selectFileConfig(FileVO vo) throws Exception {
		return sqlSession.selectOne(Namespace +".selectFileConfig", vo);
	}
	
	@Override
	public int insertFileInfo(FileVO vo) {
		return sqlSession.insert(Namespace +".insertFileInfo", vo);
	}
	
	@Override
	public int updateFileInfo(FileVO vo) {
		return sqlSession.update(Namespace +".updateFileInfo", vo);
	}

	@Override
	public int selectFileInfoCount(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectFileInfoCount" , vo);
	}

	@Override
	public int insertFileWhite(FileWhiteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace +".insertFileWhite", vo);
	}

	@Override
	public List<FileWhiteVO> selectFileWhiteList(FileWhiteVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectFileWhiteList", vo);
	}

	@Override
	public List<FileVO> selectFileList(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace +".selectFileList", vo);
	}
	
	@Override
	public List<FileVO> selectDownloadFile(FileVO vo) throws Exception {
		return sqlSession.selectList(Namespace +".selectDownloadFile", vo);
	}

	@Override
	public int selectFileListCount(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace +".selectFileListCount", vo);
	}

	@Override
	public void deleteFile(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace +".deleteFile", vo);
	}
}
