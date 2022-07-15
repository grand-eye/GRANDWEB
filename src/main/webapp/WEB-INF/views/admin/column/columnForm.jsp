<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>
</head>
<body id="columnForm" style="background-color: #fff">
	<div id="columnBodys" class="easyui-layout" style="width: 100%; height: 100%;">
		<div data-options="region:'center',title:''" style="padding: 5px;">		
			<div id="column_pannel"	style="height: auto; padding: 5px; border: 0; overflow-x: hidden">
				<div class="article_box_wrap cf" style="text-align: center">
					<div class="article_box article_box_left">
						<form id="ff${_prefix}" name="ff${_prefix}" method="post" onsubmit="return false;">
							<input type="hidden" id="column_idx" name="column_idx" value="0">
							<input type='hidden' class='file_idx${_prefix}' name='file_idx${_prefix}' value='${columnFileList[0].idx}' />
   							<input type='hidden' class='file_name${_prefix}' name='file_name${_prefix}' value='${columnFileList[0].fileName}' />
   							<input type='hidden' class='file_original${_prefix}' name='file_original${_prefix}' value='${columnFileList[0].orgName}' />
   							<input type="hidden" id="save_file${_prefix}" name="save_file${_prefix}" value="" />	
							<div style="background-color: #fff">
								<table class="table_st01">
									<colgroup>
										<col width="25%" />
										<col width="*" />
									</colgroup>
									<tbody id="tableBody${_prefix}">
										<tr>
											<th>
												<label for="column_title${_prefix}" class="table_tit">칼럼타이틀</label>
											</th>
											<td style="text-align: left;">
												<input type="text" name="column_title${_prefix}" id="column_title${_prefix}" data-options="missingMessage:'칼럼타이틀 입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="칼럼타이틀을 입력해주세요." style="width: 80%" /> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="landing01${_prefix}" class="table_tit">랜딩페이지 사용여부</label>
											</th>
											<td style="text-align: left;">
												<input type="checkbox" id="landing01${_prefix}" name="landing01${_prefix}" value="Y">랜딩01
												<input type="checkbox" id="landing02${_prefix}" name="landing02${_prefix}" value="Y">랜딩02
												<input type="checkbox" id="landing03${_prefix}" name="landing03${_prefix}" value="Y">랜딩03
												<input type="checkbox" id="landing04${_prefix}" name="landing04${_prefix}" value="Y">랜딩04
												<input type="checkbox" id="landing05${_prefix}" name="landing05${_prefix}" value="Y">랜딩05
												<br>
												<input type="checkbox" id="landing06${_prefix}" name="landing06${_prefix}" value="Y">랜딩06
												<input type="checkbox" id="landing07${_prefix}" name="landing07${_prefix}" value="Y">랜딩07
												<input type="checkbox" id="landing08${_prefix}" name="landing08${_prefix}" value="Y">랜딩08
												<input type="checkbox" id="landing09${_prefix}" name="landing09${_prefix}" value="Y">랜딩09
												<input type="checkbox" id="landing10${_prefix}" name="landing10${_prefix}" value="Y">랜딩10
											</td>
										</tr>
										<tr>
											<th>
												<label for="column_cate${_prefix}" class="table_tit">카테고리</label>
											</th>
											<td colspan="2" style="text-align: left;" class="p_space10">
												<select class="easyui-combobox searchSel" id="column_cate${_prefix}" data-prefix="${_prefix}" style="width: 45%;">
												</select> 
												<input type="hidden" id="column_cate_val${_prefix}" name="column_cate" />
											</td>
										</tr>
										<tr>
											<th>
												<label for="column_reg_date${_prefix}" class="table_tit">등록일</label>
											</th>
											<td style="text-align: left;" class="p_space10">
												<input id="column_reg_date${_prefix}" name="column_reg_date${_prefix}" class="easyui-datebox easyui-validatebox" style="width: 250px">
												<input type="hidden" name="column_reg_date" id="column_reg_date" value=""> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="column_useyn${_prefix}" class="table_tit">칼럼 사용여부</label>
											</th>
											<td style="text-align: left;">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" name="column_useyn${_prefix}" value="Y" checked>
															<span class="icon_radio">사용</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" name="column_useyn${_prefix}" value="N">
															<span class="icon_radio">사용안함</span>
														</label>
													</li>
												</ul> 
											</td>
										</tr>
										<tr>
											<th>
												<label for="" class="table_tit">칼럼 컨텐츠</label>
											</th>
											<td style="text-align: left;" class="p_space10">
												<span id="checkRegister${_prefix}">미등록</span>&nbsp;&nbsp;
												<button type="button" class="btn_landing" id="columnRegister${_prefix}" data-opt="">칼럼페이지 내용등록</button>
												<textarea id="column_content${_prefix}" name="column_content${_prefix}" style="visibility:hidden;height:0;padding:0;" ></textarea>
											</td>
										</tr>
										<tr>
											<th colspan="2"><span class="table_tit">이미지등록</span></th>
											</tr>
											<tr>
												<td colspan="2">
													<div class="img_register_wrap img_register_01">
														<ul class="cfs">
															<li style="width:34%;">
																<a href="#" class="easyui-linkbutton imgdel" data-options="plain:true,iconCls:'icon-cancel'" style="width:45%;display:none;position: absolute;left: 81%;"></a>
																<div class="easyui-droppable targetarea targetDropBox img${_prefix}" id="target01${_prefix}" data-index="0">
																	<img src="/admin/img/img_sample.jpg" alt="썸네일" style="height:100%;" class="column_thumb_tag">
																</div>
																<span class="img_txt">썸네일</span>
															</li>
														</ul>
													</div>
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
										
										<c:if test="${_column.column_idx ne ''}">
										<li>
											<button id="deleteBtn${_prefix}" class="deleteBtn${_prefix}">삭제</button>
										</li>
										</c:if>
										
										<li>
											<button onclick="location.reload();">취소</button>
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
		<div data-options="region:'east',title:'업로드',split:false" style="width:432px;">
	    	<div  class="common_file_pannel" style="height:auto;padding:5px;border:0;overflow:hidden"  > 
	    	</div>
	    </div>
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp"%>
	
	<script type="text/javascript">
	
	
		var $index = "${_column.column_idx}";
		var $upCategory = "column";
		var $bannersub_idx = "${_banner.bannersub_idx}";
		fnCommonCodeSearch("column_cate${_prefix}", "A060", null);
		
		$(".common_file_pannel").panel({
		    href	:	'/admin/file/commonFileRegForm?s_category='+$upCategory					,
		    onLoad:function(){
		        
		    }
		});	
		
   		$(document).ready(function() {
   			
   			$(".targetDropBox").droppable({
   				accept: '.dragitem',
	            onDragEnter:function(e,source){
		               //$(this).html('enter');
		        }
   				,
		        onDragLeave: function(e,source){

		        }
   				,
		        onDrop: function(e,source){
		               var title = $(source).data("title");
		               var filekey = $(source).data("filekey");
		               var filepath = $(source).data("imgsrc");
		               var b_filename = $(source).data("imgname");
		               var indexNum = $(".targetDropBox").index(this);
		               var optNum   = $(this).data("index");
		               var imgsrc = $(source).find("div").css('background-image');
		               imgsrc = imgsrc.replace('url(','').replace(')','').replace(/\"/gi, "");
		               
		               
		               
		               //imgsrcArray2 = imgsrcArray.reverse();
					   if(optNum == 0) //썸네일
					   {
						   $("#bannersub_webImg").val(filepath + b_filename);
						   $("#bannersub_webImgfilekey").val(filekey);
					   }
		               var html ='<img src="'+ filepath + b_filename +'" />';
		               $(this).next().html(title);
		               $(this).html( html );
		          	   	
		               $(this).prev().css("display", "block");
		               
		  			   $(".imgdel").off("click").on("click", function(){
							 $(this).next().find("img").remove();
							 $(this).next().find("img").attr('src','/admin/img/img_sample.jpg')
							
							 if($(this).next().data("index") == 0)
							 {
								 $(this).next().next().text("썸네일");
								 $("#bannersub_webImg").val("");
								 $("#bannersub_webImgfilekey").val("");
							 }
						 
					  });		               
		        }    				
   			});   
   			
   			if ( $index != 0 )
			{	   				
   				$('#ff${_prefix}').form({
   					onLoadSuccess:function(data){
   												   						
   						setTimeout(function() {
   							  
   							if(data.column_title) {
   								$("#column_title${_prefix}").val(data.column_title);
   							}
   							
   							if(data.column_useyn) {
   								$('input:radio[name=column_useyn${_prefix}]:input[value=' + data.column_useyn + ']').attr("checked", true);
   							}
   							
   							if(data.column_content) {
   								$("#checkRegister${_prefix}").text("등록");
   								$("#column_content${_prefix}").text(data.column_content);
   							}
   							
   							if(data.column_cate != "") {
								$("#column_cate${_prefix}").combobox('setText',data.column_cate_nm);
								$("#column_cate_val${_prefix}").val(data.column_cate);
							}
   							
   							if(data.landing01 == "Y") {
   								$('#landing01${_prefix}').prop('checked', true);
							}
   							if(data.landing02 == "Y") {
   								$('#landing02${_prefix}').prop('checked', true);
							}
   							if(data.landing03 == "Y") {
   								$('#landing03${_prefix}').prop('checked', true);
							}
   							if(data.landing04 == "Y") {
   								$('#landing04${_prefix}').prop('checked', true);
							}
   							if(data.landing05 == "Y") {
   								$('#landing05${_prefix}').prop('checked', true);
							}
   							if(data.landing06 == "Y") {
   								$('#landing06${_prefix}').prop('checked', true);
							}
   							if(data.landing07 == "Y") {
   								$('#landing07${_prefix}').prop('checked', true);
							}
   							if(data.landing08 == "Y") {
   								$('#landing08${_prefix}').prop('checked', true);
							}
   							if(data.landing09 == "Y") {
   								$('#landing09${_prefix}').prop('checked', true);
							}
   							if(data.landing10 == "Y") {
   								$('#landing10${_prefix}').prop('checked', true);
							}
   							
   							$(".column_thumb_tag").prop("src", data.column_thum);
   							
   							
   							
   							$('#column_reg_date${_prefix}').datebox({
							    value: data.column_reg_date
							});
   							
   							/* 마이그레이션 데이터 일 경우 */
   							if( data.column_thum != null && data.column_thum != "" ) {
   								
   								$("#save_file${_prefix}").val(data.column_thum);
   								   								
   								var html = "";
   			   					var d = new Date();
   			   					var cls = d.getMinutes().toString() + d.getSeconds().toString();
   			   					
   			   					$("#columnFileArea").empty();
   			   					
   								html += "<div class='file"+cls+" inner${_prefix}'> ";
   			   					html += "   <br/> ";
   			   					html += "	<span class='fontFamily p_space10'>"+data.column_thum+"</span> ";
   		   						html += "	<a href='#' style='width:100px;margin-bottom:5px' class='fileDeleteBtnSet' data-file='file"+cls+"' > ";
   		   						html += "		<div class='btn-x'></div>";
   		   						html += "	</a> ";
   								html += "</div> ";
   								
   								$("#columnFileArea").append(html);
   								
   								$(".fileDeleteBtnSet").off("click").on("click", function(){
   			   		  				
   									$("#save_file${_prefix}").val("");
   									
   			   		   				$("#columnFileArea").empty();
   			   		   				
   				   		   			$(".file_idx${_prefix}").val("");
   				   					$(".file_name${_prefix}").val("");
   				   					$(".file_original${_prefix}").val("");
   			   					
   			   		   				var html = '';
   			   		   					html += '<div id="code_column_tmp${_prefix}" class="m_space10">';
   			   		   					html += '	<button type="button" class="btn_column" id="column_upload${_prefix}" data-opt="">파일 업로드</button>';
   			   		   					html += '</div>';
   			   		   					
   			   		  				$("#columnFileArea").html(html);
   			   		  				thumbnail_add();
   				   					
   				   				});	
   							}
   							   							
   						}, 800);						
   					}
   				});
   				
   				$('#ff${_prefix}').form('load', '/admin/interface/selectColumn?column_idx='+$index ); 
   				
   				
   				
			}
   			
			$("#deleteBtn${_prefix}").off("click").on("click", function(){
				if(confirm("삭제하시겠습니까?")) {
			    	$('#ff${_prefix}').form('submit', {
					    url:'/admin/interface/deleteColumn?${_csrf.parameterName}=${_csrf.token}',
					    onSubmit: function(){
					    	$("#column_idx").val($index);
					    	//document.ff${_prefix}.column_idx = $index;						    	
					    	document.ff${_prefix}.target = 'ifrm';
					    	document.ff${_prefix}.submit();
					    },
					    success:function(data){
					    	parent.columnReload("column");
							return false;
					    }
					});
			    	return false;
		    	} else {			    		
		    		return false;
		    	}
				
			});
			
   			$(".imgPopup").off("click").on("click", function(){
   				var idx = $(this).data("idx");
   				winPopUPCenter("/admin/imgPopup?${_csrf.parameterName}=${_csrf.token}&idx=" + idx , "img", 1, 1, "yes", "yes");
	   				
   			});
	   			
   			$(".fileDeleteBtnSet").off("click").on("click", function(){
  				
   				$("#columnFileArea").empty();
   				
				$(".file_idx${_prefix}").val("");
				$(".file_name${_prefix}").val("");
				$(".file_original${_prefix}").val("");
   				
   				var html = '';
   					html += '<div id="code_column_tmp${_prefix}" class="m_space10">';
   					html += '	<button type="button" class="btn_column" id="column_upload${_prefix}" data-opt="">파일 업로드</button>';
   					html += '</div>';
   					
  				$("#columnFileArea").html(html);
  				thumbnail_add();
  					
  			});	
						
			$("#saveBtn${_prefix}").off("click").on("click", function(){
				
		    	if($("#column_title${_prefix}").val() == "") {
					$("#column_title${_prefix}").focus();
					alert("칼럼타이틀을 입력해주세요.");
					return false;
				}
		    	
		    	if($("#column_title${_prefix}").val().indexOf('%') > -1 || $("#column_title${_prefix}").val().indexOf('/') > -1 ) {
					$("#column_title${_prefix}").focus();
					alert("% 혹은 /는 사용할 수 없습니다.");
					return false;
				}
		    	
		    	if($("#column_title_columnForm").val().length > 30) {
					$("#column_title${_prefix}").focus();
					alert("30자 이하로 작성해주세요.");
					return false;
				}
		    	
		    	var column_cate = "";
		    	if($('#column_cate${_prefix}').combobox('getValue') == "" && $("#column_cate_val${_prefix}").val() == "") {
					$("#column_cate${_prefix}").focus();
					alert("카테고리를 선택해주세요.");
					return false;
				} else {
					
					if($('#column_cate${_prefix}').combobox('getValue') != "")
					{
						column_cate = $('#column_cate${_prefix}').combobox('getValue');
					} else {
						column_cate = $("#column_cate_val${_prefix}").val();
					}
				}
		    	
		    	var column_reg_date = "";
		    	var format = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		    	var str = $("#column_reg_date${_prefix}").val().split(" ")[0];
		    	
		    	if(str == "") {					
					alert("등록일을 입력해주세요.");
					return false;
				} else {
	    			if(!format.test(str)) {
						alert("달력을 이용하여 날짜를 입력해주세요.");
						return false;
					}
	    		}
		    	
		    	column_reg_date = $("#column_reg_date${_prefix}").val();
		    	
		    	
		    	if( $("#column_content${_prefix}").text() == "" ) {					
					alert("칼럼페이지 내용을 등록해주세요.");
					return false;
				}
		    	
		    	var file_name = $(".file_name${_prefix}").val();
   				var file_original = $(".file_original${_prefix}").val();
   				var file_idx = $(".file_idx${_prefix}").val();
   				
   				
		    	if( $("#save_file${_prefix}").val() == "" ) {
		    		
		    		/* if($(".file_idx${_prefix}").val() == "" ) {   					
						alert("썸네일을 등록해주세요.");
						return false;
					} */
		    		
		    		if($(".column_thumb_tag").attr("src") == "" || $(".column_thumb_tag").attr("src") == "/admin/img/img_sample.jpg" ) {   					
						alert("썸네일을 등록해주세요.");
						return false;
					} 
	   				
	   				if(file_name != "")
					{
	   					
	   					file_name = file_name.substring(0,file_name.length-1)
	   					file_original = file_original.substring(0,file_original.length-1)
					}
	   				
		    	}	    	
		    			    	
		    	var param = {};
		    	param.column_idx 		= $index;
		    	//param.column_key = key;
		    	param.column_title 		= $("#column_title${_prefix}").val();
				param.column_content 	= $("#column_content${_prefix}").text();		    	
				param.column_useyn 		= $("input[name='column_useyn${_prefix}']:checked").val();
				param.column_reg_date	= column_reg_date;
				param.column_thum		= $("#target01_columnForm").find("img").attr("src");
				/* if($(".img${_prefix}").find("img").attr("src") !=null && $(".img${_prefix}").find("img").attr("src") !=''){
					param.column_thum		= $(".img${_prefix}").find("img").attr("src");
				}else{
					param.column_thum		= $(".column_thumb_tag").attr("src");
				} */
				param.column_cate		= column_cate;
				param.idx				= file_idx;
				param.file_name 		= file_name;
				param.file_original 	= file_original;
				
				param.landing01 = $('#landing01${_prefix}').is(':checked') == true ? "Y" : "N";
				param.landing02 = $('#landing02${_prefix}').is(':checked') == true ? "Y" : "N";
				param.landing03 = $('#landing03${_prefix}').is(':checked') == true ? "Y" : "N";
				param.landing04 = $('#landing04${_prefix}').is(':checked') == true ? "Y" : "N";
				param.landing05 = $('#landing05${_prefix}').is(':checked') == true ? "Y" : "N";
				param.landing06 = $('#landing06${_prefix}').is(':checked') == true ? "Y" : "N";
				param.landing07 = $('#landing07${_prefix}').is(':checked') == true ? "Y" : "N";
				param.landing08 = $('#landing08${_prefix}').is(':checked') == true ? "Y" : "N";
				param.landing09 = $('#landing09${_prefix}').is(':checked') == true ? "Y" : "N";
				param.landing10 = $('#landing10${_prefix}').is(':checked') == true ? "Y" : "N";
				
				$.ajax({  
		               url      		 	: '/admin/interface/insertColumn'
		              ,data 			 	: param
		              ,type    			: "POST"
		              ,dataType 		: "json"
		              ,success  : function(data) {		            	  
		            	  //parent.columnReload("column");
		            	  location.reload();
						  return false;
		              }
        		});
				
				return false;
			});
			
			$("#columnRegister${_prefix}").off("click").on("click", function() {
				
				var column_idx = $index;				
				
				$('#w${_prefix}_content').window('center').window('open');
				$('#w${_prefix}_content').window('refresh','/admin/column/columnContent?column_idx=' + column_idx );
		    	
			});
									
			thumbnail_add();
   		});
   		
   		function fnCommonCodeSearch(appendId, code, level) {
			var treePrm = {};
			treePrm.search_master = code;
			treePrm.tcd_useyn = "Y";
			if(level != null) {
				treePrm.search_level = level;
			}
			$.ajax({  
	               url      		 : "/admin/interface/selectCodeDetail"
	              ,data 			 : treePrm
	              ,type    			 : "POST"
	              ,dataType 		 : "json"
	              ,success  : function(data) {
						var html ='<option value="" selected="selected">카테고리 선택</option>';
			           	var y = data.rows[0].children;
		            	$.each(y , function (index, item) { 
							html += '<option value="'+item.tcd_code+'">'+item.tcd_title+'</option>'
						});
		            	$('#'+appendId).append(html);
		            	
		            	$('#'+appendId).combobox({
		            	   
		            	});
	              }
       		});
		}
   		
   		function thumbnail_add() {
   			
   			/* 썸네일첨부 */			
			var $fileInfo = "${_fileInfo}"		
			
			var cateCode 		= "column";
			var fileExt  		= $fileInfo.split("@")[0];
			var fileSize 		= $fileInfo.split("@")[1]+'mb';
			
			
			$meplzUploader.init({
	   			parameter : {
	   		        "groupCode" : ''					,
	   		        "cateCode" 	: cateCode							
	   			} 
	   			, dropBool : true
	   			, multiSelect : false
	   			, dropBox  : "column_upload${_prefix}"
	   			, uploadStartButton : "column_upload${_prefix}"
	   			, fileSize : fileSize
	   			, extensionMessage : "Image Files"
	   			, extension : fileExt
	   			, onLoadSucces : function(){
	   				
	   			}
	   			, onFileAdd : function(up, files){
	   				
	   			}
	   			, onUpdProgress : function(up, files){
	   				
	   			}
	   			, onError : function( up, err ){
	   				alert(err.message);				
	   			}
	   			, onComplete : function( svrResponse , fileInfo,  response ){
	   				
	   				if(svrResponse.flag == "N") 
	   				{
	   					alert("서버오류로 인해 파일 업로드가 실패하였습니다.");
	   				}
	   				else
	   				{
	   					
	   					var html = "";
	   					var d = new Date();
	   					var cls = d.getMinutes().toString() + d.getSeconds().toString();
	   					
						html += "<div class='file"+cls+" inner${_prefix}'> ";
	   					html += "   <br/> ";
	   					html += "	<span class='fontFamily p_space10'>"+svrResponse.original+"</span> ";
   						html += "	<a href='#' style='width:100px;margin-bottom:5px' class='fileDeleteBtnSet' data-file='file"+cls+"' > ";
   						html += "		<div class='btn-x'></div>";
   						html += "	</a> ";
						html += "</div> ";
						
						$("#columnFileArea").append(html);
						
						$("input[name='file_idx${_prefix}']").val(svrResponse.idx);
						$("input[name='file_name${_prefix}']").val(svrResponse.file_name);
						$("input[name='file_original${_prefix}']").val(svrResponse.original);
						
		   				$("#code_column_tmp${_prefix}").hide();
						
		   				$(".fileDeleteBtnSet").off("click").on("click", function(){
		   		  				
	   		   				$("#columnFileArea").empty();
	   		   				
		   		   			$(".file_idx${_prefix}").val("");
		   					$(".file_name${_prefix}").val("");
		   					$(".file_original${_prefix}").val("");
	   					
	   		   				var html = '';
	   		   					html += '<div id="code_column_tmp${_prefix}" class="m_space10">';
	   		   					html += '	<button type="button" class="btn_column" id="column_upload${_prefix}" data-opt="">파일 업로드</button>';
	   		   					html += '</div>';
	   		   					
	   		  				$("#columnFileArea").html(html);
	   		  				thumbnail_add();
		   					
		   				});	
	   				}	 		
	   			}
	   		}); 
   		}
   		
   		function contentAdd(html)
    	{
   			$('#w_columnForm_content').window('close');
   			$('#column_content${_prefix}').text(html);   			
   			$('#checkRegister${_prefix}').text("등록"); 
   			//thumbnail_add();
    	}
   		
   		$.fn.datebox.defaults.formatter = function (date) {
		    if (!(date instanceof Date)) date = new Date(date);
		    
		    function _ff(v) {
		        return (v < 10 ? "0" : "") + v;
		    };
		    return _ff(date.getFullYear())+'-'+_ff(date.getMonth()+1)+'-'+ _ff( date.getDate() );
		};
		
		 $.fn.datebox.defaults.parser = function (s) {
		    if ($.trim(s) == "") {
		        return new Date();
		    }

		    var dt = s.split(" ");
		    var p1 = dt[0].split('-');		    

		    return new Date(p1[0],p1[1]-1,p1[2]);
		}; 	
   	</script>
   	
   	<div id="w${_prefix}_content"  class="easyui-window" title="칼럼페이지 컨텐츠" data-options="modal:true ,closed:true" style="width:100%;height:100%;padding:50px 10px 10px;">
    </div>
</body>
</html>