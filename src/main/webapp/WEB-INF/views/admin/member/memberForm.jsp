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
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" id="tblNumber" name="tblNumber" value="0">
							
							<div class="" style="background-color: #fff">
								<table class="table_st01">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody id="tableBody">
										<tr>
											<th><label for="code_tblIntLevel" class="table_tit">회원구분</label></th>
											<td style="text-align: left" class="p_space10">
												<select class="easyui-combobox" id="code_tblIntLevel"  data-prefix="${_prefix}" style="width: 45%;">
												</select>
												<input type="hidden" name="tblIntLevel" id="tblIntLevel" /> 
											</td>											
										</tr>
										<tr>
											<th>
												<label for="tblStrName" class="table_tit">회원이름</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="tblStrName" id="tblStrName" data-options="missingMessage:'회원이름 입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="회원이름을 입력해주세요." style="width: 45%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="tblStrID" class="table_tit">아이디</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="tblStrID" id="tblStrID" data-options="missingMessage:'아이디 입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="아이디를 입력해주세요." style="width: 45%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="tblStrPass" class="table_tit">비밀번호</label>
											</th>
											<td style="text-align: left;">
												<input type="password" name="tblStrPass" id="tblStrPass"  class="easyui-validatebox"  style="width: 45%" maxlength="12" />
												<br><span class="desc">※ 비밀번호는 암호화 되어있습니다.</span><span class="desc">만약 비밀번호를 변경하고자 하신다면 새로운 비밀번호를 입력해 주십시오.</span> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="tblStrEmail" class="table_tit">이메일</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="tblStrEmail" id="tblStrEmail" data-options="missingMessage:'이메일 입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="이메일을 입력해주세요." style="width: 45%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="tblStrMobile" class="table_tit">휴대폰</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="tblStrMobile" id="tblStrMobile" data-options="missingMessage:'휴대폰 입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="휴대폰번호를 입력해주세요." style="width: 45%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="tblBlnEmail" class="table_tit">메일수신</label>
											</th>
											<td style="text-align: left;">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" name="tblBlnEmail" value="Y" checked>
															<span class="icon_radio">사용</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" name="tblBlnEmail" value="N">
															<span class="icon_radio">사용안함</span>
														</label>
													</li>
												</ul> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="tblBlnSms" class="table_tit">SMS수신</label>
											</th>
											<td style="text-align: left;">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" name="tblBlnSms" value="Y" checked>
															<span class="icon_radio">사용</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" name="tblBlnSms" value="N">
															<span class="icon_radio">사용안함</span>
														</label>
													</li>
												</ul> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="etc1" class="table_tit">성별</label>
											</th>
											<td style="text-align: left;">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" name="etc1" value="A145b">
															<span class="icon_radio">여자</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" name="etc1" value="A145a">
															<span class="icon_radio">남자</span>
														</label>
													</li>
												</ul> 
											</td>
										</tr>
										<tr>
											<th><label for="code_etc2" class="table_tit">거주지역</label></th>
											<td style="text-align: left" class="p_space10">
												<select class="easyui-combobox searchSel" id="code_etc2" data-options="required:false" data-prefix="${_prefix}" style="width: 45%;">													
												</select>												 
												<input type="hidden" name="etc2" id="etc2" />
											</td>											
										</tr>
										<tr>
											<th><label for="code_etc3" class="table_tit">관심부위</label></th>
											<td style="text-align: left" class="p_space10">
												<select class="easyui-combobox searchSel" id="code_etc3" data-options="required:false" data-prefix="${_prefix}" style="width: 45%;">													
												</select>
												<input type="hidden" name="etc3" id="etc3" />
											</td>											
										</tr>
										<tr>
											<th><label for="code_etc4" class="table_tit">가입경로</label></th>
											<td style="text-align: left" class="p_space10">
												<select class="easyui-combobox searchSel" id="code_etc4" data-options="required:false" data-prefix="${_prefix}" style="width: 45%;">													
												</select>		
												<input type="hidden" name="etc4" id="etc4" />										 
											</td>											
										</tr>
										<tr>
											<th colspan="2">
												<label for="tblStrMemo" class="table_tit" style="max-width: 720px;">메모</label>
											</th>																			
										</tr>
										<tr>
											<td colspan="2">
												<textarea name="tblStrMemo" id="tblStrMemo" rows="10" cols="100" style='width: 100%; min-width: 260px; height: 30em; display: block;'></textarea>
											</td>			
										</tr>
										<tr>
											<th>
												<label for="memDel" class="table_tit">탈퇴신청</label>
											</th>
											<td style="text-align: left;">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" name="memDel" value="Y">
															<span class="icon_radio">신청대기</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" name="memDel" value="N" checked>
															<span class="icon_radio">미신청</span>
														</label>
													</li>
												</ul> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="memDel_reason" class="table_tit">탈퇴사유</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="memDel_reason" id="memDel_reason" style="width: 45%" readonly />
												<input type="text" name="memDel_date" id="memDel_date" style="width: 45%" readonly /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="memDel_hope" class="table_tit">바라는점</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="memDel_hope" id="memDel_hope" style="width: 45%" readonly />												 
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
										
										<c:if test="${_member.tblNumber ne ''}">
										<li>
											<button id="deleteBtn${_prefix}" class="deleteBtn${_prefix}">삭제</button>
										</li>
										</c:if>
										
										<li>
											<button onclick="$('#w_member').window('close');return false;">취소</button>
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
	
		var $index = "${_member.tblNumber}";
		
   		$(document).ready(function() {
  				
   			commonFnc.fnCommonCode("tblIntLevel", "A140", null, "select", "==회원구분을 선택하세요==");
   			commonFnc.fnCommonCode("etc2", "A143", null, "select", "==거주지역을 선택하세요==");
   			commonFnc.fnCommonCode("etc3", "A141", null, "select", "==관심부위를 선택하세요==");
   			commonFnc.fnCommonCode("etc4", "A142", null, "select", "==가입경로를 선택하세요==");
   			
   			var editorMember = [];
   			
   			$meplzNaverEditor.init({ 
   				container 		: "tblStrMemo"
   				,saver			: editorMember
   			});
   			
   			if ( $index != 0)
			{	   				
   				$('#ff${_prefix}').form({
   					onLoadSuccess:function(data){
   						
						$("#memDel").attr("readonly", true);
						$("#memDel_reason").attr("readonly", true);
						$("#memDel_date").attr("readonly", true);
						$("#memDel_hope").attr("readonly", true);
						$("#tblStrID").attr("readonly", true);
						   						
   						setTimeout(function() {
   							
   							if( data.tblIntLevel != null && data.tblIntLevel != '') {
   								$('#code_tblIntLevel').combobox('setText', data.levelName);
   		   						$('#tblIntLevel').val(data.tblIntLevel);	
   							}
	   						
   							if( data.etc2 != null && data.etc2 != '') {
		   						$('#code_etc2').combobox('setText', data.regionName);
		   						$('#etc2').val(data.etc2);
   							}
	   						
   							if( data.etc3 != null && data.etc3 != '') {
		   						$('#code_etc3').combobox('setText', data.partName);
		   						$('#etc3').val(data.etc3);
   							}
	   						if( data.etc4 != null && data.etc4 != '') {
		   						$('#code_etc4').combobox('setText', data.joinName);
		   						$('#etc4').val(data.etc4);
	   						}
   						}, 1500);
						
   					}
   				});
   				
   				$('#ff${_prefix}').form('load', '/admin/interface/selectMember?tblNumber='+$index ); 
			}
   			
			$("#deleteBtn${_prefix}").off("click").on("click", function(){
				if(confirm("삭제하시겠습니까?")) {
			    	$('#ff${_prefix}').form('submit', {
					    url:'/admin/interface/deleteMember',
					    onSubmit: function(){						    	
					    	document.ff${_prefix}.tblNumber = $index;						    	
					    	document.ff${_prefix}.target = 'ifrm';
					    	document.ff${_prefix}.submit();
					    },
					    success:function(data){
					    	parent.memberListReload("member");
							return false;
					    }
					});
			    	return false;
		    	} else {			    		
		    		return false;
		    	}
				
			}); 
			
			$("input[name='tblStrMobile']").on("keyup", function() {
				$(this).val($(this).val().replace(/[^0-9]/g,""));
			});
			
			$("#saveBtn${_prefix}").off("click").on("click", function(){
				
				var tblIntLevel = '';
		    	if($('#code_tblIntLevel').combobox('getValue') == "" && $("#tblIntLevel").val() == "") {
		    		
					$("#code_tblIntLevel").focus();
					alert("회원구분을 선택하세요.");
					return false;
					
				} else {
					
					if($('#code_tblIntLevel').combobox('getValue') != "")
						{
							tblIntLevel = $('#code_tblIntLevel').combobox('getValue');
						} else {
							tblIntLevel = $("#tblIntLevel").val();
						}
				}
		    	
		    	var etc2 = '';
		    	if($('#code_etc2').combobox('getValue') == "" && $("#etc2").val() == "") {
		    		
					$("#code_etc2").focus();
					alert("거주지역을 선택하세요.");
					return false;
					
				} else {
					
					if($('#code_etc2').combobox('getValue') != "")
						{
							etc2 = $('#code_etc2').combobox('getValue');
						} else {
							etc2= $("#etc2").val();
						}
				}
		    	
		    	var etc3 = '';
		    	if($('#code_etc3').combobox('getValue') == "" && $("#etc3").val() == "") {
		    		
					$("#code_etc3").focus();
					alert("관심부위를 선택하세요.");
					return false;
					
				} else {
					
					if($('#code_etc3').combobox('getValue') != "")
						{
							etc3 = $('#code_etc3').combobox('getValue');
						} else {
							etc3 = $("#etc3").val();
						}
				}
		    	
		    	var etc4 = '';
		    	if($('#code_etc4').combobox('getValue') == "" && $("#etc4").val() == "") {
		    		
					$("#code_etc4").focus();
					alert("가입경로를 선택하세요.");
					return false;
					
				} else {
					
					if($('#code_etc4').combobox('getValue') != "")
						{
							etc4 = $('#code_etc4').combobox('getValue');
						} else {
							etc4 = $("#etc4").val();
						}
				}
		    	
		    	if($("input[name='tblStrName']").val() == "") {
					$("input[name='tblStrName']").focus();
					alert("회원이름을 입력해주세요.");
					return false;
				}
		    	
		    	if($("input[name='tblStrID']").val() == "") {
					$("input[name='tblStrID']").focus();
					alert("아이디를 입력해주세요.");
					return false;
				}
		    	
		    	if($("input[name='tblStrEmail']").val() == "") {
					$("input[name='tblStrEmail']").focus();
					alert("이메일을 입력해주세요.");
					return false;
				}
		    	
		    	if($("input[name='tblStrMobile']").val() == "") {
					$("input[name='tblStrMobile']").focus();
					alert("휴대폰번호를 입력해주세요.");
					return false;
				}
			
				var sHTML = editorMember.getById["tblStrMemo"].getIR();
			
		    	var param = {};
		    	param.tblIntLevel = tblIntLevel;
		    	param.tblNumber = $index;
		    	param.tblStrName = $("input[name='tblStrName']").val();
		    	param.tblStrID = $("input[name='tblStrID']").val();
				param.tblStrPass = $("input[name='tblStrPass']").val();
				param.tblStrEmail = $("input[name='tblStrEmail']").val();
				param.tblStrMobile = $("input[name='tblStrMobile']").val();
				param.tblBlnEmail = $("input[name='tblBlnEmail']:checked").val();
				param.tblBlnSms = $("input[name='tblBlnSms']:checked").val();
				param.etc1 = $("input[name='etc1']:checked").val();
				param.etc2 = etc2;
				param.etc3 = etc3;
				param.etc4 = etc4;
				param.tblStrMemo = sHTML;
				
				$.ajax({  
		               url      		 	: '/admin/interface/insertMember'
		              ,data 			 	: param
		              ,type    			: "POST"
		              ,dataType 		: "json"
		              ,success  : function(data) {
		            	  parent.memberListReload("member");
		              }
        		});
				
				return false;
			});
   		})
   	</script>
   	
   	
</body>
</html>
