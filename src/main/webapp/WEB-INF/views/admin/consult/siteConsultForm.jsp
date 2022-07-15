<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>
</head>
<body id="memberForm" style="background-color: #fff">
	<div id="memberBodys" class="easyui-layout" style="width: 100%; height: 100%;">
		<div data-options="region:'center',title:''" style="padding: 5px;">
		
			<div id="member_pannel"	style="height: auto; padding: 5px; border: 0; overflow-x: hidden">
				<div class="article_box_wrap cf" style="text-align: center">
					<div class="article_box article_box_left">
						<form id="ff${_prefix}" name="ff${_prefix}" method="post" onsubmit="return false;">
							<input type="hidden" id="tblNumber" name="tblNumber" value="0">
							
							<div class="" style="background-color: #fff">
								<table class="table_st01">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody id="tableBody">										
										<tr>
											<th>
												<label for="is_mobile" class="table_tit">유입경로</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="is_mobile" id="is_mobile" class="easyui-validatebox" style="width: 80%" readonly /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="mh_name" class="table_tit">이름</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="mh_name" id="mh_name" class="easyui-validatebox" style="width: 80%" readonly />  
											</td>
										</tr>
										<tr>
											<th>
												<label for="mh_hp" class="table_tit">연락처</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="mh_hp" id="mh_hp"  class="easyui-validatebox" style="width: 80%" readonly />   
											</td>
										</tr>
										<tr>
											<th>
												<label for="mh_message" class="table_tit">상담내용</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="mh_message" id="mh_message"  class="easyui-validatebox" style="width: 80%" readonly />    
											</td>
										</tr>
										<tr>
											<th>
												<label for="mh_responsetime" class="table_tit">응대시간</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="mh_responsetime" id="mh_responsetime"  class="easyui-validatebox" style="width: 80%" readonly />    
											</td>
										</tr>
										<tr>
											<th>
												<label for="mh_datetime" class="table_tit">상담요청시간</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="mh_datetime" id="mh_datetime"  class="easyui-validatebox" style="width: 80%" readonly />    
											</td>
										</tr>
										
										<tr>
											<th>
												<label for="mh_datetime" class="table_tit">유입경로</label>
											</th>
											<td style="text-align: left;" class="site_councel_path">
												  <textarea name="utm_path" style="width:100%;height:50px"></textarea> 
											</td>
										</tr>
										
																				
										<tr>
											<th>
												<label for="mh_ip" class="table_tit">IP</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="mh_ip" id="mh_ip"  class="easyui-validatebox" style="width: 80%" readonly />    
											</td>
										</tr>
										<tr>
											<th><label for="mh_reservation" class="table_tit">결과</label></th>
											<td style="text-align: left" class="p_space10">
												<select class="easyui-combobox searchSel" id="code_mh_reservation" data-prefix="${_prefix}" style="width: 45%;">													
												</select>												 
												<input type="hidden" name="mh_reservation" id="mh_reservation" />
											</td>											
										</tr>
										<tr>
											<th colspan="2">
												<label for="mh_reply" class="table_tit" style="max-width: 720px;">메모</label>
											</th>																			
										</tr>
										<tr>
											<td colspan="2">
												<textarea name="mh_reply" id="mh_reply" rows="5" cols="100" style='width: 100%; min-width: 260px; height: 20em; display: block;'></textarea>
											</td>			
										</tr>
									</tbody>
								</table>
								<!-- //article_box_wrap -->
								<div class="bd_btn_wrap">
									<ul>
										<li>
											<button id="saveBtn${_prefix}" data-prefix="${_prefix}">저장</button>
										</li>
										<li>
											<button onclick="$('#w${_prefix}').window('close');return false;">취소</button>
										</li>
									</ul>
								</div>
								<!-- //bd_btn_wrap -->
							</div>
						</form>
					</div>
					<!-- //article_box_left -->
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>

	<script type="text/javascript">
	
		var $index = "${_siteConsult.mh_no}";
		
   		$(document).ready(function() {
  				
   			commonFnc.fnCommonCode("mh_reservation", "A172", null, "select", "==결과를 선택하세요==");
   			
   			var editor = [];
   			
   			$meplzNaverEditor.init({ 
   				container 		: "mh_reply"
   				,saver			: editor
   			});
   			
   			if ( $index != 0)
			{	   				
   				$('#ff${_prefix}').form({
   					onLoadSuccess:function(data){
						setTimeout(function(){
							if( data ) {
	   							
	   							if(data.mh_reservation	 != "")
									{
										$('#code_mh_reservation').combobox('setText',data.mh_reservation_name);
										$("#mh_reservation").val(data.mh_reservation);
									}
	   						}
						}, 500)
   					}
   				});
   				
   				$('#ff${_prefix}').form('load', '/admin/interface/selectSiteConsult?mh_no='+$index ); 
			}

   			
			$("#saveBtn${_prefix}").off("click").on("click", function(){
					    	
		    	var mh_reservation = '';
		    	if($('#code_mh_reservation').combobox('getValue') == "" && $("#mh_reservation").val() == "") {
		    		
					$("#code_mh_reservation").focus();
					alert("결과를 선택하세요.");
					return false;
					
				} else {
					
					if($('#code_mh_reservation').combobox('getValue') != "")
						{
							mh_reservation = $('#code_mh_reservation').combobox('getValue');
						} else {
							mh_reservation = $("#mh_reservation").val();
						}
				}
			
				var sHTML = editor.getById["mh_reply"].getIR();
			
		    	var param = {};		    	
		    	param.mh_no = $index;		    	
				param.mh_reservation = mh_reservation;
				param.mh_reply = sHTML;
				
				$.ajax({  
		               url      		 	: '/admin/interface/updateSiteConsult'
		              ,data 			 	: param
		              ,type    			: "POST"
		              ,dataType 		: "json"
		              ,success  : function(data) {
		            	  parent.consultListReload("siteConsult");
		              }
        		});
				
				return false;
			});
   		})

   		</script>
   	
   	
</body>
</html>