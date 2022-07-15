<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>
</head>
<body id="boardRegForm${_prefix}" style="background-color: #fff">

<c:set var="webPath" value="http://localhost:8080/imgpath" />
	<div id="boardBodys" class="easyui-layout"
		style="width: 100%; height: 100%;">
		<div data-options="region:'center',title:''" style="padding: 5px;">
			<div id="board_pannel"
				style="height: auto; padding: 5px; border: 0; overflow-x: hidden">
				<div class="article_box_wrap cf" style="text-align: center">
					<div class="article_box article_box_left">
						<form id="ff${_prefix}" name="ff${_prefix}" method="post"
							onsubmit="return false;">
							<input type="hidden" name="board_menu_code" id="board_menu_code"
								value="${_prefix}"> <input type="hidden"
								id="board_upload_drop${_prefix}" name="board_upload_drop" /> <input
								type="hidden" id="save_file${_prefix}"
								name="save_file${_prefix}" value="" />

							<div class="" style="background-color: #fff">
								<table class="table_st01">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody id="tableBody${_prefix}">
										<%-- <tr>
											<th><label class="table_tit">유입경로</label></th>
											<td colspan="2" style="text-align: left;">
												<textarea name="utm_path${_prefix}" class="utm_path${_prefix}" style="width:100%;height:50px"></textarea> 
											</td>
										</tr>
										<tr>
											<th><label for="board_reg_date${_prefix}"
												class="table_tit">상담요청시간</label></th>
											<td colspan="2" style="text-align: left;"><input
												type="text" name="board_reg_date${_prefix}"
												id="board_reg_date${_prefix}" class="easyui-validatebox"
												style="width: 45%" /></td>
										</tr> --%>
										<tr>
											<th><label for="board_title${_prefix}" class="table_tit">제목</label>
											</th>
											<td colspan="2" style="text-align: left">
												<input type="text" name="board_title${_prefix}"
													id="board_title${_prefix}"
													data-options="missingMessage:'제목은 필수 입력값입니다.',required:true"
													class="easyui-validatebox" placeholder="제목을 입력해주세요."
													style="width:70%; margin-top:10px;" />

												<div>
													<input type="checkbox" name="board_notice${_prefix}" id="board_notice${_prefix}" value="Y" /> <label>상위처리</label>
													<span>&nbsp;&nbsp;|&nbsp;&nbsp;노출 순위 설정(상위처리를 체크할 경우, 우선순위가 제일 높음) <input type="text" id="board_etc10${_prefix}" class="easyui-validatebox" style="width:10%; height:30px;" placeholder="숫자입력"></span>
												</div>
											</td>
										</tr>
										<c:if test="${_prefix eq 'PU01'}">
											<tr>
												<th><span class="table_tit">제목 색상</span></th>
												<td colspan="2" style="text-align: left">
													<ul class="radio_wrap radio_st01">
														<li><label> <input type="radio"
																name="board_etc1${_prefix}" value="b" checked> <span
																class="icon_radio">black</span>
														</label></li>
														<li><label> <input type="radio"
																name="board_etc1${_prefix}" value="w"> <span
																class="icon_radio">white</span>
														</label></li>
													</ul>
												</td>
											</tr>
										</c:if>
										<c:if test="${boardOptionList[0].tcd_attr4 ne 'N'}">
											<tr>
												<th><label for="board_url${_prefix}" class="table_tit">URL</label>
												</th>
												<td colspan="2" style="text-align: left;"><input
													type="text" name="board_url${_prefix}"
													id="board_url${_prefix}"
													data-options="missingMessage:'URL입력은 필수 입력값입니다.',required:true"
													class="easyui-validatebox" placeholder="URL을 입력해주세요."
													style="width: 80%" /></td>
											</tr>
										</c:if>
										<c:if test="${boardOptionList[0].tcd_attr2 ne 'N'}">
											<tr>
												<th><label for="board_cate_L${_prefix}"
													class="table_tit">카테고리</label></th>
												<td colspan="2" style="text-align: left;" class="p_space10">
													<select class="easyui-combobox searchSel"
													id="board_cate_L${_prefix}" data-prefix="${_prefix}"
													style="width: 45%;">
												</select> 
												<input type="hidden" id="board_cate_L_val${_prefix}"
													name="board_cate_L" /> 
												</td>
											</tr>
										</c:if>
										<c:if test="${boardOptionList[0].tcd_code == 'BD04'}">
										<tr>
											<th><label for="board_cate_M${_prefix}"
												class="table_tit">신청시간</label></th>
											<td colspan="2" style="text-align: left;" class="p_space10">
												<select class="easyui-combobox searchSel"
												id="board_cate_M${_prefix}" data-prefix="${_prefix}"
												style="width: 45%;">
											</select> 
											</td>
										</tr>
										<%-- <tr>
											<th><span class="table_tit">비밀글</span></th>
											<td colspan="2" style="text-align: left">
												<ul class="radio_wrap radio_st01">
													<li><label> <input type="radio"
															name="board_secret${_prefix}" value="Y" checked> <span
															class="icon_radio">잠금</span>
													</label></li>
													<li><label> <input type="radio"
															name="board_secret${_prefix}" value="N"> <span
															class="icon_radio">풀림</span>
													</label></li>
												</ul>
											</td>
										</tr> --%>
										</c:if>
										<tr>
											<th><label for="board_reg_date${_prefix}"
												class="table_tit">등록일</label></th>
											<td style="text-align: left;" class="p_space10"><input
												id="board_reg_date${_prefix}"
												name="board_reg_date${_prefix}"
												class="easyui-datebox easyui-validatebox"
												style="width: 250px"> <input type="hidden"
												name="board_reg_date" id="board_reg_date" value="">
											</td> 
										</tr>

										<c:if test="${boardOptionList[0].tcd_attr1 eq 'Y'}">
											<tr>
												<th><label for="board_show_str_date${_prefix}"
													class="table_tit">노출기간 </th>
												<td>
													<div class="period_wrap" style="text-align: left;">
														<input id="board_show_str_date${_prefix}"
															name="board_show_str_date${_prefix}"
															class="easyui-datebox easyui-validatebox"
															style="width: 250px"> ~ <input
															id="board_show_end_date${_prefix}"
															name="board_show_end_date${_prefix}"
															class="easyui-datebox easyui-validatebox"
															style="width: 250px"> <input type="hidden"
															name="board_show_str_date" id="board_show_str_date"
															value=""> <input type="hidden"
															name="board_show_end_date" id="board_show_end_date"
															value="">
													</div>
												</td>
											</tr>
										</c:if>
										<tr>
											<th>
												<label for="board_reg_name${_prefix}" class="table_tit">작성자</label>
											</th>
											<td colspan="2" style="text-align: left;"><input
												type="text" name="board_reg_name${_prefix}"
												id="board_reg_name${_prefix}"
												value="${sessionScope.GRANDADM_MANAGER_NM}"
												data-options="missingMessage:'작성자입력은 필수 입력값입니다.',required:true"
												class="easyui-validatebox" placeholder="작성자를 입력해주세요."
												style="width: 45%" />
											</td>
										</tr>
										<c:if test="${_prefix eq 'BD04' or _prefix eq 'BD05'}">
											<tr>
												<th><label for="board_mobile${_prefix}"
													class="table_tit">연락처</label>
												</th>
												<td colspan="2" style="text-align: left;"><input
													type="text" name="board_mobile${_prefix}"
													id="board_mobile${_prefix}" class="easyui-validatebox"
													style="width: 45%" />
												</td>
											</tr>
										</c:if>
										<%-- 상담 영역 노출  begin --%>
										<c:if test="${boardOptionList[0].tcd_code eq 'BD11'}">
											<tr>
												<th><label class="table_tit">유입경로</label></th>
												<td colspan="2" style="text-align: left;">
													<textarea name="utm_path${_prefix}" class="utm_path${_prefix}" style="width:100%;height:50px"></textarea> 
												</td>
											</tr>
											<c:if test="${boardOptionList[0].tcd_code eq 'BD08'}">
												<tr>
													<th><label for="board_secret${_prefix}"
														class="table_tit">공개여부</label></th>
													<td colspan="2" style="text-align: left;"><input
														type="radio" name="board_secret${_prefix}"
														id="board_secret${_prefix}" class="easyui-validatebox"
														style="width: 5%" value="Y" />비공개
														<input
														type="radio" name="board_secret${_prefix}"
														id="board_secret${_prefix}" class="easyui-validatebox"
														style="width: 5%" value="N" />공개
													</td>
												</tr>
												<tr>
													<th><label for="reply_yn${_prefix}" class="table_tit">답변여부</label>
													</th>
													<td colspan="2" style="text-align: left;"><input
														type="text" name="reply_yn${_prefix}"
														id="reply_yn${_prefix}" class="easyui-validatebox"
														style="width: 45%" style="board:none !important" readonly />
													</td>
												</tr>
											</c:if>
										</c:if>
										<c:if test="${boardOptionList[0].tcd_code eq 'BD06'}">
											<tr>
												<th><label for="board_etc1${_prefix}"
													class="table_tit">베스트여부</label></th>
												<td colspan="2" style="text-align: left;"><input
													type="radio" name="board_secret${_prefix}"
													id="board_etc1${_prefix}" class="easyui-validatebox"
													style="width: 5%" value="N" />일반
													<input
													type="radio" name="board_secret${_prefix}"
													id="board_etc1${_prefix}" class="easyui-validatebox"
													style="width: 5%" value="Y" />베스트
												</td>
											</tr>
											<tr>
												<th><label for="board_etc2${_prefix}" class="table_tit">고객 이름</label>
												</th>
												<td colspan="2" style="text-align: left;"><input
													type="text" name="board_etc2${_prefix}"
													id="board_etc2${_prefix}" class="easyui-validatebox"
													style="width: 45%" /></td>
											</tr>
											<tr>
												<th><label for="board_etc3${_prefix}" class="table_tit">고객 나이</label>
												</th>
												<td colspan="2" style="text-align: left;"><input
													type="text" name="board_etc3${_prefix}"
													id="board_etc3${_prefix}" class="easyui-validatebox"
													style="width: 45%" /></td>
											</tr>
										</c:if>
										
										<c:if test="${boardOptionList[0].tcd_code eq 'BD05'}">
											<tr>
												<th><label for="board_etc2${_prefix}" class="table_tit">예약 시간</label>
												</th>
												<td colspan="2" style="text-align: left;"><input
													type="text" name="board_etc2${_prefix}"
													id="board_etc2${_prefix}" class="easyui-validatebox"
													style="width: 45%" /></td>
											</tr>
										</c:if>
										
										<%-- 상담 영역 노출 end --%>

										<%-- <tr>
											<th><label for="board_mobile${_prefix}"
												class="table_tit">연락처</label></th>
											<td colspan="2" style="text-align: left;"><input
												type="text" name="board_mobile${_prefix}"
												id="board_mobile${_prefix}" class="easyui-validatebox"
												style="width: 45%" /></td>
										</tr>
										<tr>
											<th><label for="board_etc1${_prefix}" class="table_tit">성별</label>
											</th>
											<td colspan="2" style="text-align: left;"><input
												type="text" name="board_etc1${_prefix}"
												id="board_etc1${_prefix}" class="easyui-validatebox"
												style="width: 45%" /></td>
										</tr>
										<tr>
											<th><label for="board_etc2${_prefix}" class="table_tit">나이</label>
											</th>
											<td colspan="2" style="text-align: left;"><input
												type="text" name="board_etc2${_prefix}"
												id="board_etc2${_prefix}" class="easyui-validatebox"
												style="width: 45%" /></td>
										</tr> --%>
										
										<c:if test="${boardOptionList[0].tcd_code eq 'BD04'}">
										<tr>
											<th><span class="table_tit">답변여부</span></th>
											<td colspan="2" style="text-align: left">
												<ul class="radio_wrap radio_st01">
													<li><label> <input type="radio"
															name="board_etc1${_prefix}" value="Y" checked> <span
															class="icon_radio">답변완료</span>
													</label></li>
													<li><label> <input type="radio"
															name="board_etc1${_prefix}" value="N"> <span
															class="icon_radio">답변대기</span>
													</label></li>
												</ul>
											</td>
										</tr>
										</c:if>
										<tr>
											<th><span class="table_tit">게시여부</span></th>
											<td colspan="2" style="text-align: left">
												<ul class="radio_wrap radio_st01">
													<li><label> <input type="radio"
															name="board_show${_prefix}" value="Y" checked> <span
															class="icon_radio">사용</span>
													</label></li>
													<li><label> <input type="radio"
															name="board_show${_prefix}" value="N"> <span
															class="icon_radio">사용안함</span>
													</label></li>
												</ul>
											</td>
										</tr>
										<c:if test="${_prefix eq 'PU01' or _prefix eq 'BD09'}">
											<tr>
												<th><label for="board_url${_prefix}" class="table_tit">링크</label></th>
												<td colspan="2" style="text-align: left">
													<input type="text" name="board_url${_prefix}"
														id="board_url${_prefix}"
														class="easyui-validatebox" placeholder="URL을 입력해주세요."
														style="width: 45%" />
												</td>
											</tr>
										</c:if>
										<th>
											<label for="board_cnt${_prefix}" class="table_tit">조회수</label>
											</th>
											<td style="text-align: left"><input type="text" disabled="disabled"
												name="board_cnt${_prefix}" id="board_cnt${_prefix}"
												class="easyui-validatebox" style="width: 10%" />
											</td>
										</tr>
										<tr>
											<th colspan="2"><label for="" class="table_tit"
												style="max-width: 720px;">상세내용</label></th>
										</tr>
										<tr>
											<td colspan="2"><textarea
													name="board_detail${_prefix}" id="board_detail${_prefix}"
													rows="10" cols="100"
													style='width: 100%; min-width: 260px; height: 15em; display: block;'></textarea>
											</td>
										</tr>
										<tr>
											<th colspan="2"><label for="" class="table_tit"
												style="max-width: 720px;">메모</label></th>
										</tr>
										<tr>
											<td colspan="2"><textarea
													name="board_memory${_prefix}" id="board_memory${_prefix}"
													rows="10" cols="100"
													style='width: 100%; min-width: 260px; height: 15em; display: block;'></textarea>
											</td>
										</tr>
										
										<tr class="board_reply${_prefix}" style="display: none;">
											<th colspan="2"><label for="board_reply"
												class="table_tit" style="max-width: 720px;">답변내용</label></th>
										</tr>
										<tr class="board_reply${_prefix}" style="display: none;">
											<td colspan="2"><textarea name="board_reply${_prefix}"
													id="board_reply${_prefix}" rows="10" cols="100"
													style='width: 100%; min-width: 260px; height: 15em; display: block;'></textarea>
											</td>
										</tr>

										<c:if test="${boardOptionList[0].tcd_attr6 eq 'Y'}">
											<tr>
												<th colspan="2"><span class="table_tit">이미지등록</span></th>
											</tr>
											<tr>
												<td colspan="2">
													<div class="img_register_wrap img_register_01">
														<ul class="cfs">
															<li style="width:34%;">
																<a href="#" class="easyui-linkbutton imgdel" data-options="plain:true,iconCls:'icon-cancel'" style="width:50px;display:none;position: absolute;left: 90%;z-index:1"></a>
																<div class="easyui-droppable targetarea targetDropBox img${_prefix}" id="target01${_prefix}" data-index="0">
																	<img src="/admin/img/img_sample.jpg" alt="1">
																</div>
																<span class="img_txt" id="target01${_prefix}_text">썸네일</span>
															</li>
															<li style="width:34%;">
																<a href="#" class="easyui-linkbutton imgdel" data-options="plain:true,iconCls:'icon-cancel'" style="width:50px;display:none;position: absolute;left: 90%;z-index:1"></a>
																<div class="easyui-droppable targetarea targetDropBox img${_prefix}" id="target02${_prefix}" data-index="0">
																	<img src="/admin/img/img_sample.jpg" alt="1">
																</div>
																<span class="img_txt" id="target02${_prefix}_text">썸네일</span>
															</li>
														</ul>
													</div>
												</td>
											</tr>
											
											<c:if test="${null ne boardFileList}">
												<c:forEach items="${boardFileList}" var="item"
													varStatus="status">
													<c:choose>
														<c:when test="${fn:length(boardFileList[0].idx) > 0}">
															<tr>
																<th><label class="table_tit">첨부파일</label></th>
																<td style="text-align: left">
																	<div id="code_board_file${_prefix}">
																		<div class="inner${_prefix}"></div>
																		<div class='file${item.idx} inner${_prefix}'>
																			<br />
																			<c:if test="${null ne boardFileList}">
																				<c:choose>
																					<c:when
																						test="${boardFileList[0].extension ne 'image'}">
																						<span> <a
																							href='/admin/download?fileName=${item.fileName}'>
																								${item.orgName} </a>
																						</span>
																					</c:when>
																					<c:otherwise>
																						<span class="imgPopup" data-idx="${item.idx}" style="cursor: pointer"><img src="${webPath}/${item.fileName}"></span>
																					</c:otherwise>
																				</c:choose>
																			</c:if>
																			<a href='#' style='width: 100px; margin-bottom: 5px'
																				class='fileDeleteBtnSet' data-file='file${item.idx}'>
																				<div class='btn-x'></div>
																			</a> <input type='hidden' class='file_name_arr${_prefix}'
																				name='file_name${_prefix}' value='${item.fileName}' />
																			<input type='hidden'
																				class='file_original_arr${_prefix}'
																				name='file_original${_prefix}'
																				value='${item.orgName}' />
																		</div>

																		<input type="hidden" id="file_name${_prefix}"
																			name="file_name_arr${_prefix}"
																			class="file_name${_prefix}" value="" /> <input
																			type="hidden" id="file_original${_prefix}"
																			name="file_original_arr${_prefix}"
																			class="file_name${_prefix}" value="" />
																	</div>
																</td>
															</tr>
														</c:when>

														<c:otherwise>

														</c:otherwise>

													</c:choose>
												</c:forEach>
											</c:if>
										</c:if>

									</tbody>
								</table>
								<!-- //article_box_wrap -->
								<div class="bd_btn_wrap">
									<ul>
										<li>
											<button id="saveBtn${_prefix}" data-prefix="${_prefix}">저장</button>
										</li>

										<li>
											<button id="deleteBtn${_prefix}" class="deleteBtn${_prefix}">삭제</button>
										</li>

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
		<c:if test="${boardOptionList[0].tcd_attr6 ne 'N'}">
			<div data-options="region:'east',title:'업로드',split:false" style="width:432px;">
		    	<div  class="common_file_pannel${_prefix}" style="height:auto;padding:5px;border:0;overflow:hidden"  > 
		    	</div>
		    </div>
	    </c:if>
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp"%>

	<script type="text/javascript">
	
	var $upCategory = "${boardOptionList[0].tcd_attr3}";
	
	var $bannersub_idx = "${_banner.bannersub_idx}";
	$(".common_file_pannel${_prefix}").panel({
	    href	:	'/admin/file/commonFileRegForm?s_category='+$upCategory,
	    onLoad:function(){
	        
	    }
	});
	
	$(".imgdel").off("click").on("click", function(){
		
		$(this).next().find("img").attr('src','');
		$(this).next().find("img").attr('src','/admin/img/img_sample.jpg');
		
		if($(this).next().data("index") == 0)
		{
			$(this).next().next().text("삭제됨");
			$("#bannersub_webImg").val("");
			$("#bannersub_webImgfilekey").val("");
		}
		else if($(this).next().data("index") == 1){
			$(this).next().next().text("삭제됨");
			$("#bannersub_etcImg").val("");
			$("#bannersub_etcImgfilekey").val("");
		}
		else if($(this).next().data("index") == 2){
			$(this).next().next().text("삭제됨");
			$("#bannersub_etcImg").val("");
			$("#bannersub_etcImgfilekey").val("");
		}
		else{
			$(this).next().next().text("삭제됨");
			$("#bannersub_spareImg").val("");
			$("#bannersub_spareImgfilekey").val("");
		}

	});
	
	function targetDropBoxInit() {

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
				/* 이미지 등록 임시 path */
				filepath = "\/imgpath" + filepath;
				var b_filename = $(source).data("imgname");
				var indexNum = $(".targetDropBox").index(this);
				var optNum   = $(this).data("index");
				var imgsrc = $(source).find("div").css('background-image');
				imgsrc = imgsrc.replace('url(','').replace(')','').replace(/\"/gi, "");
		               
				//console.log(">>>>>>>>>>>>>>>>>>>>>>");
				//console.log(filepath);
				//console.log(imgsrc);
				//console.log(source);
		               
				/* if(${_prefix =='BD01'}){
					var ihtml = "";
					if( $(source).find("div").css('background-image') != "url('/admin/img/img_sample.jpg')" ){

						ihtml += '<li style="width:34%;">';
						ihtml += '	<a href="#" class="easyui-linkbutton imgdel" data-options="plain:true,iconCls:\'icon-cancel\'" style="width:45%;display:none;position: absolute;left: 81%;"></a>';
						ihtml += '	<div class="easyui-droppable targetarea targetDropBox img${_prefix}" id="target0' + ($(".targetDropBox").length + 1) + '${_prefix}" data-index="' + $(".targetDropBox").length + '">';
						ihtml += '		<img src="/admin/img/img_sample.jpg" alt="1" style="height:100%;">';
						ihtml += '	</div>';
						ihtml += '	<span class="img_txt">' + ($(".targetDropBox").length + 1) + '</span>';
						ihtml += '</li>';
						
						$(".cfs").append(ihtml);
						
						targetDropBoxInit();
					}
				} */
				
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
				
			}
		});
	}
	
	$(document).ready(function() {
		
		targetDropBoxInit();
   			
   				var $index = "${_board.board_idx}";
   				
   				if(${_prefix == 'BD07'}){
   					fnCommonCodeSearch("board_cate_L${_prefix}", "<c:out value="A070" default="Korea" escapeXml="true"/>",0, null);
   				}else if(${_prefix == 'BD04'}){
   					fnCommonCodeSearch("board_cate_L${_prefix}", "<c:out value="A060" default="Korea" escapeXml="true"/>",0, null);
   					fnCommonCodeSearch("board_cate_M${_prefix}", "<c:out value="A090" default="Korea" escapeXml="true"/>",0, null);
   				}else if(${_prefix == 'BD06'}){
   					fnCommonCodeSearch("board_cate_L${_prefix}", "<c:out value="A080" default="Korea" escapeXml="true"/>",0, null);
   				}else {
   					fnCommonCodeSearch("board_cate_L${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>",0, null);
   				}
   				
   				$(".imgPopup").off("click");
	   			$(".imgPopup").on("click", function(){
	   				var idx = $(this).data("idx");
	   				winPopUPCenter("/admin/imgPopup?${_csrf.parameterName}=${_csrf.token}&idx=" + idx , "img", 1, 1, "yes", "yes");
	   			});
	   			   				
   				$(".fileDeleteBtnSet").off("click").on("click", function(){
   					$(this).closest('tr').remove();
   				});
   				
	   			var editorBoard${_prefix} = [];
	   			var editorBoardReply${_prefix} = [];
	   			var editorBoardMemory${_prefix} = [];

				<c:if test="${boardOptionList[0].tcd_code eq 'BD04'}">
					$(".board_reply${_prefix}").show();
				</c:if>
				
				$meplzNaverEditor.init({ 
	   				  container 			: "board_memory${_prefix}"
	   				, saver					: 	editorBoardMemory${_prefix}
					, onLoadSuccecs   : function(){
	   			
						$meplzNaverEditor.init({ 
			   				  container 			: "board_reply${_prefix}"
			   				, saver					: 	editorBoardReply${_prefix}
							, onLoadSuccecs   : function(){
					   			
					   			$meplzNaverEditor.init({ 
					   				  container 			: "board_detail${_prefix}"
					   				, saver					: editorBoard${_prefix}
					   				, onLoadSuccecs   : function(){
					   					
					   					if ( $index != 0)
					   					{
					   						setTimeout(function(){
					   							
						   						$('#ff${_prefix}').form({
						   							onLoadSuccess:function(data){
						   								
						   								$(".utm_path${_prefix}").val(data.rows[0].utm_path);
						   								$("#board_url${_prefix}").val(data.rows[0].board_url);	
						   									   								
						   								$("#board_title${_prefix}").val(data.rows[0].board_title);
						   								$("#board_cnt${_prefix}").val(data.rows[0].board_cnt);
						   								$("#board_reg_name${_prefix}").val(data.rows[0].board_reg_name);
						   								
						   								if (data.rows[0].board_etc1 == 'b') {
						   									$("input[name='board_etc1${_prefix}'][value='b']").prop('checked','true');
						   								} else if (data.rows[0].board_etc1 == 'w') {
						   									$("input[name='board_etc1${_prefix}'][value='w']").prop('checked','true');
						   								}
						   								
						   								$("#board_etc2${_prefix}").val(data.rows[0].board_etc2);
						   								$("#board_etc3${_prefix}").val(data.rows[0].board_etc3);
						   								$("#board_etc10${_prefix}").val(data.rows[0].board_etc10);
						   								
						   								if(data.rows[0].board_secret == 'Y'){
						   									$("input[name='board_secretBD08'][value='Y']").prop('checked','true');
						   								}else if(data.rows[0].board_secret == 'N'){
						   									$("input[name='board_secretBD08'][value='N']").prop('checked','true');
						   								};
						   								
						   								
						   								if(${_prefix =='BD11'}){
						   									if(data.rows[0].board_cate_L !=null && data.rows[0].board_cate_L != ''){
							   									var cate = data.rows[0].board_cate_L.split(',');
							   									
							   								}
						   								};
						   								
						   								if( ${_prefix =='BD06'} ){
					   										$('input:radio[name=board_secretBD06]:input[value=' + data.rows[0].board_etc1 + ']').attr("checked", true);
						   								}
						   								
						   								
						   								var divideImg = data.rows[0].save_file.split('|');
						   								for(var i =0;i<divideImg.length;i++){
						   									var targetNum = i+1;
						   									if(divideImg[i] !=null && divideImg[i] !=''){
						   										if(divideImg[i].indexOf("http") > -1 && divideImg[i].indexOf("sample")){
						   											$("#target0"+targetNum+"${_prefix}").find("img").attr("src",divideImg[i]);
						   											$("#target0"+targetNum+"${_prefix}").prev().css("display","block");
						   										}else{
						   											$("#target0"+targetNum+"${_prefix}").find("img").attr("src",""+divideImg[i]);
						   											$("#target0"+targetNum+"${_prefix}").prev().css("display","block");
						   										}
						   									}else{
						   										$("#target0"+targetNum+"${_prefix}").find("img").attr("src","/admin/img/img_sample.jpg");
						   									}
						   									
						   								}
						   								
						   								
						   								<c:if test="${boardOptionList[0].tcd_code eq 'BD12'}">
						   								$("#req").val("이름:"+data.rows[0].board_reg_name+" 연락처:"+data.rows[0].board_mobile+" 성별:"+data.rows[0].board_etc1+ " 나이:"+data.rows[0].board_etc2+" 신청일:"+data.rows[0].board_reg_date);
						   								</c:if>
						   								
						   								$('#board_reg_date${_prefix}').datebox({
						   								    value: data.rows[0].board_reg_date
						   								});
						   								
						   								$("#board_mobile${_prefix}").val(data.rows[0].board_mobile);
						   								
						   								if(data.rows[0].board_notice == "Y")
					   									{
						   									$boardNotice = $("input:checkbox[id='board_notice${_prefix}']");
						   									$boardNotice.attr("checked" , true);
						   									$boardNotice.trigger("change");
					   									}
						   								
					   									<c:if test="${boardOptionList[0].tcd_code eq 'BD05'}">
					   										$("#board_etc1${_prefix}").val(data.rows[0].board_etc1);
					   									</c:if>
					   									
					   									<c:if test="${boardOptionList[0].tcd_code eq 'BD08'}">
					   										
					   										var reply_yn = null;
					   										if( data.rows[0].board_reply.trim() !="" &&  data.rows[0].board_reply.trim() !="" ) {
					   											reply_yn = "답변완료";
					   										} else {
					   											reply_yn = "답변대기";
					   										}
					   										$("#reply_yn${_prefix}").val(reply_yn);
					   									</c:if>
							   									   								
						   								/* 마이그레이션 데이터의 이미지path가 존재할 경우 */
						   								if (data.rows[0].save_file != null && data.rows[0].save_file != "") {
						   											   									
						   									$("#save_file${_prefix}").val(data.rows[0].save_file);
						   									
						   									var save_file = data.rows[0].save_file;
						   									var fileArr      = save_file.split("|");
						   									
						   									var splitUrl 			= "";
						   									var nArLength     	= "";
						   									var arFileName     = "";
						   									
						   									$(".mig_file").show();
						   									
						   									if ( fileArr.length > 1 ) {
						   										
						   										for ( var i = 0; i < fileArr.length; i++ ) {
						   											
						   											splitUrl 			= fileArr[i].split("/");
								   									nArLength     = splitUrl.length;
								   									arFileName    = splitUrl[nArLength-1];
								   									
								   									if( fileArr[i] != null && fileArr[i] != '') {
								   										var basePath ="";
								   										if(fileArr[i].indexOf("/_date")){
								   											basePath = "";
								   										}
								   										var rhtml = '';
								   										if("${_prefix} =='BD07' || ${_prefix} =='BD13'"){
								   											rhtml += '<tr id="tr">';
							   											}else{
							   												rhtml += '<tr>';
							   											}
								   										if("${_prefix} =='BD07' || ${_prefix} =='BD13'"){
								   											if($(".table_tit").text().match("치료전") !=null && $(".table_tit").text().match("치료전") !=''){
								   												rhtml += "<th><label class='table_tit' style='text-align: left'>치료후</label></th>";
								   											}else{
								   												rhtml += "<th><label class='table_tit' style='text-align: left'>치료전</label></th>";
								   											}
								   										}else{
								   											rhtml += "<th><label class='table_tit' style='text-align: left'>첨부파일 #'+i+'</label></th>";
								   										}
																		rhtml += '	<td style="text-align: left">';
																		rhtml += '		<div><br/>';
																		rhtml += '			<span class="migImgPopup" data-filepath="'+fileArr[i]+'" style="cursor:pointer;"><img style="width:500px;height:500px;" src="'+basePath+fileArr[i]+'" /></span>';		   										  
																		rhtml += '			<a href="#" style="width: 100px; margin-bottom: 5px" class="migFileDeleteBtnSet">';
																		rhtml += '				<div class="btn-x"></div>';
																		rhtml += '			</a>';
																		rhtml += '		</div>';
																		rhtml += '	</td>';
																		rhtml += '</tr>';
																	
																		$("#boardRegForm${_prefix} #tableBody${_prefix}").append(rhtml);
																		
								   									}
								   									
						   										};
						   										
						   									} else {
						   										var basePath ="";
						   											basePath = "";
						   										
						   										
						   										splitUrl 			= data.rows[0].save_file.split("/");
							   									nArLength     = splitUrl.length;
							   									arFileName    = splitUrl[nArLength-1];
							   									
							   									var html = '';
									   									html += '<tr>';
									   									html += '	<th><label class="table_tit">첨부파일</label></th>';
									   									html += '	<td style="text-align: left">';
									   									html += '		<div><br/>';
									   									html += '			<span class="migImgPopup" data-filepath="'+data.rows[0].save_file+'" style="cursor:pointer;"><img style="width:500px;height:500px;" src="'+basePath+data.rows[0].save_file+'" /></span>';		   										  
									   									html += '			<a href="#" style="width: 100px; margin-bottom: 5px" class="migFileDeleteBtnSet">';
									   									html += '				<div class="btn-x"></div>';
									   									html += '			</a>';
									   									html += '		</div>';
									   									html += '	</td>';
									   									html += '</tr>';
															  	   												
																$("#boardRegForm${_prefix} #tableBody${_prefix}").append(html);
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
								   				   		
								   				   		
					   									editorBoard${_prefix}.getById["board_detail${_prefix}"].exec("SET_IR", [""]); //내용초기화
					   									editorBoard${_prefix}.getById["board_detail${_prefix}"].exec("PASTE_HTML", [data.rows[0].board_detail]);
					   									
					   									
					   									if( data.rows[0].board_reply.trim() != null && data.rows[0].board_reply.trim() != "" ) {
				   											editorBoardReply${_prefix}.getById["board_reply${_prefix}"].exec("SET_IR", [""]); //내용초기화
					  	   									editorBoardReply${_prefix}.getById["board_reply${_prefix}"].exec("PASTE_HTML", [data.rows[0].board_reply]);	
					   									}
					   									
					   									if( data.rows[0].board_memory.trim() != null && data.rows[0].board_memory.trim() != "" ) {
				   											editorBoardMemory${_prefix}.getById["board_memory${_prefix}"].exec("SET_IR", [""]); //내용초기화
					  	   									editorBoardMemory${_prefix}.getById["board_memory${_prefix}"].exec("PASTE_HTML", [data.rows[0].board_memory]);	
					   									}
					   									
					   									setTimeout(function(){
					   										if( ${boardOptionList[0].tcd_attr2 ne 'N'} )
						   									{
					   											var menu_code_text = data.rows[0].board_menu_code_nm;
					   											
							   									$('#board_cate_L${_prefix}').combobox('setText',data.rows[0].tcd_title);
							   									if( data.rows[0].board_etc1 !=null && data.rows[0].board_etc1 !='' ){
							   										$('input:radio[name=board_etc1${_prefix}]:input[value=' + data.rows[0].board_etc1 + ']').attr("checked", true);
							   									}
							   									
						   									}
				   												
				   												$('#board_responsibility${_prefix}').combobox('setText',data.rows[0].board_responsibility_nm);
							   									$("#board_responsibility_val${_prefix}").val(data.rows[0].board_responsibility_cd);	
							   									
							   									$('#chief_complaint${_prefix}').combobox('setText',data.rows[0].chief_complaint_nm);
							   									$("#chief_complaint_val${_prefix}").val(data.rows[0].chief_complaint_cd);
					   										
					   										/* if(data.rows[0].board_menu_code == "BD10" || data.rows[0].board_menu_code == "BD03"){
					   											$('#board_cate_L${_prefix}').combobox('setText',data.rows[0].board_cate_L);
							   									$("#board_cate_L_val${_prefix}").val(data.rows[0].tcd_code_L);
							   									$('input:radio[name=board_secret${_prefix}]:input[value=' + data.rows[0].board_secret + ']').attr("checked", true);
					   										}else if(data.rows[0].board_menu_code == "BD09"){
					   											$('#board_cate_L${_prefix}').combobox('setText',data.rows[0].board_cate_M);
							   									$("#board_cate_L_val${_prefix}").val(data.rows[0].tcd_code_M);
					   										} */
					   										
					   										if(data.rows[0].board_cate_M != "")
						   									{
					   											
					   											$(".board_cate_M_area").show();
					   											
					   											//fnCommonCodeSearch("board_cate_M${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>", 1, data.rows[0].tcd_code);
					   											
					   											setTimeout(function(){
					   												
					   												$('#board_cate_M${_prefix}').combobox('setText',data.rows[0].tcds_title);
								   									//$("#board_cate_M_val${_prefix}").val(data.rows[0].tcd_code_M);	
					   											}, 500);
					   											
							   											   									
						   									}
					   										
					   									}, 700);
					   									if(${_prefix != 'BD17'}){
					   									$('input:radio[name=board_show${_prefix}]:input[value=' + data.rows[0].board_show + ']').attr("checked", true);
					   									}
						   							 }
						   						});
						   						
						   						$('#ff${_prefix}').form('load', '/admin/interface/selectBoard/${menu_code}?board_idx=' + $index );		   						
					   						},500);	   						
					   					}
					   					
					   				}
					   			});	
							}
						});
					}
				});
				
				<c:if test="${boardOptionList[0].tcd_code == 'BD13'}">
					   					
					   					if ( $index != 0)
					   					{
					   						setTimeout(function(){
					   							
						   						$('#ff${_prefix}').form({
						   							onLoadSuccess:function(data){
						   								
						   								$(".utm_path${_prefix}").val(data.rows[0].utm_path);
						   								$("#board_url${_prefix}").val(data.rows[0].board_url);	
						   									   								
						   								$("#board_title${_prefix}").val(data.rows[0].board_title);
						   								$("#board_cnt${_prefix}").val(data.rows[0].board_cnt);
						   								$("#board_reg_name${_prefix}").val(data.rows[0].board_reg_name);
						   								
						   								
						   								$("#board_etc1${_prefix}").val(data.rows[0].board_etc1);
						   								$("#board_etc2${_prefix}").val(data.rows[0].board_etc2);
						   								$("#board_etc3${_prefix}").val(data.rows[0].board_etc3);
						   								
						   								if(data.rows[0].board_secret == 'Y'){
						   									$("input[name='board_secretBD08'][value='Y']").prop('checked','true');
						   								}else if(data.rows[0].board_secret == 'N'){
						   									$("input[name='board_secretBD08'][value='N']").prop('checked','true');
						   								};
						   								
						   								
						   								
						   								var divideImg = data.rows[0].save_file.split('|');
						   								for(var i =0;i<divideImg.length;i++){
						   									var targetNum = i+1;
						   									if(divideImg[i] !=null && divideImg[i] !=''){
						   										if(divideImg[i].indexOf("http") > -1 && divideImg[i].indexOf("sample")){
						   											$("#target0"+targetNum+"${_prefix}").find("img").attr("src",divideImg[i]);
						   											$("#target0"+targetNum+"${_prefix}").prev().css("display","block");
						   										}else{
						   											$("#target0"+targetNum+"${_prefix}").find("img").attr("src",""+divideImg[i]);
						   											$("#target0"+targetNum+"${_prefix}").prev().css("display","block");
						   										}
						   									}else{
						   										$("#target0"+targetNum+"${_prefix}").find("img").attr("src","/admin/img/img_sample.jpg");
						   									}
						   									
						   								}
						   								
						   								
						   								<c:if test="${boardOptionList[0].tcd_code eq 'BD12'}">
						   								$("#req").val("이름:"+data.rows[0].board_reg_name+" 연락처:"+data.rows[0].board_mobile+" 성별:"+data.rows[0].board_etc1+ " 나이:"+data.rows[0].board_etc2+" 신청일:"+data.rows[0].board_reg_date);
						   								</c:if>
						   								
						   								$('#board_reg_date${_prefix}').datebox({
						   								    value: data.rows[0].board_reg_date
						   								});
						   								
						   								$("#board_mobile${_prefix}").val(data.rows[0].board_mobile);
						   								
						   								if(data.rows[0].board_notice == "Y")
					   									{
						   									$("input:checkbox[id='board_notice${_prefix}']").attr("checked" , true);
					   									}
						   								
					   									<c:if test="${boardOptionList[0].tcd_code eq 'BD05'}">
					   										$("#board_etc1${_prefix}").val(data.rows[0].board_etc1);
					   									</c:if>
					   									
					   									<c:if test="${boardOptionList[0].tcd_code eq 'BD08'}">
					   										
					   										var reply_yn = null;
					   										if( data.rows[0].board_reply.trim() !="" &&  data.rows[0].board_reply.trim() !="" ) {
					   											reply_yn = "답변완료";
					   										} else {
					   											reply_yn = "답변대기";
					   										}
					   										$("#reply_yn${_prefix}").val(reply_yn);
					   									</c:if>
							   									   								
						   								/* 마이그레이션 데이터의 이미지path가 존재할 경우 */
						   								if (data.rows[0].save_file != null && data.rows[0].save_file != "") {
						   											   									
						   									$("#save_file${_prefix}").val(data.rows[0].save_file);
						   									
						   									var save_file = data.rows[0].save_file;
						   									var fileArr      = save_file.split("|");
						   									
						   									var splitUrl 			= "";
						   									var nArLength     	= "";
						   									var arFileName     = "";
						   									
						   									$(".mig_file").show();
						   									
						   									if ( fileArr.length > 1 ) {
						   										
						   										for ( var i = 0; i < fileArr.length; i++ ) {
						   											
						   											splitUrl 			= fileArr[i].split("/");
								   									nArLength     = splitUrl.length;
								   									arFileName    = splitUrl[nArLength-1];
								   									
								   									if( fileArr[i] != null && fileArr[i] != '') {
								   										var basePath ="";
								   										if(fileArr[i].indexOf("/_date")){
								   											basePath = "";
								   										}
								   										var rhtml = '';
								   										if("${_prefix} =='BD07' || ${_prefix} =='BD13'"){
								   											rhtml += '<tr id="tr">';
							   											}else{
							   												rhtml += '<tr>';
							   											}
								   										if("${_prefix} =='BD07' || ${_prefix} =='BD13'"){
								   											if($(".table_tit").text().match("치료전") !=null && $(".table_tit").text().match("치료전") !=''){
								   												rhtml += "<th><label class='table_tit' style='text-align: left'>치료후</label></th>";
								   											}else{
								   												rhtml += "<th><label class='table_tit' style='text-align: left'>치료전</label></th>";
								   											}
								   										}else{
								   											rhtml += "<th><label class='table_tit' style='text-align: left'>첨부파일 #'+i+'</label></th>";
								   										}
																		rhtml += '	<td style="text-align: left">';
																		rhtml += '		<div><br/>';
																		rhtml += '			<span class="migImgPopup" data-filepath="'+fileArr[i]+'" style="cursor:pointer;"><img style="width:500px;height:500px;" src="'+basePath+fileArr[i]+'" /></span>';		   										  
																		rhtml += '			<a href="#" style="width: 100px; margin-bottom: 5px" class="migFileDeleteBtnSet">';
																		rhtml += '				<div class="btn-x"></div>';
																		rhtml += '			</a>';
																		rhtml += '		</div>';
																		rhtml += '	</td>';
																		rhtml += '</tr>';
																	
																		$("#boardRegForm${_prefix} #tableBody${_prefix}").append(rhtml);
																		
								   									}
								   									
						   										};
						   										
						   									} else {
						   										var basePath ="";
						   											basePath = "";
						   										
						   										
						   										splitUrl 			= data.rows[0].save_file.split("/");
							   									nArLength     = splitUrl.length;
							   									arFileName    = splitUrl[nArLength-1];
							   									
							   									var html = '';
									   									html += '<tr>';
									   									html += '	<th><label class="table_tit">첨부파일</label></th>';
									   									html += '	<td style="text-align: left">';
									   									html += '		<div><br/>';
									   									html += '			<span class="migImgPopup" data-filepath="'+data.rows[0].save_file+'" style="cursor:pointer;"><img style="width:500px;height:500px;" src="'+basePath+data.rows[0].save_file+'" /></span>';		   										  
									   									html += '			<a href="#" style="width: 100px; margin-bottom: 5px" class="migFileDeleteBtnSet">';
									   									html += '				<div class="btn-x"></div>';
									   									html += '			</a>';
									   									html += '		</div>';
									   									html += '	</td>';
									   									html += '</tr>';
															  	   												
																$("#boardRegForm${_prefix} #tableBody${_prefix}").append(html);
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
								   				   		
					   									setTimeout(function(){
					   										
					   											var menu_code_text = data.rows[0].board_menu_code_nm;
					   											
							   									$('#board_cate_L${_prefix}').combobox('setText',data.rows[0].board_cate_L);
							   									$("#board_cate_L_val${_prefix}").val(data.rows[0].tcd_code);
				   												
					   										if(data.rows[0].board_cate_M != "")
						   									{
					   											$(".board_cate_M_area").show();
					   											
					   											//fnCommonCodeSearch("board_cate_M${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>", 1, data.rows[0].tcd_code);
					   											
					   											setTimeout(function(){
					   												
					   												$('#board_cate_M${_prefix}').combobox('setText',data.rows[0].board_cate_M);
								   									$("#board_cate_M_val${_prefix}").val(data.rows[0].tcd_code_M);	
					   											}, 500);
							   											   									
						   									}
					   										
					   									}, 1500);
					   									if(${_prefix != 'BD17'}){
					   									$('input:radio[name=board_show${_prefix}]:input[value=' + data.rows[0].board_show + ']').attr("checked", true);
					   									}
						   							 }
						   						});
						   						
						   						$('#ff${_prefix}').form('load', '/admin/interface/selectBoard/${menu_code}?board_idx=' + $index );		   						
					   						},500);	   						
					   					};
					   					
	   			</c:if>
	   						   			
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
							
							
							if($("#boardRegForm${_prefix} .table_tit").text().match("치료후") !=null && $(".table_tit").text().match("치료후") !=''){
								$("#boardRegForm${_prefix} #tr").before(html);
	   						}else{
	   							$("#boardRegForm${_prefix} #tableBody${_prefix}").append(html);
	   						}
			   										
			   				$(".fileDeleteBtnSet").off("click").on("click", function(){
			   					$(this).closest('tr').remove();
			   				});	
		   				}	 		
	   				}
	   			});
   				
   				
	   			
   			$("#saveBtn${_prefix}").off("click");
			$("#saveBtn${_prefix}").on("click", function(){
				var sHTML;
				var rHTML;
				var mHTML;
				<c:if test="${boardOptionList[0].tcd_code != 'BD13'}">	
				sHTML = editorBoard${_prefix}.getById["board_detail${_prefix}"].getIR();
				</c:if>
				<c:if test="${boardOptionList[0].tcd_code eq 'BD04'}">				
				rHTML = editorBoardReply${_prefix}.getById["board_reply${_prefix}"].getIR();
				</c:if>
		    	
				<c:if test="${boardOptionList[0].tcd_code != 'BD03' && boardOptionList[0].tcd_code != 'BD13'}">
				mHTML = editorBoardMemory${_prefix}.getById["board_memory${_prefix}"].getIR();
				</c:if>
				
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
		    	var board_cate_M = "";
		    	<c:if test="${boardOptionList[0].tcd_attr2 ne 'N' }">
		    		if(${_prefix !='BD11'}){
		    			
		    			if($('#board_cate_L${_prefix}').combobox('getValue') != "")
						{
							board_cate_L = $('#board_cate_L${_prefix}').combobox('getValue');
						} else {
							board_cate_L = $("#board_cate_L_val${_prefix}").val();
						}
		    			/* if($('#board_cate_L${_prefix}').combobox('getValue') == "" && $("#board_cate_L_val${_prefix}").val() == "") {
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
						} */
		    		}
			    	
			    	
			    	if($(".board_cate_M_area").css("display") == "inline-block") {
			    		
			    		if($('#board_cate_M${_prefix}').combobox('getValue') != "")
						{
							board_cate_M = $('#board_cate_M${_prefix}').combobox('getValue');
						} else {
							board_cate_M = $("#board_cate_M_val${_prefix}").val();
						}
			    		
			    		/* if($('#board_cate_M${_prefix}').combobox('getValue') == "" && $("#board_cate_M_val${_prefix}").val() == "") {
							$("#board_cate_M${_prefix}").focus();
							alert("2차 카테고리를 선택해주세요.");
							return false;
						} else {
							
							if($('#board_cate_M${_prefix}').combobox('getValue') != "")
							{
								board_cate_M = $('#board_cate_M${_prefix}').combobox('getValue');
							} else {
								board_cate_M = $("#board_cate_M_val${_prefix}").val();
							}
						} */
			    	}
			    	
		    	</c:if>
		    	
		    	var board_reg_date = "";
		    	var format = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		    	var regDate = $("#board_reg_date${_prefix}").val().split(" ")[0];
		    	
		    	/* if(regDate == "") {					
					alert("등록일을 입력해주세요.");
					return false;
				} else {
	    			if(!format.test(regDate)) {
						alert("달력을 이용하여 날짜를 입력해주세요.");
						return false;
					}
	    		} */
		    	
		    	
		    	var date = new Date();
		    	if(regDate == "" || !format.test(regDate)){
		    		board_reg_date = null;
		    	}else{
		    		var getHours = String(date.getHours());
		    		var getMinutes = String(date.getMinutes());
		    		var getSeconds = String(date.getSeconds());
		    		
		    		if( getHours.length == 1 ){
		    			getHours = "0"+getHours;
		    		}
		    		if( getMinutes.length == 1 ){
		    			getMinutes = "0"+getMinutes;
		    		}
		    		if( getSeconds.length == 1 ){
		    			getSeconds = "0"+getSeconds;
		    		}
		    		
		    		board_reg_date = $("#board_reg_date${_prefix}").val() + " " + getHours + ":" + getMinutes + ":" + getSeconds;
		    		
		    	}
		    	
	            var board_show_str_date = "";
   				var board_show_end_date = "";
		    	<c:if test="${boardOptionList[0].tcd_attr1 eq 'Y'}">
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
	    		
	    		if (sHTML == "")
    			{
	    			alert("본문 내용을 작성해주세요.");
	    			return false;
    			}
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
   					file_name_arr = file_name_arr.substring(0,file_name_arr.length-1);
   					file_original_arr = file_original_arr.substring(0,file_original_arr.length-1);
				}
   				
   				if(${_prefix =='BD11'}){
   					
   					
   					var cateGroup = '';
   					
   					$(".board_cate_chk${_prefix}:checked").each(function(x,y){
   						if( x > 0 ) {
   							cateGroup += "|";
   						}
   						cateGroup += $(this).val();		
   					});
   					
   				}
   				
   				var img0 = $(".img${_prefix}:eq(0)").find("img").attr("src");
   				if( ! img0 || img0.indexOf("img_sample.jpg") > -1 ) {
   					img0 = "";
   				}
   				var img1 = $(".img${_prefix}:eq(1)").find("img").attr("src");
   				if( ! img1 || img1.indexOf("img_sample.jpg") > -1 ) {
   					img1 = "";
   				}
   				/*
   				var img2 = $(".img${_prefix}:eq(2)").find("img").attr("src");
   				if( img2.indexOf("img_sample.jpg") > -1 ) {
   					img2 = "";
   				}
   				var img3 = $(".img${_prefix}:eq(3)").find("img").attr("src");
   				if( img3.indexOf("img_sample.jpg") > -1 ) {
   					img3 = "";
   				}
   				*/
   				
		    	var param = {};
		    	param.Board_idx = $index;
		    	param.board_menu_code = "${_prefix}";
		    	param.board_notice = board_notice;
				param.board_title = board_title;
				param.board_cate_L = board_cate_L;
				param.board_cate_M = board_cate_M;
				param.board_show_str_date = board_show_str_date;
				param.board_show_end_date = board_show_end_date;
				param.board_detail = sHTML;
				if( ${_prefix !='BD10'} )
				param.board_secret = $("input[type=radio][name=board_secret${_prefix}]:checked").val();
				param.board_show = board_show;
				param.board_upload_drop = $("#board_upload_drop${_prefix}").val();
				param.tcd_attr3 = "<c:out value="${boardOptionList[0].tcd_attr3}" default="Korea" escapeXml="true"/>"
				param.file_name_arr = file_name_arr;
				param.file_original_arr = file_original_arr;
				var imgSave = img0;
				if (img1) {
					imgSave += "|" + img1;
				}
				param.save_file = imgSave;
				// param.save_file = img0 +"|"+  img1 +"|"+ img2 +"|"+ img3;
				// param.save_file = $(".img${_prefix}:eq(0)").find("img").attr("src"); //$("#save_file${_prefix}").val();
				param.board_mobile = $("#board_mobile${_prefix}").val();
				param.board_cnt = $("#board_cnt${_prefix}").val();
				param.board_url = $("#board_url${_prefix}").val();
				var board_etc1 = $("#board_etc1${_prefix}").val();
				if ( ${_prefix == 'PU01'} ) {
					board_etc1 = $("input[type=radio][name=board_etc1${_prefix}]:checked").val();
				} else if ( ${_prefix == 'BD04' || _prefix == 'BD06'} ) {
					board_etc1 = $("input[type=radio]:checked").val();
				}
				param.board_etc1 = board_etc1;
				param.board_etc2 = $("#board_etc2${_prefix}").val();
				param.board_etc3 = $("#board_etc3${_prefix}").val();
				param.board_etc4 = $("#board_etc4${_prefix}").val();
				param.board_etc5 = $("#board_etc5${_prefix}").val();
				param.board_etc6 = $("#board_etc6${_prefix}").val();
				param.board_etc7 = $("#board_etc7${_prefix}").val();
				param.board_etc8 = $("#board_etc8${_prefix}").val();
				param.board_reply = rHTML;
				param.board_etc9 = $("#target01 >img").attr("src")+"|"+$("#target02 >img").attr("src");
				param.board_reg_name = $("#board_reg_name${_prefix}").val();
				param.board_memory = mHTML;
				param.board_reg_date = board_reg_date;
				param.board_etc10 = Number($("#board_etc10${_prefix}").val());

				$.ajax({  
		               url      		 : '/admin/board/insertBoard'
		              ,data 			 : param
		              ,type    			 : "POST"
		              ,dataType 		 : "json"
		              ,success  : function(data) {
							parent.boardReload('${_prefix}');
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
			            		  parent.boardReload('${_prefix}');
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
				            					$("#target01${_prefix}_text").text("1");
				            					$("#target02${_prefix}_text").text("2");
				            					$("#target03${_prefix}_text").text("3");
				            					$("#target04${_prefix}_text").text("4");
				            				
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
    		}

			$("#board_notice${_prefix}").change(function() {
				var $input = $("#board_etc10${_prefix}");
				var $span = $input.closest("span");

				if ($(this).is(":checked")) {
					$input.val("");
					$span.hide();
				} else {
					$span.show();
				}
			});
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