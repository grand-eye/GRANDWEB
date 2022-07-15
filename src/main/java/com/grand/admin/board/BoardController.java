package com.grand.admin.board;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.grand.admin.board.service.BoardService;
import com.grand.admin.board.vo.BoardVO;
import com.grand.admin.board.vo.HospitalHolidayVO;
import com.grand.admin.board.vo.NoteVO;
import com.grand.admin.consult.vo.SiteConsultVO;
import com.grand.admin.file.service.FileService;
import com.grand.admin.file.vo.FileVO;
import com.grand.admin.history.vo.HistoryVO;
import com.grand.util.IpCommon;
import com.grand.util.common.StringUtil;

@Controller
public class BoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Inject
	private BoardService boardService;

	@Resource(name="fileService")
	private FileService fileService;
	
	@RequestMapping(value = "/admin/board/board/{code}", method = RequestMethod.GET)
	public String testPage(Locale locale, Model model, @PathVariable String code, BoardVO vo) throws Exception {
		
		vo.setBoard_menu_code(code);
		
		List<BoardVO> boardOptionList = boardService.selectBoardOptionList(vo);
		
		model.addAttribute("_prefix", "_" + code);
		model.addAttribute("vo"	, vo);
		model.addAttribute("menu_code"	, code);
		model.addAttribute("boardOptionList"	, boardOptionList);

   		if( !StringUtil.isEmpty(boardOptionList.get(0).getTcd_attr6()) && boardOptionList.get(0).getTcd_attr6().equals("Y") ) {
   			return "admin/board/boardThumb";
   		} else {   			
   			if( code.equals("BD16") ) {   				
   				return "admin/board/reservation";   				
   			} else {   				
   				return "admin/board/board";   				
   			}
   		}
		
	}

	@RequestMapping(value = "/admin/board/insertBoard", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertBoard(Locale locale, Model model, BoardVO vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		if (vo.getBoard_idx() == "")
		{
			vo.setBoard_idx(null);
		}
		
        IpCommon ipSet 		= new IpCommon();		
        String userIp				= ipSet.getClientIpAddress(req);
        String userIpServer	= ipSet.getLocalServerIp();
        vo.setBoard_reg_ip(userIp);
		
		int insertCount = boardService.insertBoard(vo);
		int insertFileCount = 0;
		
		boardService.deleteBoardFile(vo);
		
		if (vo.getBoard_idx() != "" && vo.getFile_name_arr() != "") {
			insertFileCount = boardService.insertBoardFile(vo);
		}
		
		if (insertCount > 0) {
			
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

	@RequestMapping(value = "/admin/board/deleteBoard", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteBoard(Locale locale, Model model, BoardVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int insertCount = boardService.deleteBoard(vo);
		
		if (insertCount > 0) {
			map.put("resultCode", "Y");
			
		} else {
			map.put("resultCode", "N");
		}

		map.put("resultCount", insertCount);
		return map;
	}
	
	@RequestMapping(value = "/admin/interface/selectBoard/{code}")
	@ResponseBody
	public Map<String, Object> selectBoard(Locale locale, Model model, @PathVariable String code, BoardVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		vo.setBoard_menu_code(code);
		
		//관리자 페이지 조회는 포함 안함
		
		/*
		 * if (vo.getBoard_idx() != null) { boardService.updateBoardCount(vo); } else {
		 * int boardCount = boardService.selectBoardCount(vo); map.put("total",
		 * boardCount); }
		 */
		
		int boardCount = boardService.selectBoardCount(vo);
		map.put("total", boardCount);
		
		List<BoardVO> boardList = boardService.selectBoard(vo);

		map.put("rows", boardList);
		
		return map;

	}
	
	@RequestMapping(value = "/admin/interface/selectBoardTop")
	@ResponseBody
	public Map<String, Object> selectBoardTop(Locale locale, Model model, BoardVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		List<BoardVO> boardList = boardService.selectBoardTop(vo);

		map.put("boardList", boardList);

		return map;

	}
	
	@RequestMapping(value = "/admin/board/boardForm/{code_text}")
	public String bannerForm(Model model, @PathVariable String code_text, BoardVO vo) throws Exception  {
		
		vo.setBoard_menu_code_text(code_text);
		
		List<BoardVO> boardOptionList = boardService.selectBoardOptionList(vo);
		List<BoardVO> boardFileList = null;
		if (vo.getBoard_idx() != "") {
			boardFileList = boardService.selectBoardFileList(vo);
		}
		
		model.addAttribute("menu_code"	, boardOptionList.get(0).getTcd_code());
		model.addAttribute("_prefix", boardOptionList.get(0).getTcd_code());
		 
   		model.addAttribute("boardOptionList"	, boardOptionList);
   		
   		if( boardFileList != null && boardFileList.size() > 0 ) {
   			model.addAttribute("boardFileList"		, boardFileList);
   		}
   		
   		model.addAttribute("_board"	, vo);
   		
   		if( !StringUtil.isEmpty(boardOptionList.get(0).getTcd_attr5()) && boardOptionList.get(0).getTcd_attr5().equals("N") ) {
   			return "admin/board/boardFormNoCon";
   		}else if(boardOptionList.get(0).getTcd_attr3().equals("boardInput")) {
   			return "admin/board/boardFormInput";
   		}else {
   			if( boardOptionList.get(0).getTcd_code().equals("BD16") ) {   				
   				return "admin/board/reservationForm";   				
   			} else {   				
   				return "admin/board/boardForm";
   			}   			
   		}
   		
	}

	@RequestMapping(value = "/admin/imgPopup")
	public String imgPopup(Locale locale, Model model, HttpServletRequest request, FileVO vo) throws Exception {
		
		String filePath = "";
		
		List<FileVO> fileInfo = fileService.selectDownloadFile(vo);
		
		if(fileInfo.size() > 0) {
			filePath = fileInfo.get(0).getFilePath() + fileInfo.get(0).getFileName();
		}
		
		model.addAttribute("idx", request.getParameter("idx"));
		model.addAttribute("filePath", filePath);
		return "admin/imgPopup";
	}
	
	@RequestMapping(value = "/admin/migImgPopup")
	public String migImgPopup(Locale locale, Model model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("filePath", request.getParameter("filePath"));
		
		return "admin/migImgPopup";
	}
	
	@RequestMapping(value = "/admin/board/holidayConfig", method = RequestMethod.GET)
	public String holidayConfig(Locale locale, Model model, BoardVO vo) throws Exception {
		
		model.addAttribute("vo"	, vo);
		
		return "admin/board/holidayConfig";
	}
	
	@RequestMapping(value = "/admin/interface/selectHolidayList")
	@ResponseBody
	public Map<String, Object> selectHolidayList(Locale locale, Model model, HospitalHolidayVO vo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		List<HospitalHolidayVO> holidayList = boardService.selectHolidayList(vo);

		map.put("rows", holidayList);

		return map;

	}
	
	@RequestMapping(value = "/admin/interface/deleteHoliday")
	@ResponseBody
	public Map<String, Object> deleteHoliday(Model model, HospitalHolidayVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int deleteCount = boardService.deleteHoliday(vo);
		
		if (deleteCount > 0) {
			map.put("resultCode", "Y");
			
		} else {
			map.put("resultCode", "N");
		}

		return map;
	}
	
	@RequestMapping(value = "/admin/interface/insertHoliday")
	@ResponseBody
	public Map<String, Object> insertHoliday(Model model, HospitalHolidayVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int deleteCount = boardService.insertHoliday(vo);
		
		if (deleteCount > 0) {
			map.put("resultCode", "Y");
			
		} else {
			map.put("resultCode", "N");
		}

		return map;
	}
	
	@RequestMapping(value = "/admin/board/boardNote")
	public String boardNote(Model model) {
		model.addAttribute("_prefix", "_note");
		return "admin/board/boardNote";
	}
	
	@RequestMapping(value = "/admin/interface/boardNoteList")
	public ModelAndView boardNoteList(NoteVO vo) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("rows", boardService.selectBoardNote(vo));
		return mv;
	}
	
	@RequestMapping(value = "/admin/board/noteForm", method = RequestMethod.GET)
	public String memberForm(Model model, NoteVO vo) throws Exception  {
						
	   		model.addAttribute("_prefix", "_noteForm");
	   		model.addAttribute("_note", vo);
	   		
	   		return "admin/board/noteForm";
	}
	
	@RequestMapping(value = "/admin/interface/selectNote")
	@ResponseBody
	public String selectMember(Locale locale, Model model, NoteVO vo) throws Exception {
		List<NoteVO> note = boardService.selectBoardNote(vo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writeValueAsString(note);
        return jsonInString;		

	}
	
	@RequestMapping(value = "/admin/board/insertNote", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> insertEvent(Model model, NoteVO vo, HttpServletRequest req, HttpServletResponse res) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultCode", "N");
        
        IpCommon ipSet 		= new IpCommon();		
        String userIp				= ipSet.getClientIpAddress(req);
        String userIpServer	= ipSet.getLocalServerIp();
        //vo.setTblDtmRegIp(userIp);
        
        int insertCount	= boardService.insertNote(vo);
        if ( insertCount > 0) 
        {
            map.put("resultCode", "Y");
        }
        map.put("resultCount", insertCount);
        return map;
	}	    
    
    @RequestMapping(value = "/admin/interface/deleteNote", method = RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> deleteEvent(Model model, NoteVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("resultCode", "N");
        
        int deleteCount	= boardService.deleteNote(vo);
        if ( deleteCount > 0) 
        {
            map.put("resultCode", "Y");
        }
        
        return map;
	}
    
	/*
	 * @RequestMapping(value = "/admin/interface/updateReservationGrid", method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public Map<String, Object>
	 * updateReservationGrid(HttpServletRequest req,@RequestBody BoardVO vo) throws
	 * Exception {
	 * 
	 * Map<String, Object> map = new HashMap<String, Object>();
	 * boardService.updateGrid(vo,req); return map; }
	 */
    
    @RequestMapping("/admin/board/excelDownload")
    public String excelTransform(@RequestParam Map<String, Object> paramMap, Map<String, Object> ModelMap, HttpServletResponse response, BoardVO vo) throws Exception{

        String file 		 		= paramMap.get("file").toString();
        String excelType  	= paramMap.get("target").toString();
        String searchType  = paramMap.get("searchType").toString();
         
        //response.setHeader("Content-disposition", "attachment; filename=" + file + ".xlsx"); 
        response.setHeader("Content-Disposition", "attachment; filename="+new String(file.getBytes("euc-kr"),"8859_1")+".xlsx");
        
        
        if( !searchType.equals("") && searchType != null ) {      	
        }
        
        List<BoardVO> excelList= boardService.selectBoard(vo); 
        ModelMap.put("excelList", excelList); 
        ModelMap.put("target", excelType);
        ModelMap.put("file", file);
        
        
        
        return "excelView";
 
    }
    
    @RequestMapping(value = "/admin/board/history")
	public String history(Locale locale, Model model, HttpServletRequest request) throws Exception {
		
    	model.addAttribute("_prefix", "_history");
		
		return "admin/board/history";
	}
    
    @RequestMapping(value = "/admin/interface/history")
	@ResponseBody
	public Map<String, Object> historyList(Locale locale, Model model, HistoryVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<HistoryVO> boardList = boardService.selectHistory(vo);

		map.put("rows", boardList);
		
		return map;

	}
    
	
	
}
