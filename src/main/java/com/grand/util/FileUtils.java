package com.grand.util;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import com.grand.admin.file.service.FileService;
import com.grand.admin.file.vo.FileVO;

@Component
public class FileUtils {
	
	@Resource(name="fileService")
	private FileService fileService;
	
	
	public String testUtil( FileVO vo) throws Exception {
		List<FileVO> uploadConfig = fileService.selectFileInfo(vo);	
		return "testUtl";
	}	
	
}
