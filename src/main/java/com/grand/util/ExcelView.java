package com.grand.util;
 

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.grand.admin.consult.vo.SiteConsultVO;
import com.grand.admin.member.service.TblMemberService;
import com.grand.admin.member.vo.TblMemberVO;


public class ExcelView extends AbstractExcelPOIView {
	
	@Resource(name="tblMemberService")
	private TblMemberService tblMemberService;
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
       String target 		= model.get("target").toString();
       String sheetName = model.get("file").toString();
       //target에 따라서 엑셀 문서 작성을 분기한다.
       if(target.equals("tblMember")){
           //Object로 넘어온 값을 각 Model에 맞게 형변환 해준다.
    	   
           List<TblMemberVO> tblMemberList = (List<TblMemberVO>) model.get("excelList");
           //Sheet 생성
           Sheet sheet = workbook.createSheet(sheetName);
           Row row = null;
           int rowCount = 0;
           int cellCount = 0;
           int rowNum = 1;

           // 제목 Cell 생성
           row = sheet.createRow(rowCount++);

           row.createCell(cellCount++).setCellValue("No");
           row.createCell(cellCount++).setCellValue("회원구분");
           row.createCell(cellCount++).setCellValue("아이디");
           row.createCell(cellCount++).setCellValue("이름");
           row.createCell(cellCount++).setCellValue("연락처");
           row.createCell(cellCount++).setCellValue("이메일");
           row.createCell(cellCount++).setCellValue("가입일");
           row.createCell(cellCount++).setCellValue("최근접속일");
           row.createCell(cellCount++).setCellValue("비고");

           // 데이터 Cell 생성
           for (TblMemberVO member : tblMemberList) {
               row = sheet.createRow(rowCount++);
               cellCount = 0;
               row.createCell(cellCount++).setCellValue( rowNum++ ); 
               row.createCell(cellCount++).setCellValue(member.getLevelName() ); 
               row.createCell(cellCount++).setCellValue(member.getTblStrID() );
               row.createCell(cellCount++).setCellValue(member.getTblStrName() );                
               row.createCell(cellCount++).setCellValue(member.getTblStrMobile() );                
               row.createCell(cellCount++).setCellValue(member.getTblStrEmail() );
               row.createCell(cellCount++).setCellValue(member.getTblDtmRegDate() );
               row.createCell(cellCount++).setCellValue(member.getTblDtmLastDate() );
               row.createCell(cellCount++).setCellValue(member.getTblPassType() );
           }

       }
       
       if(target.equals("siteConsult")){
           //Object로 넘어온 값을 각 Model에 맞게 형변환 해준다.
    	   
           List<SiteConsultVO> siteConsultList = (List<SiteConsultVO>) model.get("excelList");
           //Sheet 생성
           Sheet sheet = workbook.createSheet(sheetName);
           Row row = null;
           int rowCount = 0;
           int cellCount = 0;
           int rowNum = 1;

           // 제목 Cell 생성
           row = sheet.createRow(rowCount++);

           row.createCell(cellCount++).setCellValue("No");
           row.createCell(cellCount++).setCellValue("경로");
           row.createCell(cellCount++).setCellValue("상담요청시간");
           row.createCell(cellCount++).setCellValue("이름");
           row.createCell(cellCount++).setCellValue("연락처");
           row.createCell(cellCount++).setCellValue("유입");
           row.createCell(cellCount++).setCellValue("결과");
           row.createCell(cellCount++).setCellValue("응대시간");
           row.createCell(cellCount++).setCellValue("IP");
           row.createCell(cellCount++).setCellValue("플랫폼");
           row.createCell(cellCount++).setCellValue("광고상품");
           row.createCell(cellCount++).setCellValue("광고특징");

           // 데이터 Cell 생성
           for (SiteConsultVO data : siteConsultList) {
               row = sheet.createRow(rowCount++);
               cellCount = 0;
               row.createCell(cellCount++).setCellValue( rowNum++ ); 
               row.createCell(cellCount++).setCellValue(data.getIs_mobile() ); 
               row.createCell(cellCount++).setCellValue(data.getMh_datetime() );
               row.createCell(cellCount++).setCellValue(data.getMh_name() );                
               row.createCell(cellCount++).setCellValue(data.getMh_hp() );                
               row.createCell(cellCount++).setCellValue(data.getVi_referer() );
               row.createCell(cellCount++).setCellValue(data.getMh_reservation() );
               row.createCell(cellCount++).setCellValue(data.getMh_responsetime() );
               row.createCell(cellCount++).setCellValue(data.getMh_ip() );
               row.createCell(cellCount++).setCellValue(data.getUtm_source() );
               row.createCell(cellCount++).setCellValue(data.getUtm_medium() );
               row.createCell(cellCount++).setCellValue(data.getUtm_campaign() );
           }

       }
   }

   @Override
   protected Workbook createWorkbook() {
       return new XSSFWorkbook();
   }

}