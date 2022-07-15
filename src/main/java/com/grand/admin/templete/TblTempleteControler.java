package com.grand.admin.templete;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.grand.admin.board.service.BoardService;
import com.grand.admin.board.vo.BoardVO;
import com.grand.admin.templete.service.TblTempleteService;
import com.grand.admin.templete.vo.TblTempleteVO;

@Controller
public class TblTempleteControler {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private TblTempleteService tblTempleteService;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/admin/templete/templete/{code}", method = RequestMethod.GET)
	public String templete(Model model, @PathVariable String code, TblTempleteVO vo) throws Exception {
		
		model.addAttribute("_prefix", "_" + code);
		model.addAttribute("menu_code"	, code);		
		
		return "admin/templete/templete";
	}
	
	@RequestMapping(value = "/admin/templete/templetePanel/{code}", method = RequestMethod.GET)
	public String templetePanel(Model model, @PathVariable String code, TblTempleteVO vo) throws Exception {
		
		model.addAttribute("_prefix", "_" + code);
		model.addAttribute("menu_code"	, code);		
		
		return "admin/templete/templetePanel";
	}
	
	@RequestMapping(value = "/admin/interface/selectTempleteList")
	@ResponseBody
	public Map<String, Object> selectTempleteList(Locale locale, Model model, TblTempleteVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		int templeteCount = tblTempleteService.selectTempleteCount(vo);	
		List<TblTempleteVO> templeteList = null;
				
		if (templeteCount > 0) {			
			templeteList = tblTempleteService.selectTempleteList(vo);
		}
		
		map.put("total", templeteCount);
		map.put("rows", templeteList);

		return map;

	}
	
	@RequestMapping(value = "/admin/templete/templeteForm/{code_text}", method = RequestMethod.GET)
	public String memberForm(Model model, @PathVariable String code_text, TblTempleteVO vo) throws Exception  {
		
		BoardVO vvo = new BoardVO();
		vvo.setBoard_menu_code_text(code_text);
		List<BoardVO> boardOptionList = boardService.selectBoardOptionList(vvo);
		
		List<TblTempleteVO> templeteFileList = null;
		
		if ( vo.getTemplete_idx() > 0 ) {
			templeteFileList = tblTempleteService.selectTempleteFileList(vo);
		}
	
		if( templeteFileList != null && templeteFileList.size() > 0 ) {
   			model.addAttribute("templeteFileList"		, templeteFileList);
   		}
		
		model.addAttribute("menu_code"	, boardOptionList.get(0).getTcd_code());
		model.addAttribute("_prefix", boardOptionList.get(0).getTcd_code());
		
		model.addAttribute("boardOptionList"	, boardOptionList);
   		model.addAttribute("_templete", vo);
   		
   		return "admin/templete/templeteForm";
	}
	
	@RequestMapping(value = "/admin/interface/selectTemplete")
	@ResponseBody
	public String selectTemplete(Locale locale, Model model, TblTempleteVO vo) throws Exception {
		
		TblTempleteVO templete 	= tblTempleteService.selectTemplete(vo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writeValueAsString(templete);
        return jsonInString;		

	}
	
    @RequestMapping(value = "/admin/interface/insertTemplete", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertTemplete(Model model, TblTempleteVO vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        int insertCount	= tblTempleteService.insertTemplete(vo);
        int insertFileCount = 0;
        
        tblTempleteService.deleteTempleteFile(vo);
        if (vo.getTemplete_idx() > 0 && vo.getFile_name_arr() != "") {
			insertFileCount = tblTempleteService.insertTempleteFile(vo);
		}
        
        if ( insertCount > 0) 
        {
        	if(vo.getFile_name_arr() != ""){
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
        
        map.put("resultCount", insertCount);
        return map;
	}	    
    
    @RequestMapping(value = "/admin/interface/deleteTemplete", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteTemplete(Model model, TblTempleteVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("resultCode", "N");
        
        int deleteCount	= tblTempleteService.deleteTemplete(vo);
        if ( deleteCount > 0) 
        {
            map.put("resultCode", "Y");
        }
        
        return map;
	}
	
}
