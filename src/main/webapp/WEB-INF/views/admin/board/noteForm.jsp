<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>
</head>
<body id="noteForm" style="background-color: #fff">
	<div id="noteBodys" class="easyui-layout" style="width: 100%; height: 100%;">
		<div data-options="region:'center',title:''" style="padding: 5px;">
		
			<div id="note_pannel"	style="height: auto; padding: 5px; border: 0; overflow-x: hidden">
				<div class="article_box_wrap cf" style="text-align: center">
					<div class="article_box article_box_left">
						<form id="ff${_prefix}" name="ff${_prefix}" method="post" onsubmit="return false;">
							<input type="hidden" id="board_idx" name="board_idx" value="0">
							
							<div class="" style="background-color: #fff">
								<table class="table_st01">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody id="tableBody">
										<%-- <tr>
											<th><label for="code_tblIntLevel" class="table_tit">각주구분</label></th>
											<td style="text-align: left" class="p_space10">
												<select class="easyui-combobox" id="code_tblIntLevel"  data-prefix="${_prefix}" style="width: 45%;">
												</select>
												<input type="hidden" name="tblIntLevel" id="tblIntLevel" /> 
											</td>											
										</tr> --%>
										<tr>
											<th>
												<label for="board_name" class="table_tit">각주이름</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="board_name" id="board_name" data-options="missingMessage:'각주이름 입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="각주이름을 입력해주세요." style="width: 45%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="board_use_yn" class="table_tit">사용유무</label>
											</th>
											<td style="text-align: left;">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" name="board_use_yn" value="Y" checked>
															<span class="icon_radio">사용</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" name="board_use_yn" value="N">
															<span class="icon_radio">사용안함</span>
														</label>
													</li>
												</ul> 
											</td>
										</tr>
										<tr>
											<th colspan="2">
												<label for="board_detail" class="table_tit" style="max-width: 720px;">메모</label>
											</th>																			
										</tr>
										<tr>
											<td colspan="2">
												<textarea name="board_detail" id="board_detail" rows="10" cols="100" style='width: 100%; min-width: 260px; height: 30em; display: block;'></textarea>
											</td>			
										</tr>
										<!-- <tr>
											<th>
												<label for="tblStrID" class="table_tit">각주내용</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="board_detail" id="board_detail" data-options="missingMessage:'각주내용 입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="각주내용을 입력해주세요." style="width: 45%" /> 
											</td>
										</tr> -->
									</tbody>
								</table>
								<!-- //article_box_wrap -->
								<div class="bd_btn_wrap">
									<ul>
										<li>
											<button id="saveBtn${_prefix}" data-prefix="${_prefix}">저장</button>
										</li>
										
										<c:if test="${_note.board_idx ne ''}">
										<li>
											<button id="deleteBtn${_prefix}" class="deleteBtn${_prefix}">삭제</button>
										</li>
										</c:if>
										
										<li>
											<button onclick="$('#w_note').window('close');return false;">취소</button>
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
	
		var $index = "${_note.board_idx}";
		
   		$(document).ready(function() {
  			
			var editorNote = [];
   			
   			$meplzNaverEditor.init({ 
   				container 		: "board_detail"
   				,saver			: editorNote
   			});
   			
   			
   			if ( $index != 0)
			{	   				
   				$('#ff${_prefix}').form({
   					onLoadSuccess:function(data){
   						data = data[0];
   						setTimeout(function() {
   							if( data.board_name != null && data.board_name != '') {
   								//$('#board_name').combobox('setText', data.board_name);
   		   						$('#board_name').val(data.board_name);	
   							}
	   						
   							if( data.board_detail != null && data.board_detail != '') {
		   						//$('#board_detail').combobox('setText', data.board_detail);
		   						//$('#board_detail').text(data.board_detail);
   								editorNote.getById["board_detail"].exec("SET_IR", [""]); //내용초기화
   								editorNote.getById["board_detail"].exec("PASTE_HTML", [data.board_detail]);
   							}
	   						
   							if( data.board_use_yn != null && data.board_use_yn != '') {
		   						//$('#board_use_yn').combobox('setText', data.board_use_yn);
   								var yn = data.board_use_yn;
   								if(yn == 'Y'){
   									$("input:radio[name='board_use_yn']:radio[value='Y']").prop('checked',true);
   								}else{
   									$("input:radio[name='board_use_yn']:radio[value='N']").prop('checked',true);
   								}
   							}
   						}, 1500);
						
   					}
   				});
   				
   				$('#ff${_prefix}').form('load', '/admin/interface/selectNote?board_idx='+$index ); 
			}
   			
			$("#deleteBtn${_prefix}").off("click").on("click", function(){
				if(confirm("삭제하시겠습니까?")) {
			    	$('#ff${_prefix}').form('submit', {
					    url:'/admin/interface/deleteNote?${_csrf.parameterName}=${_csrf.token}',
					    onSubmit: function(){						    	
					    	$("#board_idx").val($index);					    	
					    	document.ff${_prefix}.target = 'ifrm';
					    	document.ff${_prefix}.submit();
					    },
					    success:function(data){
					    	parent.noteListReload("note");
							return false;
					    }
					});
			    	return false;
		    	} else {			    		
		    		return false;
		    	}
				
			}); 
			
			
			$("#saveBtn${_prefix}").off("click").on("click", function(){
				
		    	
		    	if($("input[name='board_name']").val() == "") {
					$("input[name='board_name']").focus();
					alert("각주이름을 입력해주세요.");
					return false;
				}
		    	
		    	if($("input[name='board_detail']").val() == "") {
					$("input[name='board_detail']").focus();
					alert("각주내용을 입력해주세요.");
					return false;
				}
			
		    	var sHTML = editorNote.getById["board_detail"].getIR();
		    	
		    	var param = {};
		    	param.board_name = $("#board_name").val();
		    	param.board_detail = sHTML;
		    	param.board_use_yn = $("input[name='board_use_yn']:checked").val();
				
		    	
				$.ajax({  
		               url      		 	: '/admin/interface/insertNote'
		              ,data 			 	: param
		              ,type    			: "POST"
		              ,dataType 		: "json"
		              ,success  : function(data) {
		            	  parent.noteListReload("note");
		              }
        		});
				
				return false;
			});
   		})
   	</script>
   	
   	
</body>
</html>