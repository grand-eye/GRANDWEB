<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="productRegForm" style="background-color:#fff">
		<style>
	    	th{text-align:center;}
	    </style>


			<div  id="product_pannel" style="height:auto;padding:5px;border:0;"  > 
				<div class="article_box_wrap cf" style="width:420px;" style="text-align:center">
					<div class="article_box article_box_left">
						 <!-- 제품정보 TAB01 start -->
						 <div title="제품정보" style="padding:10px">
							<form id="tab01_manager_ff${_prefix}" name="tab01_manager_ff${_prefix}" method="post" >

								<div class="article_box_inner" style="background-color:#fff">
									<table class="table_st01" style="width:750px;">
										<colgroup>
											<col width="20%"/>
											<col width="*"/>
										</colgroup>
										<tbody>

											<tr>
												<th><label for="" class="table_tit">권한선택</label></th>
												<td>
													<select class="" id="ta_group_code" name="ta_group_code" data-options="required: 'true',missingMessage:'권한은 필수 선택입니다.'" style="width:80%"  >
													</select>
												</td>
											</tr>

											<tr>
												<th><label for="" class="table_tit">부서선택</label></th>
												<td>
													<input  id="ta_team_code" name="ta_team_code" style="width:80%" />
												</td>
											</tr>
											
											
											<tr>
												<th><label for="" class="table_tit">아이디</label></th>
												<td>
													<input type="text" id="ta_user_id" name="ta_user_id" class="easyui-validatebox tb" style="border:1px solid #ccc;width:80%" placeholder="아이디를 입력해주세요." />
												</td>
											</tr>

											<c:choose>
											    <c:when test="${fn:length(_vo.ta_user_id) > 0}">

													<tr>
														<th><label for="" class="table_tit">변경할 비밀번호</label></th>
														<td class="p_space10">
															<input type="hidden" id="ta_user_pw" name="ta_user_pw" value="qwert" />
															<input type="password" id="ta_new_user_pw" name="ta_new_user_pw" class="easyui-passwordbox tb" data-options="required: 'true',missingMessage:'비밀번호는 필수입력입니다.',width:'80%'" style="border:1px solid #ccc;width:80%;height:42px" placeholder="변경할 비밀번호를 입력해주세요." />
														</td>
													</tr>

												</c:when>
												<c:otherwise>
													<tr>
														<th><label for="" class="table_tit">비밀번호</label></th>
														<td>
															<input type="password" id="ta_user_pw" name="ta_user_pw" class="easyui-passwordbox tb" data-options="required: 'true',missingMessage:'비밀번호는 필수입력입니다.',width:'80%'"  style="border:1px solid #ccc;width:80%;height:42px" placeholder="비밀번호를 입력해주세요." />
														</td>
													</tr>
												</c:otherwise>
											</c:choose>

											
											<tr>
												<th><label for="" class="table_tit">성명</label></th>
												<td>
													<input type="text" id="ta_user_name" name="ta_user_name" class="easyui-validatebox tb" style="border:1px solid #ccc;width:80%" placeholder="성명을 입력해주세요." />
												</td>
											</tr>
											
											<tr>
												<th><label for="" class="table_tit">휴대폰</label></th>
												<td>
													<input type="text"  class="easyui-maskedbox tb" mask="999-9999-9999" name="ta_phone" id="ta_phone"
																data-options="required: 'false',missingMessage:'휴대폰 연락처는 필수입력입니다.',width:'80%'" 
																style="border:1px solid #ccc; width:80%;"/>
												</td>
											</tr>

											<tr>
												<th><label for="" class="table_tit">내선번호</label></th>
												<td>
													<input type="text"  class="easyui-maskedbox tb" mask="999-9999-9999" name="ta_tel" id="ta_tel"
																data-options="required: 'false',missingMessage:'내선번호는 필수입력입니다.',width:'80%'" 
																style="border:1px solid #ccc; width:80%;"/>
												</td>
											</tr>

											<tr>
												<th><label for="" class="table_tit">이메일</label></th>
												<td>
													<input type="text" id="ta_email" name="ta_email" class="easyui-validatebox tb" data-options="required: 'false',missingMessage:'내선번호는 필수입력입니다.',width:'80%'"  style="border:1px solid #ccc;width:80%" placeholder="이메일을 입력해주세요." />
												</td>
											</tr>
											
											<tr>
												<th><label for="" class="table_tit">사용여부</label></th>
												<td>
													<input class="easyui-switchbutton" id="ta_use_yn" name="ta_use_yn" checked data-options="onText:'사용',offText:'사용불가', width:100" style="">
												</td>
											</tr>
																							

											<tr>
												<th colspan="2"><label for="" class="table_tit" style="max-width: 800px;">메모</label></th>
											</tr>
											<tr>
												<td colspan="2">
													<textarea name="ta_desc" id="ta_desc" cols="30" rows="7" style="margin:10px 0;" class="easyui-validatebox"></textarea>
												</td>
											</tr>
									
										</tbody>
									</table>

									<div class="bd_btn_wrap">
										<ul>
											<li><button id="tab01_saveBtn${_prefix}" type="button">저장</button></li>
											<li><button onclick="$('#ww_manager').window('close');return false;" >취소</button></li>
										</ul>
									</div> <!-- //bd_btn_wrap -->
							   </div> <!-- //article_box_inner -->
						   </form>
						 </div>
						 <!-- 제품정보 TAB01 end -->
					</div> <!-- //article_box_left -->					
				</div>
			</div>	



	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>


	<script type="text/javascript">
		var $obj = null;
		// 180308 수정 start
		
		commonFnc.setDataCombo("#ta_group_code", "A005", "0", "", "관리자권한", function(value){});
		
		var treePrm = {};
		treePrm.search_level = "0";
		treePrm.search_master = "A007";	
	
		$("#ta_team_code").combotreegrid(
				{
					url : "/admin/interface/selectCodeDetail"								,
			        width:'80%'																		,
			        panelWidth:800																		,					
					queryParams :treePrm	 														,
					rownumbers: true 																,
					idField: 'tcd_code'																	,
					treeField: 'tcd_title'																,
			        columns:[[
			            {field:'tcd_title',title:'코드명칭',width:200},
			            {field:'tcd_code',title:'Code',width:100},
			            {field:'tcd_useyn',title:'사용여부',width:100}
			        ]]					
				}
		);	    			
	

		$("#tab01_saveBtn${_prefix}").on("click", function(){
			//tab01_ff${_prefix}
			
			if ( $("#tab01_ff${_prefix}").form("validate") )
			{
					var paramForm = $("#tab01_manager_ff${_prefix}").serializeObject();
					
					
					if ( paramForm.ta_use_yn=="on")
					{
						paramForm.ta_use_yn = "Y";
					}
					else
					{
						paramForm.ta_use_yn = "N";
					}			
					
					
					$.ajax({  
			             url      			 : "/admin/interface/insertManager"
			           , data 				 : paramForm
			           , type    			 : "POST"
			           , dataType 		 : "json"
			           ,success  : function(response) {
			            	console.log(response);
			            	
			            	if ( response.resultCode == "Y")
			            	{
			            		alert("관리자 정보가 등록/변경 되었습니다.");
			            		
			            		$('#dgtree_manager').datagrid('reload'); 
			            		
			            	}
			            	else
			            	{
			            		alert("시스템 오류로 인해 제품등록이 실패하였습니다.");
			            		return;
			            	}
			           }
			        });				
				
				
			}
			
		});
		// 180308 수정 end
		
		 <c:choose>
		    <c:when test="${fn:length(_vo.ta_user_id) > 0}">
		    		
				 	$('#ta_user_id').validatebox({
					    required	: false	,
					    readonly 	: true  
					 });
				 
		    		var param = {};
		    		param.ta_user_id =  "${_vo.ta_user_id}";
		    		
					$.ajax({  
			             url      			 : "/admin/interface/selectGetManager"
			           , data 				 : param
			           , type    			 : "POST"
			           , dataType 		 : "json"
			           ,success  : function(response) {
			            	var y = response.rows[0];
			            	$obj  = y;
			            		 
		            		 $("#ta_team_code").combotreegrid('setValue', y.ta_team_code);  
							 commonFnc.setDataCombo("#ta_group_code", "A005", "0", y.ta_group_code, "관리자권한", function(value){});


		            		 $("#ta_user_id").val(y.ta_user_id);
		            		 $("#ta_user_name").val(y.ta_user_name);
		            		 $("#ta_phone").val( y.ta_phone );
		            		 $("#ta_tel").val( y.ta_tel );


							 $("#ta_email").val(y.ta_email);
		            		
			            	 if ( y.ta_use_yn == "Y")
			            	 {
			            		$("#ta_use_yn").switchbutton("check");
			            	 }
			            	 else
			            	 {
			            		$("#ta_use_yn").switchbutton("uncheck");
			            	 }		  
			            	  
			            	  $("#ta_desc").val( y.ta_desc );

			           }
			        });			    
		    
		    
		    
		    </c:when>
		    <c:otherwise>
				$('#tp_code').validatebox({
				    required: true	,
				    missingMessage : '아이디는 필수 입력값입니다.' ,
				    validType : [ 'empty["아이디는 필수 입력값입니다."]' , 'ajax_check["/admin/interface/selectExistsManagerID","ta_user_id","이미 등록된 관리자 아이디 입니다."]']
				});	
		    </c:otherwise>
		    
		 </c:choose>
				



	 
	
					 
   	</script>
</body>
</html>