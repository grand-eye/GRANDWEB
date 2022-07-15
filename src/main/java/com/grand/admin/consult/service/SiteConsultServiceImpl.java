package com.grand.admin.consult.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.grand.admin.board.dao.BoardDAO;
import com.grand.admin.board.vo.BoardVO;
import com.grand.admin.consult.dao.SiteConsultDAO;
import com.grand.admin.consult.vo.SiteConsultVO;

@Service
public class SiteConsultServiceImpl implements SiteConsultService {
	
	@Inject
	private SiteConsultDAO siteConsultDAO;
	
	@Inject
	private BoardDAO boardDao ;

	@Override
	public List<SiteConsultVO> selectSiteConsultList(SiteConsultVO vo) throws Exception {
		// TODO Auto-generated method stub
		return siteConsultDAO.selectSiteConsultList(vo);
	}

	@Override
	public int selectSiteConsultCount(SiteConsultVO vo) throws Exception {
		// TODO Auto-generated method stub
		return siteConsultDAO.selectSiteConsultCount(vo);
	}

	@Override
	public int updateSiteConsult(SiteConsultVO vo) throws Exception {
		// TODO Auto-generated method stub
		return siteConsultDAO.updateSiteConsult(vo);
	}

	@Override
	public SiteConsultVO selectSiteConsult(SiteConsultVO vo) throws Exception {
		// TODO Auto-generated method stub
		return siteConsultDAO.selectSiteConsult(vo);
	}

	@Override
	public void updateSiteConsultGrid(SiteConsultVO vo,HttpServletRequest req) throws Exception {
		
		
		HttpSession session = req.getSession();
		
		for(int i=0; i<vo.getGrid().size(); i++) {
			
			String consult = "";
			String reserv = "";
			String visit = "";
			String contract = "";
			
			Map<String, Object> gridMap = vo.getGrid().get(i);
			
			SiteConsultVO grid = new SiteConsultVO();
			grid.setMh_no(Integer.parseInt(gridMap.get("mh_no").toString()));
			grid.setMh_reservation(gridMap.get("mh_reservation").toString());
			grid.setConsult_state(gridMap.get("consult_state").toString());
			grid.setReservation_state(gridMap.get("reservation_state").toString());
			grid.setVisit_state(gridMap.get("visit_state").toString());
			grid.setContract_state(gridMap.get("contract_state").toString());
			
			
			
			BoardVO grid2 = new BoardVO();
			grid2.setBoard_idx(gridMap.get("mh_no").toString());
			grid2.setBoard_menu_code("_siteConsult");
			grid2.setBoard_reg_name(gridMap.get("mh_name").toString());
			grid2.setBoard_mod_id((String)session.getAttribute("GRANDADM_MANAGER_ID")+"("+(String)session.getAttribute("GRANDADM_MANAGER_NM")+")");
			
			SiteConsultVO list = siteConsultDAO.selectSiteConsult(grid);
			
			
			String consult_before = list.getConsult_state();
			String reserv_before = list.getReservation_state();
			String visit_before = list.getVisit_state();
			String contract_before = list.getContract_state();
			
			String consult_after;
			String reserv_after;
			String visit_after;
			String contract_after;
			
			if(consult_before == "" || consult_before == null) {
				consult_before = "A173_0";
			}
			if(reserv_before == "" || reserv_before == null) {
				reserv_before = "A173_0";
			}
			if(visit_before == "" || visit_before == null) {
				visit_before = "A173_0";
			}
			if(contract_before == "" || contract_before == null) {
				contract_before = "A173_0";
			}
			
			if(!gridMap.get("consult_state").toString().equals(consult_before)) {
				consult_before = consult_before.replace("A173_0", "대기");
				consult_before = consult_before.replace("A173_1", "확인");
				consult_before = consult_before.replace("A173_2", "취소");
				
				consult_after = gridMap.get("consult_state").toString();
				
				consult_after = consult_after.replace("A173_0", "대기");
				consult_after = consult_after.replace("A173_1", "확인");
				consult_after = consult_after.replace("A173_2", "취소");
				
				if(consult_after !=null && consult_after !="") {
					consult = " [상담: " + consult_before + " > " + consult_after + "] "; 
				}
			}
			if(!gridMap.get("reservation_state").toString().equals(reserv_before)) {
				
				reserv_before = reserv_before.replace("A173_0", "대기");
				reserv_before = reserv_before.replace("A173_1", "확인");
				reserv_before = reserv_before.replace("A173_2", "취소");
				
				reserv_after = gridMap.get("reservation_state").toString();
				
				reserv_after = reserv_after.replace("A173_0", "대기");
				reserv_after = reserv_after.replace("A173_1", "확인");
				reserv_after = reserv_after.replace("A173_2", "취소");
				
				
				if(reserv_after !=null && reserv_after !="") {
				reserv = " [예약: " + reserv_before + " > " + reserv_after + "] ";
				}
			}
			if(!gridMap.get("visit_state").toString().equals(visit_before)) {
				
				visit_before = visit_before.replace("A173_0", "대기");
				visit_before = visit_before.replace("A173_1", "확인");
				visit_before = visit_before.replace("A173_2", "취소");
				
				visit_after = gridMap.get("visit_state").toString();
				
				visit_after = visit_after.replace("A173_0", "대기");
				visit_after = visit_after.replace("A173_1", "확인");
				visit_after = visit_after.replace("A173_2", "취소");
				
				
				if(visit_after !=null && visit_after !="") {
				visit = " [내원: " + visit_before + " > " + visit_after + "] ";
				}
			}
			if(!gridMap.get("contract_state").toString().equals(contract_before)) {
				
				contract_before = contract_before.replace("A173_0", "대기");
				contract_before = contract_before.replace("A173_1", "확인");
				contract_before = contract_before.replace("A173_2", "취소");
				
				contract_after = gridMap.get("contract_state").toString();
				
				contract_after = contract_after.replace("A173_0", "대기");
				contract_after = contract_after.replace("A173_1", "확인");
				contract_after = contract_after.replace("A173_2", "취소");
				
				if(contract_after !=null && contract_after !="") {
				contract = " [계약: " + contract_before + " > " + contract_after + "] ";
				}
			}
			
			grid2.setBoard_content((String) consult + reserv + visit + contract);
			
			System.out.println("@@="+consult);
			
			siteConsultDAO.updateSiteConsultGrid(grid);
			boardDao.insertHistory(grid2);
		}
	}

}
