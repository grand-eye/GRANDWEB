<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="bannerRegForm" style="background-color:#fff">

	<div class="article_box_wrap cf" style="text-align:center;height:770px;width:100%;overflow:hidden">
		<div class="article_box article_box_right" style="height:770px;width:100%">
			<div class="tab_st01">
					<ul class="cf">
						<li id="imagepre" class="on imagepre"><a href="#">등록된이미지</a></li>
						<li id="imageupload"><a href="#">업로드하기</a></li>
					</ul>
			</div> <!-- //tab_st01 -->
			<div class="article_box_inner">
				<div class="tab_sec on">
					<div class="file_sch">						
						<label for="" class="file_reg_selectbox">
							<select style="width:155px;border:0;" class="easyui-combobox table_tit_select" id="code_search_sub_cate${_prefix}" >
							</select>
						</label>
						<label for="search_image_tag${_prefix}" class="file_reg_textbox">
							<input type="text" id="search_image_tag${_prefix}"  placeholder="태그 검색" style="width:220px;" />
						</label>
						
						<button type="button" id="btn_templete_search${_prefix}" class="btn_element" >템플릿검색</button>
						<button type="button" id="btn_templete_update" class="btn_element" >템플릿등록</button>
					</div>
						
					<div class="img_register_wrap img_register_02 landingRegist02" style="height:580px;margin-top:10px;">
						<ul class="cf">
						</ul>
					</div> <!-- //img_register_02 -->
					
					<div id="ppFilePage" style="background:#efefef;border:1px solid #ccc;"></div>
				</div> <!-- //tab_sec -->
				<div class="tab_sec">
					<div class="file_drag">
							<div id="tb_file${_prefix}" style="height:auto">
								<form id="fileForm${_prefix}" method="post" action="/fileCommonUploadForm?${_csrf.parameterName}=${_csrf.token}">
								  <div style="width:95%;">
								  	<table style="width:100%;">
								  	
									  	<tr>
											<th style="text-align:left;"><label for="code_sub_cate" class="table_tit">카테고리</label></th>
											<td style="text-align: left" class="p_space10">
												<select style="width:400px;" class="easyui-combobox table_tit_select" id="code_sub_cate${_prefix}" data-options="missingMessage:'카테고리 입력은 필수 입력값입니다.',required:true" >
												</select>
											</td>											
										</tr>
										
										<tr>
											<th style="text-align:left;"><label for="image_tag" class="table_tit">태그</label></th>
											<td style="text-align: left">
												<div style="width:400px;padding:20px 0px;">
													<input class="easyui-tagbox" id="image_tag${_prefix}" style="width:100%" />												
												</div>
											</td>											
										</tr>
										
									</table>
								  </div>
								  <div id="drop_target_banner" style="width:95%;"></div>
								  <div class="btn_update_area">
									  <button type="button" id="btn_update_img">이미지선택</button>
								  </div>
								</form>
							</div>
					</div>
					<div class="img_register_wrap img_register_03 landingRegist03">
						<ul class="cf">
						</ul>
					</div> <!-- //img_register_03 -->
				</div>  <!-- //tab_sec -->
			</div> <!-- //article_box_inner -->
		</div> <!-- //article_box_right -->
	</div>
	
	<style>
		  body {
			font-family: Verdana, Geneva, sans-serif;
			font-size: 13px;
			color: #333;
			width: 90%;
			margin: 40px auto;
		  }
		  #drop_target_banner {
			border: 10px dashed #999;
			text-align: center;
			color: #999;
			font-size: 20px;
			width: 85%;
			height: 300px;
			line-height: 300px;
			cursor: pointer;
		  }
		  
		  #drop_target_banner.dragover {
			background: rgba(255, 255, 255, 0.4);
			border-color: green;
		  }
		  
		  #debug {
			margin-top: 20px;
		  }

        .title{
            margin-bottom:10px;
        }
        .dragitem{
            border:1px solid #ccc;
            width:50px;
            height:50px;
            margin-bottom:10px;
            orverflow:hidden;/*
            max-width:172px;*/
        }
        .targetarea{
            border:1px solid red;
           height:165px;
        }
        .proxy{
            border:1px solid #ccc;
            width:80px;
            background:#fafafa;
        }
    </style>
		
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp" %>
	
	<script type="text/javascript">
		var $cateCode  = "${_fileParam.s_category}";	// 각자 맞는 카데고리 설정 코드 (예) notice)
		var _fileInfo = "${_fileInfo}";
		var fileKey = '${_fileKey}';
		var prefix = "${_prefix}";
		var fileExt  = _fileInfo.split("@")[0];		// 해당 카데고리의 파일 확장자
		var fileSize = _fileInfo.split("@")[1] +'mb';	// 해당 카데고리의 파일 사이즈
		
		var $page = 1;
		var $rows = 12;
		
		var $plUploader = null;
		var meplzSetting = {};
		
   		$meplzUploader.init({
				parameter : {
			        "groupCode" : ''					,
			        "cateCode" 	: $cateCode		
				} 
				, dropBool : true
				, multiSelect : true
				, dropBox  : "drop_target_banner"
				, uploadStartButton : "btn_update_img"
				, fileSize : fileSize
				, extensionMessage : "Image Files"
				, extension : fileExt
				, onLoadSucces : function(){
				 }
				, onBefore : function(u, f){
					
					if( $("#code_sub_cate${_prefix}").val() == null || $("#code_sub_cate${_prefix}").val() == "" ) {
						alert("카테고리를 선택해 주세요.");
						return false;
					} else {
						
						this.parameter.subCateCode = $("#code_sub_cate${_prefix}").val();
						
					}
					
					this.parameter.imageTags = $("#image_tag${_prefix}").val();
				}				
				, onFileAdd : function(up, files){
					
				}
				, onUpdProgress : function(up, files){
				}
				, onError : function( up, err ){
				}
				, onComplete : function( svrResponse , fileInfo,  response ){
					var banneruploadfileidx = $meplzUploader.getFileIdx();
					
					$(".landingRegist03").css({"height":"230px"});
					
					if( prefix != null && prefix == "_columnFileRegForm" ) {
						$(".landingRegist03 > .cf").append("<li class='checkbox_area'><div class='dragitem' style=\"width:120px;height:120px\" data-filekey='"+svrResponse.idx+"' data-imgname='"+svrResponse.file_name+"' data-title='"+fileInfo.name+"' data-imgsrc='"+svrResponse.file_path +"' ><div style=\"width:120px;height:120px;\"><img src="+svrResponse.filefullpath+" /></div></div><span class='img_txt'>"+fileInfo.name+"</span><input type='checkbox' class='column_checkbox' id='column_checkbox_"+svrResponse.idx+"'><label for='column_checkbox_"+svrResponse.idx+"'><span></span></label></li>");
					} else if( prefix != null && prefix == "_landingFileRegForm" ) {								
						$(".landingRegist03 > .cf").append("<li class='checkbox_area'><div class='dragitem' style=\"width:120px;height:120px\" data-filekey='"+svrResponse.idx+"' data-imgname='"+svrResponse.file_name+"' data-title='"+fileInfo.name+"' data-imgsrc='"+svrResponse.file_path +"' ><div style=\"width:120px;height:120px; \"><img src="+svrResponse.filefullpath+" /></div></div><span class='img_txt'>"+fileInfo.name+"</span><input type='checkbox' class='landing_checkbox' id='landing_checkbox_"+svrResponse.idx+"'><label for='landing_checkbox_"+svrResponse.idx+"'><span></span></label></li>");
					}
									
					$("#btn_update_img").hide();
					
					$(".landing_checkbox").change(function(){
				        if($(this).is(":checked")){
				        	$("#btn_templete_update").click();
				        	
				        	 $(".common_element_pannel").empty();
				        }else{
				            
				        }
				    });
					
				}
			}   				
   		);

		$(function(){
			
			fnGetFileListLanding(null, null);
			
			if( prefix != null && prefix == "_columnFileRegForm" ) {
				commonFnc.fnCommonCode("sub_cate${_prefix}", "A060", null, "select", "==카테고리 선택==");
				commonFnc.fnCommonCode("search_sub_cate${_prefix}", "A060", null, "select", "==카테고리 선택==");
			} else if( prefix != null && prefix == "_landingFileRegForm" ) {
				commonFnc.fnCommonCode("sub_cate${_prefix}", "A170", null, "select", "==카테고리 선택==");
				commonFnc.fnCommonCode("search_sub_cate${_prefix}", "A170", null, "select", "==카테고리 선택==");	
			}
			
			$(".landingRegist03 > .cf").empty();
			
			//tab style 01
			$(document).on('click','.article_box .tab_st01 li',function(){
				
				$(this).addClass('on').siblings().removeClass('on')
				var tab_idx = $('.article_box .tab_st01 li').index($(this))
				$('.article_box .tab_sec').eq(tab_idx).addClass('on').siblings('.tab_sec').removeClass('on');
			});

			var article_boxH = $('.article_box_left .article_box_inner').height();
			if(article_boxH < 0) {
				article_boxH = 1083;
			}
			$('.article_box_right').css({
				height:article_boxH
			});
						
			$('.article_box .landingRegist03').css({
				height:article_boxH - 435
			});
			
			$("#btn_templete_search${_prefix}").off("click").on("click", function() {
				var code_search_sub_cate = $("#code_search_sub_cate${_prefix} option:selected").val();
				var search_image_tag = $("#search_image_tag${_prefix}").val();
				
				fnGetFileListLanding(code_search_sub_cate, search_image_tag);
			});			
			
		});


		function fnGetFileListLanding(cate, tag) {
						
			var prm = {};
			prm.search_cate_code = $cateCode;
			prm.search_sub_cate_code = cate;
			prm.search_images_tag = tag;
			prm.fileKey = tag;			
			
			prm.page = $page;
			prm.rows = $rows;
			
			console.log(JSON.stringify(prm));
			
			$.ajax({  
				url      		 : "/admin/interface/selectFileList"
			   ,data 			 : prm
			   ,type    			 : "POST"
			   ,dataType 		 : "json"
			   ,success  : function(data) {
				   
						$(".landingRegist02 > .cf").empty();
						var html ="";
						var y = data.rows;
						var fullSrc;
						
						$('#ppFilePage').pagination({
						    total:data.total		,
						    pageList : [12] 		,
						    pageSize:$rows	,
						    onSelectPage : function(pageNumber, pageSize){
						    	$page = pageNumber;
						    	
						    	var code_search_sub_cate = $("#code_search_sub_cate${_prefix} option:selected").val();
								var search_image_tag = $("#search_image_tag${_prefix}").val();
								
								fnGetFileListLanding(code_search_sub_cate, search_image_tag);
						    	
						    }
						});
						
						
						$.each(y , function (index, item) { 
							fullSrc = data.web_root + item.filePath + item.fileName;
							
							var checkcheck = null;
							
							if( fileKey.includes(item.idx) ) {
								checkcheck = "checked";
							}
							
							
							
							if( prefix != null && prefix == "_columnFileRegForm" ) {
								$(".landingRegist02 > .cf").append("<li class='checkbox_area'><div class='dragitem' style=\"width:120px;height:120px\" data-filekey='"+item.idx+"' data-imgname='"+item.fileName+"' data-title='"+item.orgName+"' data-imgsrc='"+item.filePath +"' ><div style=\"width:120px;height:120px;\"><img src="+fullSrc+" /></div></div><span class='img_txt'>"+item.orgName+"</span><input type='checkbox' class='column_checkbox' id='column_checkbox_"+item.idx+"' "+checkcheck+"><label for='column_checkbox_"+item.idx+"'><span></span></label></li>");
							} else if( prefix != null && prefix == "_landingFileRegForm" ) {								
								$(".landingRegist02 > .cf").append("<li class='checkbox_area'><div class='dragitem' style=\"width:120px;height:120px\" data-filekey='"+item.idx+"' data-imgname='"+item.fileName+"' data-title='"+item.orgName+"' data-imgsrc='"+item.filePath +"' ><div style=\"width:120px;height:120px;\"><img src="+fullSrc+" /></div></div><span class='img_txt'>"+item.orgName+"</span><input type='checkbox' class='landing_checkbox' id='landing_checkbox_"+item.idx+"' "+checkcheck+"><label for='landing_checkbox_"+item.idx+"'><span></span></label></li>");
							}
						}); 
						
						$('.dragitem').draggable({
							   revert:true,
							   deltaX:0,
							   deltaY:0,
							   proxy:function(source){
								   var n = $('<div class="proxy" style="z-index:99999"></div>');
								   n.html($(source).html()).appendTo('body');
								   return n;
							   }
								,
							  onStartDrag : function(){
									
								}
						   
						   });
			   }
			});
		}
    </script>
   
</body>
</html>