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

	
	<c:set var="webPath" value="http://14.49.36.233:18080/resources/nas" />
	
	
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
									<tbody id="tableBody${_prefix}">
										<tr>
											<th>
												<label for="board_title${_prefix}" class="table_tit">제목</label>
											</th>
											<td colspan="2" style="text-align: left">
												
												<c:choose>
													<c:when test="${boardOptionList[0].tcd_code ne 'BD05'}">
														<input type="text" name="board_title${_prefix}" id="board_title${_prefix}" data-options="missingMessage:'제목은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="제목을 입력해주세요."	style="width: 80%" /> 
													</c:when>
													<c:otherwise>
														<input type="text" name="board_title${_prefix}" id="board_title${_prefix}" data-options="missingMessage:'활동분야는 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="활동분야를 입력해주세요."	style="width: 20%" /> 
														<input type="text" name="board_etc1${_prefix}" id="board_etc1${_prefix}" data-options="missingMessage:'이름은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="이름을 입력해주세요."	style="width: 40%" />
													</c:otherwise>
												</c:choose>
												
												<input type="checkbox" name="board_notice${_prefix}" id="board_notice${_prefix}" value="Y" /> 
												<label>상위처리</label>
												 
											</td>
										</tr>
										<c:if test="${_prefix == 'BD07'}">
											<tr>
												<th><label for="code_board_tmp${_prefix}"
													class="table_tit">URL</label></th>
												<td colspan="2" style="text-align: left">
													<%-- <div id="code_board_tmp${_prefix}" class="m_space10">
														<a href="javascript:void(0)" id="link${_prefix}" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">링크</a>
													</div> --%>
													<input type="text" name="board_url${_prefix}" id="board_url${_prefix}" class="easyui-validatebox" style="width: 45%" /> 
													( '있을 시 영상 없을 시 이미지 / 비메오 유투브 혼용' )
												</td>
											</tr>
										</c:if>
										
										<c:if test="${boardOptionList[0].tcd_attr4 ne 'N'}">
											<tr>
												<th>
													<label for="board_url${_prefix}" class="table_tit">URL</label>
												</th>
												<td colspan="2" style="text-align: left;">
													<input type="text" name="board_url${_prefix}" id="board_url${_prefix}" data-options="missingMessage:'URL입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="URL을 입력해주세요." style="width: 45%" /> 
												</td>
											</tr>
										</c:if>
										
										<c:if test="${boardOptionList[0].tcd_attr2 ne 'N'}">
											<tr>
												<th>
													<label for="board_cate_L${_prefix}" class="table_tit">카테고리</label>
												</th>
												<td colspan="2" style="text-align: left;" class="p_space10">
													<select class="easyui-combobox searchSel" id="board_cate_L${_prefix}" data-prefix="${_prefix}" style="width: 45%;">
													</select> 
													<input type="hidden" id="board_cate_L_val${_prefix}" name="board_cate_L" />
												</td>
											</tr>
										</c:if>
										
										<tr>
											<th>
												<label for="board_reg_date${_prefix}" class="table_tit">등록일</label>
											</th>
											<td style="text-align: left;" class="p_space10">
												<input id="board_reg_date${_prefix}" name="board_reg_date${_prefix}" class="easyui-datebox easyui-validatebox" style="width: 250px">
												<input type="hidden" name="board_reg_date" id="board_reg_date" value=""> 
											</td>
										</tr>
										
										<tr>
											<th><label for="board_mobile${_prefix}"
												class="table_tit">연락처</label></th>
											<td colspan="2" style="text-align: left;"><input
												type="text" name="board_mobile${_prefix}"
												id="board_mobile${_prefix}" class="easyui-validatebox"
												style="width: 45%" /></td>
										</tr>
										
										<c:if test="${boardOptionList[0].tcd_attr1 eq 'Y'}">
											<tr>
												<th>
													<label for="board_show_str_date${_prefix}" class="table_tit">노출기간
												</th>
												<td>
													<div class="period_wrap" style="text-align: left;">
															<input id="board_show_str_date${_prefix}" name="board_show_str_date${_prefix}" class="easyui-datebox easyui-validatebox" style="width: 250px">
															~
															<input id="board_show_end_date${_prefix}" name="board_show_end_date${_prefix}" class="easyui-datebox easyui-validatebox" style="width: 250px"> 
															
															<input type="hidden" name="board_show_str_date" id="board_show_str_date" value=""> 
															<input type="hidden" name="board_show_end_date" id="board_show_end_date" value="">
													</div>
												</td>
											</tr>
										</c:if>
										
										<tr>
											<th>
												<c:choose>
													<c:when test="${boardOptionList[0].tcd_code eq 'BD07'}">
														<label for="board_reg_name${_prefix}" class="table_tit">환자명</label>
													</c:when>
													<c:otherwise>
														<label for="board_reg_name${_prefix}" class="table_tit">작성자</label>
													</c:otherwise>
												</c:choose>
											</th>
											<td colspan="2" style="text-align: left;">
												<input type="text" name="board_reg_name${_prefix}" id="board_reg_name${_prefix}" value="${sessionScope.GRANDADM_MANAGER_NM}" data-options="missingMessage:'작성자입력은 필수 입력값입니다.',required:true" class="easyui-validatebox" placeholder="작성자를 입력해주세요." style="width: 45%" /> 
											</td>
										</tr>
										<c:if test="${_prefix == 'BD17'}">
										<tr>
												<th><label for="board_mobile${_prefix}"
													class="table_tit">연락처</label></th>
												<td colspan="2" style="text-align: left;"><input
													type="text" name="board_mobile${_prefix}"
													id="board_mobile${_prefix}" class="easyui-validatebox"
													style="width: 45%" /></td>
										</tr>
										</c:if>
										
										<c:if test="${boardOptionList[0].tcd_fileYN ne 'N'}">
											<%-- <tr>
												<th><label for="code_board_tmp${_prefix}"
													class="table_tit">파일</label></th>
												<td colspan="2" style="text-align: left">
													<div id="code_board_tmp${_prefix}" class="m_space10">
														<a href="javascript:void(0)" id="board_upload${_prefix}" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">파일 업로드</a>
													</div>
												</td>
											</tr> --%>
											
											<%-- <tr>
												<th><label for="code_board_tmp${_prefix}"
													class="table_tit">파일</label></th>
												<td colspan="2" style="text-align: left">
													<div id="code_board_tmp${_prefix}" class="m_space10">
														<a href="javascript:void(0)" id="board_upload${_prefix}"
															class="easyui-linkbutton"
															data-options="iconCls:'icon-add',plain:true">파일 업로드</a>
													</div>
												</td>
											</tr> --%>
											
											<c:choose>
												<c:when test="${_prefix =='BD07'}">
													<%-- <c:if test="${null ne boardFileList}">
														<c:forEach items="${boardFileList}" var="item" varStatus="status">
															<c:choose>
																<c:when test="${fn:length(boardFileList[0].idx) > 0}">
																	<tr>
																		<th>
																			<label class="table_tit">
																				<c:choose>
																					<c:when test="${status.first}">
																						치료전
																					</c:when>
																					<c:otherwise>
																						치료후
																					</c:otherwise>
																				</c:choose>
																			</label>
																		</th>
																		<td style="text-align: left">
																			<div id="code_board_file${_prefix}" class="p_space10">
																				<div class="inner${_prefix}"></div>
																				<div class='file${item.idx} inner${_prefix}'>
																					<br /> 
																					<c:if test="${null ne boardFileList}">
																						<c:choose>
																							<c:when test="${boardFileList[0].extension ne 'image'}">
																							<span>
																								<a href='/admin/download?fileName=${item.fileName}'>
																									${item.orgName}
																								</a>
																							</span> 
																							</c:when>
																							<c:otherwise>
																							<span class="imgPopup" data-idx ="${item.idx}" style="cursor:pointer">
																								<img src="${item.fileName}" />
																							</span> 
																							</c:otherwise>
																						</c:choose>
																					</c:if>
																					<a href='#' style='width: 100px; margin-bottom: 5px' class='fileDeleteBtnSet' data-file='file${item.idx}'>
																						<div class='btn-x'></div>
																					</a>
																					<input type='hidden' class='file_name_arr${_prefix}' name='file_name${_prefix}' value='${item.fileName}' />
																					<input type='hidden' class='file_original_arr${_prefix}' name='file_original${_prefix}' value='${item.orgName}' />
																				</div>
																
																				<input type="hidden" id="file_name${_prefix}" name="file_name_arr${_prefix}" class="file_name${_prefix}" value="" />
																				<input type="hidden" id="file_original${_prefix}" name="file_original_arr${_prefix}" class="file_name${_prefix}" value="" />
																			</div>
																		</td>
																	</tr>
																</c:when>
															</c:choose>
														</c:forEach>
													</c:if> --%>
												</c:when>
												<c:otherwise>
													<c:if test="${null ne boardFileList}">
														<c:forEach items="${boardFileList}" var="item" varStatus="status">
															<c:choose>
																<c:when test="${fn:length(boardFileList[0].idx) > 0}">
																	<tr>
																		<th><label class="table_tit">첨부파일</label></th>
																		<td style="text-align: left">
																			<div id="code_board_file${_prefix}" class="p_space10">
																				<div class="inner${_prefix}"></div>
																				<div class='file${item.idx} inner${_prefix}'>
																					<br /> 
																					<c:if test="${null ne boardFileList}">
																						<c:choose>
																							<c:when test="${boardFileList[0].extension ne 'image'}">
																							<span>
																								<a href='/admin/download?fileName=${item.fileName}'>
																									${item.orgName}
																								</a>
																							</span> 
																							</c:when>
																							<c:otherwise>
																							<span class="imgPopup" data-idx ="${item.idx}" style="cursor:pointer">
																								${item.orgName}
																							</span> 
																							</c:otherwise>
																						</c:choose>
																					</c:if>
																					<a href='#' style='width: 100px; margin-bottom: 5px' class='fileDeleteBtnSet' data-file='file${item.idx}'>
																						<div class='btn-x'></div>
																					</a>
																					<input type='hidden' class='file_name_arr${_prefix}' name='file_name${_prefix}' value='${item.fileName}' />
																					<input type='hidden' class='file_original_arr${_prefix}' name='file_original${_prefix}' value='${item.orgName}' />
																				</div>
																
																				<input type="hidden" id="file_name${_prefix}" name="file_name_arr${_prefix}" class="file_name${_prefix}" value="" />
																				<input type="hidden" id="file_original${_prefix}" name="file_original_arr${_prefix}" class="file_name${_prefix}" value="" />
																			</div>
																		</td>
																	</tr>
																</c:when>
															</c:choose>
														</c:forEach>
													</c:if>
												</c:otherwise>			
											</c:choose>
										</c:if>
										
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
		<!-- <div data-options="region:'east',title:'업로드',split:false" style="width:432px;">
	    	<div  class="common_file_pannel" style="height:auto;padding:5px;border:0;overflow:hidden"  > 
	    	</div>
	    </div>	 -->   
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp"%>

	<script type="text/javascript">
	
	var $upCategory = "${boardOptionList[0].tcd_attr3}";
	var $bannersub_idx = "${_banner.bannersub_idx}";
	
	
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
					   if(optNum == 0) //웹 치료전
					   {
						   $("#bannersub_webImg").val(filepath + b_filename);
						   $("#bannersub_webImgfilekey").val(filekey);
					   }
					   if(optNum == 1) //웹 치료후
					   {
						   $("#bannersub_etcImg").val(filepath + b_filename);
						   $("#bannersub_etcImgfilekey").val(filekey);
					   }
					   if(optNum == 2) //모바일 치료전
					   {
						   $("#bannersub_spareImg").val(filepath + b_filename);
						   $("#bannersub_spareImgfilekey").val(filekey);
					   }
					   if(optNum == 3) //모바일 치료후
					   {
						   $("#bannersub_spareImg").val(filepath + b_filename);
						   $("#bannersub_spareImgfilekey").val(filekey);
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
								 $(this).next().next().text("웹 치료전");
								 $("#bannersub_webImg").val("");
								 $("#bannersub_webImgfilekey").val("");
							 }
							 else if($(this).next().data("index") == 1){
								 $(this).next().next().text("웹 치료후");
								 $("#bannersub_etcImg").val("");
								 $("#bannersub_etcImgfilekey").val("");
							 }
							 else if($(this).next().data("index") == 2){
								 $(this).next().next().text("모바일 치료전");
								 $("#bannersub_etcImg").val("");
								 $("#bannersub_etcImgfilekey").val("");
							 }
							 else{
								 $(this).next().next().text("모바일 치료후");
								 $("#bannersub_spareImg").val("");
								 $("#bannersub_spareImgfilekey").val("");
							 }
						 
					  });		               
		        }    				
   			});   	
			
			
			var $index = "${_board.board_idx}";

			fnCommonCodeSearch("board_cate_L${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>", null);

			$(".imgPopup").off("click");
			$(".imgPopup").on("click", function(){
				var idx = $(this).data("idx");
				winPopUPCenter("/admin/imgPopup?${_csrf.parameterName}=${_csrf.token}&idx=" + idx , "img", 1, 1, "yes", "yes");
				
			});

			$(".fileDeleteBtnSet").off("click").on("click", function(){
  				$(this).closest('tr').remove();
			});
			
			$("#link${_prefix}").off("click").on("click",function(){
				
			});
   				
			if ( $index != 0)
			{
				setTimeout(function(){
					
					$('#ff${_prefix}').form({
						onLoadSuccess:function(data){
							
							$("#board_url${_prefix}").val(data.rows[0].board_url);		   								
							$("#board_title${_prefix}").val(data.rows[0].board_title);
							$("#board_cnt${_prefix}").val(data.rows[0].board_cnt);
							$("#board_reg_name${_prefix}").val(data.rows[0].board_reg_name);
							$("#board_mobile${_prefix}").val(data.rows[0].board_mobile);
							$("#board_detail${_prefix}").val(data.rows[0].board_detail);
							$("#board_reply${_prefix}").val(data.rows[0].board_reply);
							
							
							var divideImg = data.rows[0].save_file.split('|');
							for(var i =0;i<divideImg.length;i++){
								var targetNum = i+1;
								if(divideImg[i] !=null && divideImg[i] !=''){
									if(divideImg[i].indexOf("http") > -1 && divideImg[i].indexOf("sample")){
										$("#target0"+targetNum+"${_prefix}").find("img").attr("src",divideImg[i]);
									}else{
										$("#target0"+targetNum+"${_prefix}").find("img").attr("src",""+divideImg[i]);
									}
								}else{
									$("#target0"+targetNum+"${_prefix}").find("img").attr("src","/admin/img/img_sample.jpg");
								}
								
							}
							
							$('#board_reg_date${_prefix}').datebox({
								value: data.rows[0].board_reg_date
							});
							
							
							if(data.rows[0].board_notice == "Y")
							{
								$("input:checkbox[id='board_notice${_prefix}']").attr("checked" , true);
							}
							
							<c:if test="${boardOptionList[0].tcd_code eq 'BD05'}">
								$("#board_etc1${_prefix}").val(data.rows[0].board_etc1);
							</c:if>
								
							<c:if test="${boardOptionList[0].tcd_code eq 'BD13'}">
								$("#board_etc1${_prefix}").val(data.rows[0].board_etc1);
							</c:if>
							
							if(data.rows[0].board_cate_L != "")
							{
								$('#board_cate_L${_prefix}').combobox('setText',data.rows[0].board_cate_L);
								$("#board_cate_L_val${_prefix}").val(data.rows[0].tcd_code);
							}
							
							/* 마이그레이션 데이터의 이미지path가 존재할 경우 */
							if (data.rows[0].save_file != null && data.rows[0].save_file != '') {
								
								$("#save_file${_prefix}").val(data.rows[0].save_file);
								
								var save_file = data.rows[0].save_file;
								var fileArr	  = save_file.split("|");
								
								var splitUrl 			= "";
								var nArLength	 	= "";
								var arFileName	 = "";
								
								$(".mig_file").show();
								
								console.log("fileArr.length >> " + fileArr.length);
								
								if ( fileArr.length > 1 ) {
									
									for ( var i = 0; i < fileArr.length; i++ ) {
										
										splitUrl 			= fileArr[i].split("|");
										nArLength	 = splitUrl.length;
										arFileName	= splitUrl[nArLength-1];
										
										if( fileArr[i] != null && fileArr[i] != '') {
											
											var basePath ="";
	   										if(fileArr[i].indexOf("/_date")){
	   											basePath = "";
	   										}
											
											var rhtml = '';
											rhtml += '<tr>';
											
											<c:choose>
												<c:when test="${boardOptionList[0].tcd_code eq 'BD07'}">
													if( i == 0 ) {
														rhtml += '	<th><label class="table_tit">치료전</label></th>';												
													}
													if( i == 1 ) {
														rhtml += '	<th><label class="table_tit">치료후</label></th>';
													}
													rhtml += '	<td style="text-align: left">';
													rhtml += '		<div><br/>';
													rhtml += '			<span class="migImgPopup" data-filepath="'+fileArr[i]+'" style="cursor:pointer">'+arFileName+'</span>';		   										  
													rhtml += '			<a href="#" style="width: 100px; margin-bottom: 5px" class="migFileDeleteBtnSet">';
													rhtml += '				<div class="btn-x"></div>';
													rhtml += '			</a>';
													rhtml += '		</div>';
													rhtml += '	</td>';
												</c:when>
												<c:otherwise>	 
													rhtml += '	<th><label class="table_tit">첨부파일 #'+i+'</label></th>';
													rhtml += '	<td style="text-align: left">';
													rhtml += '		<div><br/>';
													rhtml += '			<span class="migImgPopup" data-filepath="'+fileArr[i]+'" style="cursor:pointer">'+arFileName+'</span>';		   										  
													rhtml += '			<a href="#" style="width: 100px; margin-bottom: 5px" class="migFileDeleteBtnSet">';
													rhtml += '				<div class="btn-x"></div>';
													rhtml += '			</a>';
													rhtml += '		</div>';
													rhtml += '	</td>';
												</c:otherwise>
											</c:choose>
											
											rhtml += '</tr>';
											
											$("#tableBody${_prefix}").append(rhtml);
											
										}
									
									};
									
								} else {
									
								splitUrl 			= data.rows[0].save_file.split("/");
								nArLength	 = splitUrl.length;
								arFileName	= splitUrl[nArLength-1];
								
								var html = '';
										html += '<tr>';
										html += '	<td colspan="2" style="text-align: left">';
										html += '		<div><br/>';
										html += '			<span class="migImgPopup" data-filepath="'+data.rows[0].save_file+'" style="cursor:pointer">'+arFileName+'</span>';		   										  
										html += '			<a href="#" style="width: 100px; margin-bottom: 5px" class="migFileDeleteBtnSet">';
										html += '				<div class="btn-x"></div>';
										html += '			</a>';
										html += '		</div>';
										html += '	</td>';
										html += '</tr>';
																				
								$("#tableBody${_prefix}").append(html);
								
							}
								
							$(".migImgPopup").off("click").on("click", function(){
								var filePath = $(this).data("filepath");
								
								winPopUPCenter("/admin/migImgPopup?${_csrf.parameterName}=${_csrf.token}&filePath=" + filePath , "img", 1, 1, "yes", "yes");
								
							});
							
							$(".migFileDeleteBtnSet").off("click").on("click", function(){
								
								var $parent = $(this).closest("tr");							   					
								$parent.remove();
								
								var filepath = "";
								
								if( $(".migImgPopup").length > 0 ) {
									
									$(".migImgPopup").each(function(index) {
										
										if( index > 0 ) {
											filepath += '|';
										}
										
										filepath += $(this).data("filepath");
									});
									
									$("#save_file${_prefix}").val(filepath);
								} else {
									$("#save_file${_prefix}").val('');
								}
							});
							}		
																	
							<c:if test="${boardOptionList[0].tcd_attr1 eq 'Y'}">
							
								$('#board_show_str_date${_prefix}').datebox({
									value: data.rows[0].board_show_str_date
								});
								
								$('#board_show_end_date${_prefix}').datebox({
									value: data.rows[0].board_show_end_date
								});
							  
								setTimeout(function(){
								$("#board_show_str_date${_prefix}").next("span").find("input").prop("readonly", true);
							},500);  
						</c:if>
							<c:if test="${_prefix != 'BD17'}">					
							$('input:radio[name=board_show${_prefix}]:input[value=' + data.rows[0].board_show + ']').attr("checked", true);
							</c:if>
						 }
					});
					
					$('#ff${_prefix}').form('load', '/admin/interface/selectBoard/${menu_code}?board_idx=' + $index );		   						
				},500);
			}

			var editIndex 		= undefined;	//그리드 에디트를 위한 전역변수
			var cateCode 		= "${boardOptionList[0].tcd_attr3}";	// 각자 맞는 카데고리 설정 코드 (예) notice)
			var fileExt  		= "<spring:message code='${boardOptionList[0].tcd_attr3}'  ></spring:message>".split("@")[0];		// 해당 카데고리의 파일 확장자
			var fileSize 		= "<spring:message code='${boardOptionList[0].tcd_attr3}'  ></spring:message>".split("@")[1] +'mb';	// 해당 카데고리의 파일 사이즈
			
			$meplzUploader.init({
				parameter : {
					"groupCode" : ''					,
					"cateCode" 	: cateCode							
				} 
				, dropBool : true
				, multiSelect : true
				, dropBox  : "board_upload${_prefix}"
				, uploadStartButton : "board_upload${_prefix}"
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
					if("${_prefix} =='BD07' || ${_prefix} =='BD13'"){
						if($(".fileDeleteBtnSet").length >=2){
		   					return ;
		   				}
					}
					if(svrResponse.flag == "N") 
					{
						alert("서버오류로 인해 파일 업로드가 실패하였습니다.");
					}
					else
					{
						
						var html = "";
						var d = new Date();
						var cls = d.getMinutes().toString() + d.getSeconds().toString();
						
						if("${_prefix} =='BD07' || ${_prefix} =='BD13'"){
	   						html += '<tr id="tr">';
	   					}else{
	   						html += '<tr>';
	   					}
						if("${_prefix} =='BD07' || ${_prefix} =='BD13'"){
	   						if($(".table_tit").text().match("치료전") !=null && $(".table_tit").text().match("치료전") !=''){
	   							html += "<th><label class='table_tit' style='text-align: left'>치료후</label></th>";
	   						}else{
	   							html += "<th><label class='table_tit' style='text-align: left'>치료전</label></th>";
	   						}
						}else{
							html += "<th><label class='table_tit' style='text-align: left'>첨부파일</label></th>";
						}
						html += "<td style='text-align: left'>"
						html += "<div class='file"+cls+" inner${_prefix}'> ";
						html += "   <br/> ";
						html += "	<span class='fontFamily p_space10'>"+svrResponse.original+"</span> ";
						html += "	<a href='#' style='width:100px;margin-bottom:5px' class='fileDeleteBtnSet' data-file='file"+cls+"' > ";
						html += "		<div class='btn-x'></div>";
						html += "	</a> ";
						html += "   <input type='hidden' class='file_name_arr${_prefix}' name='file_name${_prefix}' value='"+svrResponse.file_name+"' />";
						html += "   <input type='hidden' class='file_original_arr${_prefix}' name='file_original${_prefix}' value='"+svrResponse.original+"' />";
						html += "</div> ";
						html += "</td>";
						html += '</tr>';
						
						if($(".table_tit").text().match("치료후") !=null && $(".table_tit").text().match("치료후") !=''){
							$("#tr").before(html);
   						}else{
   							$("#tableBody${_prefix}").append(html);
   						}
	   										
		   				$(".fileDeleteBtnSet").off("click").on("click", function(){
		   					$(this).closest('tr').remove();
		   				});
					}	 		
				}
			});

			$("#saveBtn${_prefix}").off("click").on("click", function(){
																
				var board_title = "";
				
				<c:choose>
					<c:when test="${boardOptionList[0].tcd_code ne 'BD05'}">
						if($("#board_title${_prefix}").val() == "") {
							$("#board_title${_prefix}").focus();
							alert("제목을 입력해주세요.");
							return false;
						}
						board_title = $("#board_title${_prefix}").val();
					</c:when>
					<c:otherwise>
						if($("#board_title${_prefix}").val() == "") {							
							alert("활동분야를 입력해주세요.");
							$("#board_title${_prefix}").focus();
							return false;
						}
						
						if($("#board_etc1${_prefix}").val() == "") {							
							alert("이름을 입력해주세요.");
							$("#board_etc1${_prefix}").focus();
							return false;
						}
						board_title = $("#board_title${_prefix}").val();						
					</c:otherwise>
				</c:choose>
				
				var board_show = $("input[type=radio][name=board_show${_prefix}]:checked").val();
				
				var board_cate_L = "";
				<c:if test="${boardOptionList[0].tcd_attr2 ne 'N'}">
					if($('#board_cate_L${_prefix}').combobox('getValue') == "" && $("#board_cate_L_val${_prefix}").val() == "") {
						$("#board_cate_L${_prefix}").focus();
						alert("카테고리를 선택해주세요.");
						return false;
					} else {
						
						if($('#board_cate_L${_prefix}').combobox('getValue') != "")
							{
								board_cate_L = $('#board_cate_L${_prefix}').combobox('getValue');
							} else {
								board_cate_L = $("#board_cate_L_val${_prefix}").val();
							}
					}
				</c:if>
				
				var board_reg_date = "";
				var format = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
				var regDate = $("#board_reg_date${_prefix}").val().split(" ")[0];
				
				if(regDate == "") {					
					alert("등록일을 입력해주세요.");
					return false;
				} else {
					if(!format.test(regDate)) {
						alert("달력을 이용하여 날짜를 입력해주세요.");
						return false;
					}
				}
				
				board_reg_date = $("#board_reg_date${_prefix}").val();

				var board_show_str_date = "";
   				var board_show_end_date = "";
   				
				<c:if test="${boardOptionList[0].tcd_attr1 eq 'Y'}">
					var format = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
					var str = $("#board_show_str_date${_prefix}").val().split(" ")[0];
					var end = $("#board_show_end_date${_prefix}").val().split(" ")[0];
					
					if(str == "")
					{
						alert("달력을 선택해주세요");
						return false;
					} else {
						if(!format.test(str)) {
							alert("달력을 이용하여 날짜를 입력해주세요.");
							return false;
						}
					}
					
					var strArr = str.split('-');
					var endArr = end.split('-');
					var strCompare = new Date(strArr[0], parseInt(strArr[1])-1, strArr[2]);
					var endCompare = new Date(endArr[0], parseInt(endArr[1])-1, endArr[2]);
					
					if(strCompare.getTime() > endCompare.getTime()) {
						
						alert("시작날짜와 종료날짜를 확인해 주세요.");
						return false;
					}
	   				
	   				board_show_str_date = $("#board_show_str_date${_prefix}").val();
	   				board_show_end_date = $("#board_show_end_date${_prefix}").val();
					
	   				
	   				var str = $("#board_show_str_date${_prefix}").val().split(" ")[0];
					var strArr = str.split('-');
					var strCompare = new Date(strArr[0], parseInt(strArr[1]), strArr[2]);

				</c:if>
								
				var board_notice = "N";
				
				if($("#board_notice${_prefix}").is(":checked") == true)
				{
					board_notice = "Y";
				}
				
				var file_name_arr = "";
   				var file_original_arr = "";
   				$(".file_name_arr${_prefix}").each(function(index) {
   					file_name_arr = file_name_arr + $(".file_name_arr${_prefix}").eq(index).val() + ",";
   					file_original_arr = file_original_arr + $(".file_original_arr${_prefix}").eq(index).val() + ",";
				});
   				
   				if(file_name_arr != "")
				{
   					file_name_arr = file_name_arr.substring(0,file_name_arr.length-1)
   					file_original_arr = file_original_arr.substring(0,file_original_arr.length-1)
				}
   				
   				var img0 = null;
   				var img1 = null;
   				var img2 = null;
   				var img3 = null;
   				
   				/* if(${_prefix !='BD17'}){
	   				img0 = $(".img${_prefix}:eq(0)").find("img").attr("src");
	   				if( img0.indexOf("img_sample.jpg") > -1 ) {
	   					img0 = "";
	   				}
	   				img1 = $(".img${_prefix}:eq(1)").find("img").attr("src");
	   				if( img1.indexOf("img_sample.jpg") > -1 ) {
	   					img1 = "";
	   				}
	   				img2 = $(".img${_prefix}:eq(2)").find("img").attr("src");
	   				if( img2.indexOf("img_sample.jpg") > -1 ) {
	   					img2 = "";
	   				}
	   				img3 = $(".img${_prefix}:eq(3)").find("img").attr("src");
	   				if( img3.indexOf("img_sample.jpg") > -1 ) {
	   					img3 = "";
	   				}
   				} */
   				
				var param = {};
				param.Board_idx = $index;
				param.board_menu_code = "${_prefix}";
				param.board_notice = board_notice;
				param.board_title = board_title;
				param.board_cate_L = board_cate_L;
				param.board_show_str_date = board_show_str_date;
				param.board_show_end_date = board_show_end_date;
				param.board_show = board_show;
				param.board_upload_drop = $("#board_upload_drop${_prefix}").val();
				param.tcd_attr3 = "<c:out value="${boardOptionList[0].tcd_attr3}" default="Korea" escapeXml="true"/>"
				param.file_name_arr = file_name_arr;
				param.file_original_arr = file_original_arr;
				param.save_file = img0 +"|"+  img1 +"|"+ img2 +"|"+ img3; //$("#save_file${_prefix}").val();
				param.board_etc1 = $("#board_etc1${_prefix}").val();
				param.board_cnt = $("#board_cnt${_prefix}").val();
				param.board_etc1 = $("#board_etc1${_prefix}").val();
				param.board_etc2 = $("#board_etc2${_prefix}").val();
				param.board_etc4 = $("#board_etc4${_prefix}").val();
				param.board_etc5 = $("#board_etc5${_prefix}").val();
				param.board_etc6 = $("#board_etc6${_prefix}").val();
				param.board_etc7 = $("#board_etc7${_prefix}").val();
				param.board_etc8 = $("#board_etc8${_prefix}").val();
				//param.board_etc9 = $("#target01 >img").attr("src")+"|"+$("#target02 >img").attr("src");
				param.board_reg_name = $("#board_reg_name${_prefix}").val();
				
				/* if(${_prefix !="BD05" && _prefix !="BD17"}){
					if($("#board_url${_prefix}").val().match("youtu.be") !=null && $("#board_url${_prefix}").val().match("youtu.be") !=''){
						param.board_url = $("#board_urlBD07").val().replace("youtu.be","www.youtube.com/embed");
					}else{
						param.board_url = $("#board_url${_prefix}").val();
					}
				} */
				
				
				param.board_reg_date = board_reg_date;
				
				$.ajax({  
					   url	  		 : '/admin/board/insertBoard'
					  ,data 			 : param
					  ,type				 : "POST"
					  ,dataType 		 : "json"
					  ,success  : function(data) {
						  console.log('${_prefix}');
						  if(${_prefix == 'BD08' || _prefix == 'BD11' || _prefix == 'BD12' || _prefix == 'BD16' || _prefix == 'BD17'}){
		            		  parent.boardReload('BDMNG');
		            	  }else{
		            		  parent.boardReload('${_prefix}');
		            	  }
					  }
				});
				
				return false;
			}); 
			 
			$(".deleteBtn${_prefix}").off("click");
			$(".deleteBtn${_prefix}").on("click", function(){
				if(confirm("삭제하시겠습니까?")) {
					var param = {};
					param.Board_idx = "${_board.board_idx}";

					$.ajax({  
						   url	  		 : '/admin/board/deleteBoard'
						  ,data 			 : param
						  ,type				 : "POST"
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
			
			function fnCommonCodeSearch(appendId, code, level) {
				var treePrm = {};
				treePrm.search_master = code;
				treePrm.tcd_useyn = "Y";
				if(level != null) {
					treePrm.search_level = level;
				}
				$.ajax({  
					   url	  		 : "/admin/interface/selectCodeDetail"
					  ,data 			 : treePrm
					  ,type				 : "POST"
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
		});

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
</body>
</html>