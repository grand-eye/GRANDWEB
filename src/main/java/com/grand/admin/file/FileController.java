package com.grand.admin.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.tika.Tika;
import org.apache.tika.detect.DefaultDetector;
import org.apache.tika.detect.Detector;
import org.apache.tika.io.TikaInputStream;
import org.apache.tika.metadata.Metadata;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.grand.admin.file.service.FileService;
import com.grand.admin.file.vo.FileParamVO;
import com.grand.admin.file.vo.FileVO;
import com.grand.admin.file.vo.FileWhiteVO;
import com.grand.message.service.MessageService;
import com.grand.message.vo.MessageVO;
import com.grand.util.common.Constants;
import com.grand.util.common.DateUtil;
import com.grand.util.common.StringUtil;


@Controller
public class FileController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@Resource(name="fileService")
	private FileService fileService;
	

	@Value("#{file['webPath']}")
	private String webPath;	
	
	@Value("#{file['rootPath']}")
	private String rootPath;		
	
	
	@Inject
	private MessageService messageService;

	
	
    @RequestMapping(value = "/admin/file/commonFileRegForm", method = RequestMethod.GET)
	public String commonFileRegForm(Locale locale, FileParamVO vo, Model model) throws Exception {
    		model.addAttribute("_prefix", "_commonFileRegForm");
    		model.addAttribute("_fileParam"  , vo);
    		
    		MessageVO mvo = new MessageVO();
    		mvo.setMsg_code( vo.getS_category() );
    		mvo.setMsg_locale( locale.getCountry() );
    		
    		String messageDbString     = messageService.getMsg(mvo);
    		
    		model.addAttribute("_fileInfo"  , messageDbString);
    		
    		return "admin/file/commonFileRegForm";
		
	}		
    
    @RequestMapping(value = "/admin/file/landingFileRegForm", method = RequestMethod.GET)
	public String landingFileRegForm(Locale locale, FileParamVO vo, Model model) throws Exception {
    	
    		if( !vo.getS_category().equals("") && vo.getS_category().equals("landing")) {    			
    			model.addAttribute("_prefix", "_landingFileRegForm");
    		} else if( !vo.getS_category().equals("") && vo.getS_category().equals("column")) {
    			model.addAttribute("_prefix", "_columnFileRegForm");
    		}
    		model.addAttribute("_fileParam"  , vo);
    		
    		MessageVO mvo = new MessageVO();
    		mvo.setMsg_code( vo.getS_category() );
    		mvo.setMsg_locale( locale.getCountry() );
    		
    		String messageDbString     = messageService.getMsg(mvo);
    		
    		model.addAttribute("_fileInfo"  , messageDbString);
    		model.addAttribute("_fileKey"  , vo.getFileKey());
    		
    		return "admin/file/landingFileRegForm";
		
	}		
    

    @RequestMapping(value = "/admin/file/fileWhiteList", method = RequestMethod.GET)
	public String fileWhiteList(Locale locale, Model model) {
    		model.addAttribute("_prefix", "_fileWhiteList");
    		return "admin/file/fileWhiteList";
		
	}		
    
    
    @RequestMapping(value = "/admin/interface/insertFileWhite", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertMessageCode(Locale locale, Model model, FileWhiteVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int insertCount	= fileService.insertFileWhite(vo);
        String result = "Y";
        if ( insertCount > 0)
        {
            map.put("resultCode", "Y");
        }
        else
        {
            map.put("resultCode", "N");
        }
        
        map.put("resultCount", insertCount);
        return map;
	}	        
    
    
    @RequestMapping(value = "/admin/interface/selectFileWhiteList", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectFileWhiteList(Locale locale, Model model, FileWhiteVO vo) throws Exception {
        logger.info("home");
        
        Map<String, Object> map = new HashMap<String, Object>();
        List<FileWhiteVO> fileWhiteList 	= fileService.selectFileWhiteList(vo);
        
        map.put("rows", fileWhiteList);
        return map;
		
	}	      	
		
    @RequestMapping(value = "/admin/interface/selectFileList", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectFileList(Locale locale, Model model, FileVO vo) throws Exception {
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        if( StringUtil.isNotNull( vo.getFileKey() ) && !("undefined").equals(vo.getFileKey()) ) {
        	String[] fileKeyArray = vo.getFileKey().split(",");
			vo.setFileKeyArray(fileKeyArray);
        }
        
        List<FileVO> fileList 		= fileService.selectFileList(vo);
        int fileCount					= fileService.selectFileListCount(vo);
        
        map.put("web_root", webPath );
        map.put("rows", fileList);
        map.put("total", fileCount);        
        
        
        return map;
		
	}
	
    @RequestMapping(value = "/admin/manager/fileSet", method = RequestMethod.GET)
	public String testPage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("_prefix", "_fileSet");
		return "admin/file/fileSet";
	}	
    
    @RequestMapping(value = "/admin/manager/fileCommonform", method = RequestMethod.GET)
	public String fileCommonform(Locale locale, Model model) {
		model.addAttribute("_prefix", "_file");
		return "admin/file/fileFormTest";
	}
    
    @RequestMapping(value = "/admin/manager/multiFileCommonform", method = RequestMethod.GET)
    public String multiFileCommonform(Locale locale, Model model) {
    	model.addAttribute("_prefix", "_multiFile");
    	return "admin/file/multiFileFormTest";
    }
    
	@RequestMapping(value = "/admin/file/fileCommonUpload")
	@ResponseBody
    public Map<String, Object> fileCommonUpload(@RequestParam("file") MultipartFile uploadFile, FileVO vo, MultipartHttpServletRequest request,HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, String> upload = new HashMap<String, String>();
	
		FileVO filevo = fileService.selectFileConfig(vo);
		if (filevo != null) {
			
			filevo.setGroupCode(vo.getGroupCode());
			filevo.setSubCateCode(vo.getSubCateCode());
			filevo.setImageTags(vo.getImageTags());
			
			upload = fileUpload(uploadFile,filevo,session);
		} else {
			upload.put("flag", "N");
			upload.put("message", "카데고리 정보룰 확인해주세요.");
		}
        map.put("files", upload);
        
    	
    	return map;
    }
	
    
    @RequestMapping(value = "/admin/interface/selectFileInfo", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> selectFileInfo(Locale locale, Model model, FileVO vo) throws Exception {

    	Map<String, Object> map = new HashMap<String, Object>();
        int messageCount 						= fileService.selectFileInfoCount(vo);
        List<FileVO> messageList 			= fileService.selectFileInfo(vo);
        
        map.put("rows", messageList);
        map.put("total", messageCount);
        return map;
	}
    
    
    @RequestMapping(value = "/admin/interface/insertFile", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertFile(Locale locale, Model model, FileVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        System.out.println("@@1"+vo.getFilePath());
        
        int insertCount	= fileService.setFileInfo(vo);
        String result = "Y";
        if ( insertCount > 0)
        {
            map.put("resultCode", "Y");
        }
        else
        {
            map.put("resultCode", "N");
        }
        
        map.put("resultCount", insertCount);
        return map;
	}	    
    

	
	@RequestMapping(value="/admin/interface/getGroupCode")
	@ResponseBody
	public Map<String, Object> getGroupCode(Model model){
			String randomCode = UUID.randomUUID().toString();
			 Map<String, Object> map = new HashMap<String, Object>();
			 map.put("code", randomCode);
		        
		model.addAttribute("jsonData", randomCode);
		return map;
		
	}
	
	

	public Map<String, String> fileUpload(MultipartFile uploadFile,FileVO vo,HttpSession session) throws Exception {
		
        String path = "";
        String fileName = "";
        Map<String, String> map = new HashMap<String,String>();
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        try {
        	map.put("idx", "");
            map.put("flag", "N");
    		map.put("message", "업로드가 실패되었습니다.");
    		
    		
    		String Ori_fileName =  uploadFile.getOriginalFilename();
            String fileExtName   = Ori_fileName.substring(Ori_fileName.lastIndexOf(".")+1, Ori_fileName.length());
            String newFileName = StringUtil.getRandomString(12) + "." + fileExtName;
            String nowFileExt = "";
            
            int check_filesize = Integer.parseInt(vo.getFileSize());
            String getExtInfo = vo.getFileExt();
            String[] fileExtsArray;
            if ( getExtInfo.indexOf(",") > 0)
            {
            	fileExtsArray = getExtInfo.split(",");
            }
            else
            {
            	fileExtsArray = new String[]{getExtInfo};
            }
            
        	double     filesize = uploadFile.getSize()/1024/1024;
        	if(filesize > check_filesize) 
        	{
    			map.put("message", check_filesize + " MByte 이상의 파일은 올릴 수 없습니다.");
    			return map;
        	}	            
        	
        	
            Tika tika = new Tika();
            
        	TikaInputStream tikaStream = null;
        	Metadata metadata 				= new Metadata();
        	Detector detector 					= new DefaultDetector(); 
        	metadata.add(Metadata.RESOURCE_NAME_KEY, uploadFile.getOriginalFilename() );
        	
        	
        	
        	try {
        		tikaStream 					= TikaInputStream.get( uploadFile.getBytes() , metadata);
        		String getMimeType	= detector.detect(tikaStream, metadata).toString();
        		
        		FileWhiteVO fwVO = new FileWhiteVO();
        		fwVO.setSearch_word(getMimeType);
        		
        		List<FileWhiteVO> fileWhileList = fileService.selectFileWhiteList(fwVO);
        		if ( fileWhileList.size() <= 0 )
        		{
        			map.put("message",  fileExtName + "는 보안상 허용하지 않은 파일입니다.");
        			return map;        			
        		}
        		
        		for ( FileWhiteVO vfo : fileWhileList)
        		{
        			nowFileExt = vfo.getTfw_ext();
        		}
        		
            	int fileExtCount = 0;
            	for ( String checkFile : fileExtsArray)
            	{
            		if ( nowFileExt.equals(checkFile) )
            		{
            			fileExtCount++;
            		}
            	}

            	if ( fileExtCount <= 0 )
            	{
        			map.put("message", "해당 업로드에서 허용된 파일이 아닙니다.");
        			return map;        		
            	}
                        	        		
        	} catch (Exception e) {
        		
    			map.put("message", e.getMessage() );
    			return map;        		
        	} finally {
        		if (tikaStream != null) {
        			try {
        				tikaStream.close();
        			} catch (IOException e) {
        			}
        		}
        	}
        	
            Map<String, String> pathMap = new HashMap<String,String>();
            pathMap = getSaveLocation(vo);
            //path = session.getServletContext().getRealPath("/");
            path = pathMap.get("realPath");
            
            System.out.println("@@1="+path);
            System.out.println("@@2="+pathMap.get("realPath"));
            
            File fullpath_file = new File(path);
            if (Ori_fileName != null && !Ori_fileName.equals("")) {
            	
            	if(!fullpath_file.exists()) 
            	{
            		fullpath_file.mkdirs();
            	}
                
            	if (fullpath_file.exists()) {
                    fileName 		= newFileName;
                    fullpath_file 	= new File(path +"/"+ fileName);
                }
            	
            }
            
            System.out.println("fullpath_file="+fullpath_file);
	
            out = new FileOutputStream(fullpath_file);

            byte[] 		bytes 	 = uploadFile.getBytes();
            out.write(bytes);
            try {
	                if (out != null) {
	                    out.close();
	                }
            } catch (IOException e) {
                e.printStackTrace();
            }

        	
        	//file 테이블 인서트 
        	int resultIdx = 0;
        	vo.setFileName(	fileName	);
        	vo.setFilePath( 		pathMap.get("upload") );
        	vo.setOrgName(	Ori_fileName	);
        	vo.setExtCode( nowFileExt );
        	
        	resultIdx = fileService.setFile(vo);
        	
        	if(resultIdx <= 0)
        	{
        		map.put("message", "저장이 실패되었습니다.");
        	}
        	else {
        		map.put("flag", "Y");
        		map.put("idx", String.valueOf(vo.getIdx()));
        		map.put("message", "Insert성공");
        		map.put("filefullpath", "/imgpath" + pathMap.get("upload") + fileName);
        		map.put("file_path", pathMap.get("upload") );
        		map.put("web_root", webPath );
        		map.put("file_name", fileName );
        		map.put("original", Ori_fileName );
        		
        	}
        	
        } catch (Exception e) {
    		map.put("idx", String.valueOf(vo.getIdx()));
    		map.put("message", e.getMessage());
            e.printStackTrace();
            
        } finally {
        	  
        }
       return	map;
        
    }

    
    
    private Map<String, String> getSaveLocation(FileVO vo) {

    	String uploadPath = "";
    	Map<String, String> rMap = new HashMap<String,String>();
    	
    	if(vo.getFilePath() != null) {
    		uploadPath = vo.getFilePath();
    	}
    	
    	
    	String nowYear   = DateUtil.getYear();
    	String nowMonth = DateUtil.getMonth();
    	String nowDay     = DateUtil.getDay();
    	
    	uploadPath = uploadPath.replaceAll("\\{yyyy\\}"	, nowYear);
    	uploadPath = uploadPath.replaceAll("\\{mm\\}"		, nowMonth);
    	uploadPath = uploadPath.replaceAll("\\{dd\\}"		, nowDay);
    	
    	rMap.put("root"		, rootPath);
    	rMap.put("upload"	, uploadPath);
    	rMap.put("realPath"	, rootPath + uploadPath);

        return rMap;
    }
    
    @RequestMapping(value = "/admin/interface/deleteFile", method = RequestMethod.POST)
    @ResponseBody
	public void deleteFile(Locale locale, Model model, FileVO vo) throws Exception {
        fileService.deleteFile(vo);
	}
    
    
    
    
	


}
