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
		<div data-options="region:'center',title:''" style="padding: 5px;">
			<div id="board_pannel"	style="height: auto; padding: 5px; border: 0; overflow-x: hidden">
				<div class="article_box_wrap cf" style="text-align: center">
					<div class="article_box article_box_left">
						<form id="ff${_prefix}" name="ff${_prefix}" method="post" onsubmit="return false;">
							<input type="hidden" name="board_menu_code" id="board_menu_code" value="${_prefix}"> 
							<input type="hidden" id="board_upload_drop${_prefix}" name="board_upload_drop" />							
							<input type="hidden" id="save_file${_prefix}" name="save_file${_prefix}" value="" />

							<div class="" style="background-color: #fff">
								<table class="table_st01">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody id="tableBody">
										
										<tr>
											<th>
												<label for="board_etc1_date${_prefix}" class="table_tit">예약날짜</label>
											</th>
											<td colspan="2" style="text-align: left;">												
												<input type="text" id="board_etc1_date${_prefix}" name="board_etc1_date" readonly />
											</td>
										</tr>
										
										<tr>
											<th>
												<label for="board_etc1_time${_prefix}" class="table_tit">예약시간</label>
											</th>
											<td colspan="2" style="text-align: left;">												
												<input type="text" id="board_etc1_time${_prefix}" name="board_etc1_time" readonly />
											</td>
										</tr>
										
										<tr>
											<th>
												<label for="board_cate_L${_prefix}" class="table_tit">진료구분</label>
											</th>
											<td colspan="2" style="text-align: left;">
												<input type="text" id="board_cate_L${_prefix}" name="board_cate_L"  readonly/>
											</td>
										</tr>
										
										<tr>
											<th>
												<label for="board_reg_name${_prefix}" class="table_tit">예약자 정보</label>
											</th>
											<td colspan="2" style="text-align: left;">
												<input type="text" name="board_reg_name${_prefix}" id="board_reg_name${_prefix}" readonly /> 
											</td>
										</tr>
										
										<tr>
											<th>
												<label for="board_mobile${_prefix}" class="table_tit">예약처</label>
											</th>
											<td colspan="2" style="text-align: left;">
												<input type="text" name="board_mobile${_prefix}" id="board_mobile${_prefix}" readonly /> 
											</td>
										</tr>
										
										<tr>
											<th>
												<label for="board_etc2${_prefix}" class="table_tit">상태</label>
											</th>
											<td colspan="2" style="text-align: left;" class="p_space10">												
												<select class="easyui-combobox searchSel" id="board_etc2${_prefix}" data-prefix="${_prefix}" style="width: 45%;">
													<option value="1">접수</option>
													<option value="2">대기</option>
													<option value="3">완료</option>
													<option value="4">취소</option>
												</select> 
											</td>
										</tr>
										
										<tr>
											<th>
												<label for="board_mobile${_prefix}" class="table_tit">유입경로</label>
											</th>
											<td colspan="2" style="text-align: left;" class="path${_prefix}">
												 
											</td>
										</tr>
										<tr>
											<th>
												<label for="chief_complaint${_prefix}" class="table_tit">CC</label>
											</th>
											<td colspan="2" style="text-align: left;" class="p_space10">
												<select class="easyui-combobox searchSel"
													id="chief_complaint${_prefix}" data-prefix="${_prefix}"
													style="width: 45%;">
												</select> 
												<input type="hidden" id="chief_complaint_val${_prefix}"
													name="chief_complaint" /> 
											</td>
										</tr>	
										<tr>
											<th>
												
												<label for="board_responsibility${_prefix}" class="table_tit">담당</label>
											</th>
											<td colspan="2" style="text-align: left;" class="p_space10">
												<select class="easyui-combobox searchSel"
													id="board_responsibility${_prefix}" data-prefix="${_prefix}"
													style="width: 45%;">
												</select> 
												<input type="hidden" id="board_responsibility_val${_prefix}"
													name="board_responsibility" /> 
											</td>
										</tr>									
										<tr>
											<th colspan="2">
												<label for="" class="table_tit" style="max-width: 720px;">관리자 메모</label>
											</th>
										</tr>
										<tr>
											<td colspan="2">
												<textarea name="board_reply${_prefix}" id="board_reply${_prefix}" rows="10" cols="100" style='width: 100%; min-width: 260px; height: 30em; display: block;'></textarea>
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
										
										<c:if test="${_board.board_idx ne ''}">
										<li>
											<button id="deleteBtn${_prefix}" class="deleteBtn${_prefix}">삭제</button>
										</li>
										</c:if>
										
										<li>
											<button id="cancelBtn${_prefix}">취소</button>
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
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp"%>

	<script type="text/javascript">
   		$(document).ready(function() {
   				var $index = "${_board.board_idx}";
   					   			   				
   				$(".fileDeleteBtnSet").off("click").on("click", function(){
   					$('.' + $(this).data("file")).remove();
   				});
   				
	   			var editorBoard${_prefix} = [];
	   			
	   			$meplzNaverEditor.init({ 
	   				  container 			: "board_reply${_prefix}"
	   				, saver					: editorBoard${_prefix}
	   				, onLoadSuccecs   : function(){ 
	   					if ( $index != 0)
	   					{
	   						setTimeout(function(){
	   							
		   						$('#ff${_prefix}').form({
		   							onLoadSuccess:function(data){
		   								
		   								$("#board_etc1_date${_prefix}").val(data.rows[0].board_etc1_date);		   								
		   								$("#board_etc1_time${_prefix}").val(data.rows[0].board_etc1_time);
		   								$("#board_reg_name${_prefix}").val(data.rows[0].board_reg_name);
		   								
		   								$("#board_mobile${_prefix}").val(data.rows[0].board_mobile);
		   								$("#board_responsibility${_prefix}").val(data.rows[0].board_responsibility);
		   								$("#chief_complaint${_prefix}").val(data.rows[0].chief_complaint_nm);
		   								
		   								var res_status;
		   								if( data.rows[0].board_etc2 == '1' ) {
		   									res_status = "접수";
		   								} else if( data.rows[0].board_etc2 == '2' ) {
		   									res_status = "대기";
		   								} else if( data.rows[0].board_etc2 == '3' ) {
		   									res_status = "완료";
		   								} else if( data.rows[0].board_etc2 == '4' ) {
		   									res_status = "취소";
		   								}
		   								
		   								$('#board_etc2${_prefix}').combobox('setText',res_status);
	   									$("#board_etc2${_prefix}").val(data.rows[0].board_etc2);
		   								
		   								$("#board_cate_L${_prefix}").val(data.rows[0].board_cate_L);
		   								
		   								$(".path${_prefix}").html(data.rows[0].utm_path);
				   				   		
	   									editorBoard${_prefix}.getById["board_reply${_prefix}"].exec("SET_IR", [""]); //내용초기화
	   									editorBoard${_prefix}.getById["board_reply${_prefix}"].exec("PASTE_HTML", [data.rows[0].board_reply]);
	   									
   					    				$('#board_responsibility${_prefix}').combobox('setText',data.rows[0].board_responsibility_nm);
   										$("#board_responsibility_val${_prefix}").val(data.rows[0].board_responsibility_cd);	
   										
   										$('#chief_complaint${_prefix}').combobox('setText',data.rows[0].chief_complaint_nm);
   										$("#chief_complaint_val${_prefix}").val(data.rows[0].chief_complaint_cd);
	   					    			
	   									
		   							 }
		   						});    	
		   						
		   						$('#ff${_prefix}').form('load', '/admin/interface/selectBoard/${menu_code}?board_idx=' + $index );		   						
	   						},500);	   						
	   					}
	   					
	   				}
	   			});
	   			
	   						   			
	   		var editIndex 		= undefined;	//그리드 에디트를 위한 전역변수
	   		
	   		fnCommonCodeSearch("board_responsibility${_prefix}", "<c:out value="A182" default="Korea" escapeXml="true"/>",0, null);
			fnCommonCodeSearch("chief_complaint${_prefix}", "<c:out value="A183" default="Korea" escapeXml="true"/>",0, null);
			
			function fnCommonCodeSearch(appendId, code, level, p_code) {
    			var treePrm = {};
				treePrm.search_master = code;
				treePrm.search_useyn = "Y";
				
				
				if(level != null) {
					treePrm.search_level = level;					
					treePrm.search_parent = p_code;					
				}
				
				$.ajax({  
		               url      		 : "/admin/interface/selectCodeDetail"
		              ,data 			 : treePrm
		              ,type    			 : "POST"
		              ,dataType 		 : "json"
		              ,success  : function(data) {
		            	  	if( p_code != null && p_code != '' ) {		            	  		
			            	  	$('#'+appendId).empty();
		            	  	}
							var html ='<option value="" selected="selected">카테고리 선택</option>';
				           	var y = data.rows[0].children;
			            	$.each(y , function (index, item) { 
								html += '<option value="'+item.tcd_code+'">'+item.tcd_title+'</option>'
							});
			            	$('#'+appendId).append(html);
			            	if( $(".board_cate_M_area").css("display") == "inline-block" ) {
				            	$('#'+appendId).combobox({
				            		onChange : function(newValue,oldValue){
				            			if( appendId == "board_cate_L${_prefix}" ) {
				            				if(newValue == "A180_BD19" || newValue == "A180_BD20" || newValue == "A180_BD21" || newValue == "A180_BD22" || newValue == "A180_BD23" || newValue == "A180_BD24"){
				            					//$('#board_cate_M${_prefix}').combobox('setText',"");
			   									//$("#board_cate_M_val${_prefix}").val("");
				            					newValue = "A180_BD08";
				            				}
				            				fnCommonCodeSearch("board_cate_M${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>", 1, newValue);
				            			}				        			
					        		}
				            	});
				            	
			            	} else {
			            		
			            		$('#'+appendId).combobox({
			            			
			            		});
			            		
			            	}            	
		              }
           		});
    		};
    		
    		
	   			
   			$("#saveBtn${_prefix}").off("click");
			$("#saveBtn${_prefix}").on("click", function(){
				
				var sHTML = editorBoard${_prefix}.getById["board_reply${_prefix}"].getIR();
		    			    	
		    	var param = {};
		    	param.Board_idx = $index;
		    	param.board_menu_code = "${_prefix}";
				param.board_reply = sHTML;				
				param.board_etc2 = $("#board_etc2${_prefix} option:selected").val();
				param.board_show = 'Y';
				param.board_responsibility = $("#board_responsibility${_prefix}").val();
				param.chief_complaint = $("#chief_complaint${_prefix}").val();
				
				$.ajax({  
		               url      		 : '/admin/board/insertBoard'
		              ,data 			 : param
		              ,type    			 : "POST"
		              ,dataType 		 : "json"
		              ,success  : function(data) {
		            	  if(${_prefix == 'BD08' || _prefix == 'BD11' || _prefix == 'BD12' || _prefix == 'BD16' || _prefix == 'BD17'}){
		            		  parent.boardReload('BDMNG');
		            	  }else{
		            		  parent.boardReload('${_prefix}');
		            	  }
		              }
        		});
				
				return false;
			}); 
		    			
			$(".deleteBtn${_prefix}").off("click").on("click", function(){
				if(confirm("삭제하시겠습니까?")) {
					var param = {};
					param.Board_idx = "${_board.board_idx}";

					$.ajax({  
			               url      		 : '/admin/board/deleteBoard'
			              ,data 			 : param
			              ,type    			 : "POST"
			              ,dataType 		 : "json"
			              ,success  : function(data) {
			            	  if(${_prefix == 'BD08' || _prefix == 'BD11' || _prefix == 'BD12' || _prefix == 'BD16' || _prefix == 'BD17'}){
			            		  parent.boardReload('BDMNG');
			            	  }else{
			            		  parent.boardReload('${_prefix}');
			            	  }
			              }
	        		});
			    	return false;
		    	} else {
		    		return false;
		    	}
			}); 
						
			$("#cancelBtn${_prefix}").off("click").on("click", function(){
				parent.boardReload('${_prefix}');
			});
			
			
		});


		
   	</script>
</body>
</html>