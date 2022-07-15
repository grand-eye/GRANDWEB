<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>
</head>
<body id="boardRegForm" style="background-color: #fff">
	
	<div id="boardBodys" class="easyui-layout" style="width: 100%; height: 100%;">
		<div data-options="region:'center',title:'DM관리 > SMS 기본설정'" style="padding: 5px;">
			<div id="board_pannel" class="smsForm" style="height: auto; padding: 5px; border: 0; overflow-x: hidden">
				<div class="article_box_wrap cf sms_box_wrap" style="text-align: center">
					<div class="article_box article_box_left">
						
						<h3 class="sms_tit">SMS 기본 설정</h3>
					
						<form id="ff${_prefix}" name="ff${_prefix}" method="post" onsubmit="return false;">
							<input type="hidden" name="menu_code" id="board_menu_code" value="${_prefix}"> 

							<div class="" style="background-color: #fff">
								<table class="table_st01">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody id="tableBody">
										<tr>
											<th>
												<label for="cf_id${_prefix}" class="table_tit sms_table_tit">아이디</label>
											</th>
											<td colspan="2" style="text-align: left">
												<input type="text" name="cf_id${_prefix}" id="cf_id${_prefix}"  class="easyui-validatebox" placeholder="아이디를 입력해주세요."	style="width: 80%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="cf_pw${_prefix}" class="table_tit sms_table_tit">비밀번호(인증키)</label>
											</th>
											<td colspan="2" style="text-align: left">
												<input type="text" name="cf_pw${_prefix}" id="cf_pw${_prefix}"  class="easyui-validatebox" placeholder="비밀번호(인증키)를 입력해주세요."	style="width: 80%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="cf_phone${_prefix}" class="table_tit sms_table_tit">발신번호</label>
											</th>
											<td colspan="2" style="text-align: left">
												<input type="text" name="cf_phone${_prefix}" id="cf_phone${_prefix}"class="easyui-validatebox" placeholder="비밀번호(인증키)를 입력해주세요."	style="width: 80%" /> 
												
											</td>
										</tr>
										<tr>
											<th>
												<label for="cf_admin${_prefix}" class="table_tit sms_table_tit">관리자번호</label>
											</th>
											<td colspan="2" style="text-align: left;">
												<input type="text" name="cf_admin${_prefix}" id="cf_admin${_prefix}"class="easyui-validatebox" placeholder="관리자번호를 입력해주세요."	style="width: 80%" /> 
												<br />
												<span class="easyui-validatebox-desc">※ 다중전송시 콤마( , )로 구분</span>
											</td>
										</tr>
									</tbody>
								</table>
								<!-- //article_box_wrap -->
								<div class="bd_btn_wrap">
									<ul>
										<li>
											<button id="saveBtn${_prefix}" data-prefix="${_prefix}">수정</button>
										</li>
									</ul>
								</div>
								<!-- //bd_btn_wrap -->
							</div>
							<!-- //article_box_inner -->
						</form>
					</div>
					<!-- //article_box_left -->
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>

	<script type="text/javascript">
   		$(document).ready(function() {
   			
   			var param = {};
   			$.ajax({  
	               url      		 : '/admin/interface/selectSmsConfig'
	              ,data 			 : param
	              ,type    			 : "POST"
	              ,dataType 		 : "json"
	              ,success  : function(data) {
	            	  
	            	  if( data.rows.length > 0 ) {
	            			
	            		  $("#cf_id${_prefix}").val(data.rows[0].cf_id);
	            		  $("#cf_pw${_prefix}").val(data.rows[0].cf_pw);
	            		  $("#cf_phone${_prefix}").val(data.rows[0].cf_phone);
	            		  $("#cf_admin${_prefix}").val(data.rows[0].cf_admin);
	            		  
	            	  }
	            	  
	              }
 			});
	   			
	   		$("#saveBtn${_prefix}").off("click").on("click", function(){
				
		    	var param = {};
		    	
		    	param.cf_id =  $("#cf_id${_prefix}").val();
		    	param.cf_pw = $("#cf_pw${_prefix}").val(); 
    		    param.cf_phone = $("#cf_phone${_prefix}").val();
		    	param.cf_admin = $("#cf_admin${_prefix}").val();
    		  				
				$.ajax({  
					url      		 : '/admin/interface/updateSmsConfig'
		              ,data 			 : param
		              ,type    			 : "POST"
		              ,dataType 		 : "json"
		              ,success  : function(data) {
		            	  if( data.resultCode == 'Y' ) {
		            		  alert("수정되었습니다.");
		            		  return;
		            	  } else {
		            		  alert('수정에 실패하였습니다. 문의');
		            		  return false;
		            	  }
		              }
        		});
				
				return false;
			}); 
		    								
		});
		
   	</script>
</body>
</html>