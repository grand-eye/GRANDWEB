package com.grand.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.grand.admin.file.vo.FileVO;

@Component
public class FileDownloadUtils extends AbstractView {
	
	@Value("#{file['rootPath']}")
	private String rootPath;	
	
	public void Download(){ 
		setContentType("application/octet-stream");
	} //파일 다운로드
	
	@Override 
	protected void renderMergedOutputModel(Map paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception { 
		
		File file = (File)paramMap.get("downloadFile");
		List<FileVO> fileInfo = (List<FileVO>)paramMap.get("fileInfo");

		/*setContentType("application/octet-stream");*/
		response.setContentType(getContentType()); 
		response.setContentLength((int)file.length()); 
		
		String ori_fileName = file.getName();
		ori_fileName =  fileInfo.get(0).getOrgName();
		
		if(request.getParameter("changefileName") != null && request.getParameter("changefileName") != "") {
			ori_fileName = request.getParameter("changefileName").toString();
		} 
		
		String downName = null;
		String browser = request.getHeader("User-Agent"); //파일 인코딩 
		if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){ 
			downName = URLEncoder.encode(ori_fileName,"UTF-8").replaceAll("\\+", "%20"); }
		else { 
			downName = new String(ori_fileName.getBytes("UTF-8"), "ISO-8859-1"); 
		}
		response.setHeader("Content-Disposition", "attachment; filename=\"" + downName + "\";"); 
		response.setHeader("Content-Transfer-Encoding", "binary"); 
		
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		
		try 
		{ 
			fis = new FileInputStream(file); 
			FileCopyUtils.copy(fis, out); 
		} catch(Exception e){ 
			e.printStackTrace(); 
			return;  
		} finally { 
			if(fis != null){
				try
				{ 
					fis.close();
				}
				catch(Exception e)
				{
					
				} 
			}
		} out.flush(); 
	} 

}
