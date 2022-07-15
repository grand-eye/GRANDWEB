package com.grand.web.community;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grand.web.community.service.CommunityService;
import com.grand.web.community.vo.TBoardVO;


@Controller
public class CommunityController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private CommunityService communityService;
	
	
    @RequestMapping(value = "/community/interface/communityList/{menu_code}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> communityList(Locale locale, Model model,@PathVariable String menu_code,TBoardVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        vo.setBoard_menu_code(menu_code);
        
        if( vo.getBoard_reg_pass() ==null || vo.getBoard_reg_pass() =="" || vo.getBoard_reg_pass() =="N") {
        	map.put("rows", communityService.selectCommunity(vo));
        }
        
        map.put("count",  communityService.selectNoticeCount(vo));
        map.put("pageNum",vo.getStartpage());
 
        return map;
    }
    
    @RequestMapping(value = "/community/interface/noticeList", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> noticeList(Locale locale, Model model,TBoardVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("rows", communityService.selectNoticeList());
        map.put("count",  communityService.selectNoticeCount(vo));
 
        return map;
    }
    
    @RequestMapping(value = "/community/interface/deleteBoard", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteBoard(Locale locale, Model model,TBoardVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("result",  communityService.deleteBoard(vo));
 
        return map;
    }
    
    @RequestMapping(value = "/community/interface/updateBoard", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateBoard(Locale locale, Model model,TBoardVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("result",  communityService.updateBoard(vo));
 
        return map;
    }
    
    @RequestMapping(value = "/community/interface/insertBoard", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertConsult(Locale locale, Model model,TBoardVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        int result = communityService.insertBoard(vo);
        
        if( result == 1 ) {
        	map.put("resultMsg", "Y");
        }else {
        	map.put("resultMsg", "N");
        }
 
        return map;
    }
    
    @RequestMapping(value = "/community/interface/searchCounselList", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchCounselList(Locale locale, Model model,TBoardVO vo) throws Exception{
    	
        Map<String, Object> map = new HashMap<String, Object>();
        
        List<TBoardVO> List = communityService.selectCounsel(vo);
        
        map.put("rows", List);
 
        return map;
    }
    
    @RequestMapping(value = "/community/counsel", method = RequestMethod.GET)
    public String communityCounsel(Locale locale,Model model) throws Exception{
    	
    	model.addAttribute("menu_code", "BD04");
 
        return "/front/community/community_common_board";
    }
    
    @RequestMapping(value = "/community/notice", method = RequestMethod.GET)
    public String communityNotice(Locale locale,Model model) throws Exception{
    	
    	model.addAttribute("menu_code", "BD01");
    	
        return "/front/community/community_common_board";
    }
    
    @RequestMapping(value = "/community/review", method = RequestMethod.GET)
    public String communityReview(Locale locale,Model model) throws Exception{
 
    	model.addAttribute("menu_code", "BD06");
    	
        return "/front/community/community_common_board";
    }
    
    @RequestMapping(value = "/community/media", method = RequestMethod.GET)
    public String communityMedia(Locale locale,Model model) throws Exception{
    	
    	model.addAttribute("menu_code", "BD02");
 
        return "/front/community/community_common_board";
    }
    
    @RequestMapping(value = "/community/event", method = RequestMethod.GET)
    public String communityEvent(Locale locale,Model model) throws Exception{
    	
    	model.addAttribute("menu_code", "BD03");
 
        return "/front/community/community_common_board";
    }
    
    @RequestMapping(value = "/community/notice_detail/{board_idx}", method = RequestMethod.GET)
    public String communityNoticeDetail(Locale locale,Model model,@PathVariable int board_idx,TBoardVO vo) throws Exception{
    	model.addAttribute("menu_code","BD01");
    	model.addAttribute("board_idx",board_idx);
    	
    	vo.setBoard_idx(board_idx);
    	
    	communityService.updateBoardCnt(vo);
    	
        return "/front/community/community_common_board_detail";
    }
    
    @RequestMapping(value = "/community/review_detail/{board_idx}", method = RequestMethod.GET)
    public String communityReviewDetail(Locale locale,Model model,@PathVariable int board_idx,TBoardVO vo) throws Exception{
 
    	model.addAttribute("board_idx",board_idx);
    	model.addAttribute("menu_code","BD06");
    	
    	vo.setBoard_idx(board_idx);
    	
    	communityService.updateBoardCnt(vo);
    	
        return "/front/community/community_common_board_detail";
    }
    
    @RequestMapping(value = "/community/counsel_detail/{board_idx}", method = RequestMethod.GET)
    public String communityCounselDetail(Locale locale,Model model,@PathVariable int board_idx,TBoardVO vo) throws Exception{
 
    	model.addAttribute("menu_code","BD04");
    	model.addAttribute("board_idx",board_idx);
    	
    	vo.setBoard_idx(board_idx);
    	
    	communityService.updateBoardCnt(vo);
    	
        return "/front/community/community_common_board_detail";
    }
    
    @RequestMapping(value = "/community/counsel_write", method = RequestMethod.GET)
    public String communityCounselWrite(Locale locale,Model model) throws Exception{
 
    	model.addAttribute("menu_code","BD04");
    	
        return "/front/community/community_counsel_detail";
    }
    
    @RequestMapping(value = "/community/counsel_write/{board_idx}", method = RequestMethod.GET)
    public String communityCounselUpdate(Locale locale,Model model,TBoardVO vo,@PathVariable int board_idx) throws Exception{
 
    	model.addAttribute("menu_code","BD04");
    	model.addAttribute("board_idx",board_idx);
    	
        return "/front/community/community_counsel_detail";
    }
    
    @RequestMapping(value = "/community/media_detail/{board_idx}", method = RequestMethod.GET)
    public String communityMediaDetail(Locale locale,Model model,@PathVariable int board_idx,TBoardVO vo) throws Exception{
 
    	model.addAttribute("menu_code", "BD02");
    	model.addAttribute("board_idx", board_idx);
    	model.addAttribute("listdata","#media_detail_tmpl");
    	
    	vo.setBoard_idx(board_idx);
    	
    	communityService.updateBoardCnt(vo);
    	
        return "/front/community/community_common_board_detail";
    }
    
    @RequestMapping(value = "/community/event_detail/{board_idx}", method = RequestMethod.GET)
    public String communityEventDetail(Locale locale,Model model,@PathVariable int board_idx,TBoardVO vo) throws Exception{
 
    	model.addAttribute("menu_code", "BD03");
    	model.addAttribute("board_idx", board_idx);
    	
    	vo.setBoard_idx(board_idx);
    	
    	communityService.updateBoardCnt(vo);
    	
        return "/front/community/community_common_board_detail";
    }
    
    @RequestMapping(value = "/community/reservation", method = RequestMethod.GET)
    public String communityReservation(Locale locale,Model model) throws Exception{
 
    	model.addAttribute("menu_code","BD05");
    	model.addAttribute("category", "A060");
    	
        return "/front/community/community_reservation";
    }
    
    @RequestMapping(value = "/community/qna", method = RequestMethod.GET)
    public String communityQnA(Locale locale,Model model) throws Exception{
 
    	model.addAttribute("menu_code","BD07");
    	
        return "/front/community/community_common_board";
    }
    
}
