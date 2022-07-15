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
							<input type="hidden" id="templete_idx" name="templete_idx" value="0">
							
							<div class="" style="background-color: #fff">
								<table class="table_st01">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody id="tableBody">
										<tr>
											<th><label for="code_templete_cate" class="table_tit">카테고리</label></th>
											<td style="text-align: left" class="p_space10">
												<select class="easyui-combobox" id="code_templete_cate" data-options="missingMessage:'카테고리 입력은 필수 입력값입니다.',required:true" data-prefix="${_prefix}" style="width: 45%;">
												</select>
												<input type="hidden" name="code_templete_cate_val" id="code_templete_cate_val" /> 
											</td>											
										</tr>
										<tr>
											<th>
												<label for="templete_title" class="table_tit">템플릿 명</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="templete_title" id="templete_title" data-options="missingMessage:'템플릿 명 입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="템플릿 명을 입력해주세요." style="width: 80%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="templete_type" class="table_tit">템플릿 형식</label>
											</th>
											<td style="text-align: left;">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" name="templete_type" id="templete_type" value="page" checked>
															<span class="icon_radio">일반페이지</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" name="templete_type" value="popup">
															<span class="icon_radio">팝업</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" name="templete_type" value="email">
															<span class="icon_radio">이메일 폼</span>
														</label>
													</li>
												</ul> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="templete_useyn" class="table_tit">사용여부</label>
											</th>
											<td style="text-align: left;">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" name="templete_useyn" value="Y" checked>
															<span class="icon_radio">사용</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" name="templete_useyn" value="N">
															<span class="icon_radio">사용안함</span>
														</label>
													</li>
												</ul> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="templete_css" class="table_tit">적용 css</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="templete_css" id="templete_css" class="easyui-validatebox" placeholder="적용할 css를 입력해주세요." style="width: 80%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="templete_js" class="table_tit">적용 js</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="templete_js" id="templete_js" class="easyui-validatebox" placeholder="적용할 js를 입력해주세요." style="width: 80%" /> 
											</td>
										</tr>
										<tr>
											<th style="background:#f8f8f8">
												<label for="templete_content" class="table_tit" style="max-width: 720px;">내용</label>
											</th>
											<td>
												<textarea name="templete_content" id="templete_content" rows="10" cols="100" style='width: 95%; margin:10px; min-width: 260px; height: 20em; display: block;'></textarea>
											</td>																			
										</tr>
									</tbody>
								</table>
								<div id="contentCom" style="position:relative;top:0;z-index:-1;"></div>
								<!-- //article_box_wrap -->
								<div class="bd_btn_wrap">
									<ul>
										<li>
											<button id="saveBtn${_prefix}" data-prefix="${_prefix}">저장</button>
										</li>
										
										<c:if test="${_templete.templete_idx ne ''}">
										<li>
											<button id="deleteBtn${_prefix}" class="deleteBtn${_prefix}">삭제</button>
										</li>
										</c:if>
										
										<li>
											<button onclick="$('#w_${_prefix}').window('close');return false;">취소</button>
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
	<script type="text/javascript" src="/resources/admin/js/html2canvas.js"></script>

	<script type="text/javascript">
	
		var $index = "${_templete.templete_idx}";
		
   		$(document).ready(function() {
  				
   			commonFnc.fnCommonCode("templete_cate", "A150", null, "select", "==카테고리를 선택하세요==");

   			$(".imgPopup").off("click").on("click", function(){
   				var idx = $(this).data("idx");
   				winPopUPCenter("/admin/imgPopup?${_csrf.parameterName}=${_csrf.token}&idx=" + idx , "img", 1, 1, "yes", "yes");
   				
   			});
   			   				
			$(".fileDeleteBtnSet").off("click").on("click", function(){
				$('.' + $(this).data("file")).remove();
			});
				
				
   			if ( $index != 0)
			{	   			
   				setTimeout(function(){
	   				$('#ff${_prefix}').form({
	   					onLoadSuccess:function(data){
	   						
	   						if(data.templete_cate != "")
	   						{
	   							$('#code_templete_cate').combobox('setText', data.templete_cate_name);
								$("#code_templete_cate_val").val(data.templete_cate);
	   						}
	   						
	   						$("#templete_title").val(data.templete_title);
	   						
	   						$('input:radio[name=templete_useyn]:input[value=' + data.templete_useyn + ']').attr("checked", true);
	   						$('input:radio[name=templete_type]:input[value=' + data.templete_type + ']').attr("checked", true);
	   						$("#templete_css").val(data.templete_css);
	   						$("#templete_js").val(data.templete_js);
	   						$("#templete_content").val(data.templete_content);
	   						
	   					}
	   				});
	   				
	   				$('#ff${_prefix}').form('load', '/admin/interface/selectTemplete?templete_idx='+$index ); 
   				}, 500);
			}
   			
   			
			$("#deleteBtn${_prefix}").off("click").on("click", function(){
				if(confirm("삭제하시겠습니까?")) {
			    	$('#ff${_prefix}').form('submit', {
					    url:'/admin/interface/deleteTemplete?${_csrf.parameterName}=${_csrf.token}',
					    onSubmit: function(){						    	
					    	document.ff${_prefix}.templete_idx = $index;						    	
					    	document.ff${_prefix}.target = 'ifrm';
					    	document.ff${_prefix}.submit();
					    },
					    success:function(data){
					    	parent.templeteReload("BD15");
							return false;
					    }
					});
			    	return false;
		    	} else {			    		
		    		return false;
		    	}
				
			}); 
						
			$("#saveBtn${_prefix}").off("click").on("click", function(){
				
				var templete_cate = '';
		    	if($('#code_templete_cate').combobox('getValue') == "" && $("#code_templete_cate_val").val() == "") {
		    		
					$("#code_templete_cate").focus();
					alert("카테고리를 선택하세요.");
					return false;
					
				} else {
					
					if($('#code_templete_cate').combobox('getValue') != "")
						{
							templete_cate = $('#code_templete_cate').combobox('getValue');
						} else {
							templete_cate = $("#code_templete_cate_val").val();
						}
				}
		    	
		    	if($("input[name='templete_title']").val() == "") {
					$("input[name='templete_title']").focus();
					alert("템플릿 명을 입력해주세요.");
					return false;
				}
		    	
				if ($("#templete_content").val() == "")
    			{
	    			alert("내용을 작성해주세요.");
	    			return false;
    			} 
				
				var param = {};		    	
		    	param.templete_idx = $index;
		    	param.templete_cate = templete_cate;
		    	param.templete_title = $("input[name='templete_title']").val();
		    	param.templete_type = $("input[name='templete_type']:checked").val();
				param.templete_useyn= $("input[name='templete_useyn']:checked").val();
				param.templete_css = $("input[name='templete_css']").val();
				param.templete_js = $("input[name='templete_js']").val();
				param.templete_content = $("#templete_content").val();				
				param.tcd_attr3 = "<c:out value="${boardOptionList[0].tcd_attr3}" default="Korea" escapeXml="true"/>"
				
				
   				/** 화면 캡처 이미지를 위한 영역 **/
   				var templete_css = $("input[name='templete_css']").val();
				$("#contentCom").html("");
				$("#contentCom").append($("#templete_content").val());
 					
   				if( templete_css != null && templete_css != '' ) {					
   					$("#contentCom").append('<link rel="stylesheet" type="text/css" href="'+templete_css+'">');
   				}
   				var base64 = null;
   				if( $("#contentCom").html() != null && $("#contentCom").html() != '' ) {
   					
   					html2canvas(document.getElementById("contentCom")).then(function(canvas) {						
   	   					base64 = canvas.toDataURL("image/jpeg");	
	   	   			})
	   	   			.then(function() {
						
						param.templete_thum = base64;
						
	   	   				$.ajax({  
		 		               url      		 	: '/admin/interface/insertTemplete'
		 		              ,data 			 	: param
		 		              ,type    			: "POST"
		 		              ,dataType 		: "json"
		 		              ,success  : function(data) {
		 		            	  parent.templeteReload("BD15");
		 		              }
		         		});
		 				
		 				return false;	
	   	   			})
   					
   				} else {
   					
   					$.ajax({  
	 		               url      		 	: '/admin/interface/insertTemplete'
	 		              ,data 			 	: param
	 		              ,type    			: "POST"
	 		              ,dataType 		: "json"
	 		              ,success  : function(data) {
	 		            	  parent.templeteReload("BD15");
	 		              }
	         		});
	 				
	 				return false;
   					
   				}			
				
			});
   		})
   	</script>
   	
   	
</body>
</html>