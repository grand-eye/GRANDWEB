package com.grand.admin.column;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.grand.admin.column.service.TblColumnService;
import com.grand.admin.column.vo.TblColumnVO;
import com.grand.admin.file.vo.FileVO;
import com.grand.message.service.MessageService;
import com.grand.message.vo.MessageVO;

@Controller
public class TblColumnControler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private TblColumnService tblColumnService;
	
	@Inject
	private MessageService messageService;
	
	@Value("#{file['webPath']}") 	private String webPath;
	
	@RequestMapping(value = "/admin/column/column", method = RequestMethod.GET)
	public String column(Model model, TblColumnVO vo) throws Exception {
		
		model.addAttribute("_prefix", "_column");
		model.addAttribute("_webPath", webPath);
		
		return "admin/column/column";
	}
	
	@RequestMapping(value = "/admin/interface/selectColumnList")
	@ResponseBody
	public Map<String, Object> selectColumnList(Locale locale, Model model, TblColumnVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		int columnCount = tblColumnService.selectColumnCount(vo);	
		List<TblColumnVO> columnList = null;
				
		if (columnCount > 0) {			
			columnList = tblColumnService.selectColumnList(vo);
		}
		
		map.put("total", columnCount);
		map.put("rows", columnList);

		return map;

	}
	
	@RequestMapping(value = "/admin/column/columnForm")
	public String columnForm(Locale locale, Model model, TblColumnVO vo) throws Exception  {
		
		MessageVO mvo = new MessageVO();
		mvo.setMsg_code( "column" );
		mvo.setMsg_locale( locale.getCountry() );
		String messageDbString     = messageService.getMsg(mvo);
		
		model.addAttribute("_fileInfo"  , messageDbString);
		
		List<TblColumnVO> columnFileList = null;
		
		if( vo.getColumn_idx() > 0 ) {
			columnFileList = tblColumnService.selectColumnFileList(vo);
		}
		
		if( columnFileList != null && columnFileList.size() >0 ) {
			model.addAttribute("columnFileList", columnFileList);
		}
		
		model.addAttribute("_prefix", "_columnForm");
   		model.addAttribute("_column"	, vo);
   		
   		return "admin/column/columnForm";
   		
	}
	
	@RequestMapping(value = "/admin/column/columnContent")
	public String columnContent(Model model, TblColumnVO vo) throws Exception  {
		
		model.addAttribute("_prefix", "_columnContent");
   		model.addAttribute("_column"	, vo);
   		
   		return "admin/column/columnContent";
   		
	}
	
	@RequestMapping(value = "/admin/interface/selectColumn")
	@ResponseBody
	public String selectColumn(Locale locale, Model model, TblColumnVO vo) throws Exception {
		
		TblColumnVO column 	= tblColumnService.selectColumn(vo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writeValueAsString(column);
        return jsonInString;		

	}
	
	
	@RequestMapping(value = "/admin/interface/insertColumn", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertColumn(Model model, TblColumnVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int insertCount	= tblColumnService.insertColumn(vo);
        int returnInt = vo.getColumn_idx();  
        int insertFileCount = 0;
        
        if (vo.getColumn_idx() >  0 && vo.getFile_name() != "") {
        	
        	tblColumnService.deleteColumnFile(vo);
        	
			insertFileCount = tblColumnService.insertColumnFile(vo);
			
		}
        
        
        if ( insertCount > 0) 
        {        
        	if(vo.getFile_name() != ""){
        		if (insertFileCount > 0) {
					map.put("resultCode", "Y");
				} else {
					map.put("resultCode", "N");
				}
        	} else {        		
        		map.put("resultCode", "Y");			
        	}
        } else {
			map.put("resultCode", "N");
		}
        
        map.put("returnInt",returnInt);
        map.put("resultCount", insertCount);
        return map;
	}
	
	@RequestMapping(value = "/admin/interface/insertColumnBackup", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertColumnBackup(Model model, TblColumnVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        int insertCount	= tblColumnService.insertColumnBackup(vo);
        int returnInt = vo.getColumn_idx();  
        int insertFileCount = 0;
        
        if (vo.getColumn_idx() >  0 && vo.getFile_name() != "") {
        	
        	tblColumnService.deleteColumnFile(vo);
        	
			insertFileCount = tblColumnService.insertColumnFile(vo);
			
		}
        
        
        if ( insertCount > 0) 
        {        
        	if(vo.getFile_name() != ""){
        		if (insertFileCount > 0) {
					map.put("resultCode", "Y");
				} else {
					map.put("resultCode", "N");
				}
        	} else {        		
        		map.put("resultCode", "Y");			
        	}
        } else {
			map.put("resultCode", "N");
		}
        
        map.put("returnInt",returnInt);
        map.put("resultCount", insertCount);
        return map;
	}
	
	@RequestMapping(value = "/admin/interface/deleteColumn", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteColumn(Model model, TblColumnVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        int deleteCount	= tblColumnService.deleteColumn(vo);
                
        if ( deleteCount > 0) 
        {        	
			map.put("resultCode", "Y");			
        } else {
			map.put("resultCode", "N");
		}
        
        map.put("resultCount", deleteCount);
        return map;
	}	 
	
	@RequestMapping(value = "/admin/column/{code}", method = RequestMethod.GET)
	public String columnPage(Locale locale, Model model, @PathVariable String code, TblColumnVO vo) throws Exception {
		
		vo.setColumn_path(code);
		
		model.addAttribute("_prefix", "_" + code);
		model.addAttribute("vo"	, vo);
		model.addAttribute("column_path"	, code);
		
   		return "admin/column/index";
	}
	
	@RequestMapping(value = "/admin/interface/selectColumnKeyCount")
	@ResponseBody
	public Map<String, Object> selectColumnKeyCount(Locale locale, Model model, TblColumnVO vo) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count 	= tblColumnService.selectColumnCount(vo);
		
		 if ( count > 0) 
        {        	
			map.put("result", "N");			
        } else {
			map.put("result", "Y");
		}
	        
	     map.put("resultCount", count);
	     return map;	

	}

	@RequestMapping(value = "/admin/column/previewPopup")
	public String previewPopup(Locale locale, Model model, HttpServletRequest request) throws Exception {
		return "admin/column/previewPopup";
	}
}
