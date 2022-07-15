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
						<label for=""><input type="text" name="searchTxt" id="searchTxt" placeholder="파일명으로 검색" /></label>
					</div>
					<div class="img_register_wrap img_register_02 imgFileList${_fileParam.s_category}" style="height:580px">
						<ul class="cf">
						</ul>
					</div> <!-- //img_register_02 -->
					
					<div id="ppFilePage" style="background:#efefef;border:1px solid #ccc;"></div>
				</div> <!-- //tab_sec -->
				<div class="tab_sec">
					<div class="file_drag">
							<div id="tb_file${_fileParam.s_category}" style="height:auto">
								<form id="fileForm${_fileParam.s_category}" method="post" action="/fileCommonUploadForm?${_csrf.parameterName}=${_csrf.token}">
								  <div id="drop_target_banner${_fileParam.s_category}" class="drop_target_banner_style" style="width:95%;">클릭 혹은 드레그시 자동업로드</div>
								</form>
							</div>
					</div>
					<div class="img_register_wrap img_register_03 imgResult${_fileParam.s_category}">
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
		   /*  background: url(/admin/img/bg.jpg); */
			width: 90%;
			margin: 40px auto;
		  }
		  .drop_target_banner_style {
			border: 10px dashed #999;
			text-align: center;
			color: #999;
			font-size: 20px;
			width: 85%;
			height: 300px;
			line-height: 300px;
			cursor: pointer;
		  }
		  
		  .drop_target_banner_style .dragover {
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
        }
        .targetarea{
            border:1px solid red;
          /*  height:auto;
           min-height:310px;*/
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
		var cateCode  = "${_fileParam.s_category}";	// 각자 맞는 카데고리 설정 코드 (예) notice)
		var _fileInfo = "${_fileInfo}";
		var fileExt  = _fileInfo.split("@")[0];		// 해당 카데고리의 파일 확장자
		var fileSize = _fileInfo.split("@")[1] +'mb';	// 해당 카데고리의 파일 사이즈
		
		var $page = 1;
		var $rows = 12;
		
   		$meplzUploader.init({
					parameter : {
				        "groupCode" : ''					,
				        "cateCode" 	: cateCode							
					} 
					, dropBool : true
					, multiSelect : true
					, dropBox  : "drop_target_banner" + cateCode
					, uploadStartButton : "drop_target_banner" + cateCode
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
						alert("이미지는 1mb 이하로만 사용해주세요.");
					}
					, onComplete : function( svrResponse , fileInfo,  response ){
						var banneruploadfileidx = $meplzUploader.getFileIdx();
						
						console.log("complete >>>");
						
						$(".imgResult${_fileParam.s_category} > .cf").append("<li><div class='dragitem' style=\"width:120px;height:120px\" data-filekey='"+svrResponse.idx+"' data-imgname='"+svrResponse.file_name+"' data-title='"+fileInfo.name+"' data-imgsrc='"+svrResponse.file_path+"' ><div style=\"width:120px;height:120px;background-image: url(\'/imgpath"+svrResponse.filefullpath+"\');background-repeat:no-repeat;background-size:cover;\"></div></div><span class='img_txt'>"+fileInfo.name+"</span></li>");
						$(".dragitem").append("<div style=\"width:10px;height:10px ;border:1px solid red;z-index:10;\"></div>")
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
						    	
						    	console.log( $(".proxy").html() );
						    }
						           
						});						
					}
				}   				
   		);

		$(function(){
			
			domReadyInit();
			
		});
		
		function domReadyInit(){
			
			$("#searchTxt").val('');
			fnGetFileList(null);
			$(".imgResult${_fileParam.s_category} > .cf").empty();
			
			//tab style 01
			$(document).on('click','.article_box .tab_st01 li',function(){
				
				$(this).addClass('on').siblings().removeClass('on')
				var tab_idx = $('.article_box .tab_st01 li').index($(this))
				$('.article_box .tab_sec').eq(tab_idx).addClass('on').siblings('.tab_sec').removeClass('on');
			});

			
			if ( $('.article_box_left .article_box_inner').length > 0 )
			{
				var article_boxH = $('.article_box_left .article_box_inner').height();	
			}
			else
			{
				var article_boxH = $('.article_box_wrap').height();
			}
			
			article_boxH = 1083;
			
			
			$('.article_box_right').css({
				height:article_boxH
			});
						
			$('.article_box .img_register_03').css({
				height:article_boxH - 435
			});
			
			$("#searchTxt").keyup(function() {
				fnGetFileList($(this).val());
			});
			setTimeout(function(){
				$(".dragitem").append("<div style=\"width:10px;height:10px ;border:1px solid red;z-index:10;\"></div>");
			},3000);
		}

		function deleteImgBtn(btn) {
		
			var prm = {};
			prm.idx = btn;
			
			$.ajax({  
				url      		 : "/admin/interface/deleteFile"
			   ,data 			 : prm
			   ,type    		 : "POST"
			   ,success  : function() {
				   alert('삭제 됐습니다.');
			   }
			});
			
			domReadyInit();
		};

		function fnGetFileList(searchTxt) {
			
			console.log("호출");
			
			
			var prm = {};
			prm.search_cate_code = cateCode;
			if(searchTxt != null) {
				prm.search_org_name = searchTxt;
			}
			
			prm.page = $page;
			prm.rows = $rows;
			
			$.ajax({  
				url      		 : "/admin/interface/selectFileList"
			   ,data 			 : prm
			   ,type    			 : "POST"
			   ,dataType 		 : "json"
			   ,success  : function(data) {
						$(".imgFileList${_fileParam.s_category} > .cf").empty();
						var html ="";
						var y = data.rows;
						var fullSrc;
						
						$('#ppFilePage').pagination({
						    total:data.total		,
						    pageList : [12] 		,
						    pageSize:$rows	,
						    onSelectPage : function(pageNumber, pageSize){
						    	$page = pageNumber;
						    	fnGetFileList( $("#searchTxt").val() );
						    }
						});
						
						
						$.each(y , function (index, item) { 
							fullSrc = "\/imgpath" + item.filePath + item.fileName;
							$(".imgFileList${_fileParam.s_category} > .cf").append("<li><div class='dragitem' style=\"width:120px;height:120px;position:relative\" data-filekey='"+item.idx+"' data-imgname='"+item.fileName+"' data-title='"+item.orgName+"' data-imgsrc='"+item.filePath +"' ><button class=\"x-btn\" onclick=deleteImgBtn("+item.idx+"); type=\"button\" style=\"position:absolute;right:5px;top:5px;width:15px;height:15px;background:url(\'/resources/admin/themes/icons/clear.png\') 0 0 no-repeat;background-size:contain;\"></button><div style=\"width:120px;height:120px;background-image: url(\'"+fullSrc+"\');background-repeat:no-repeat;background-size:cover;\"></div></div><span class='img_txt'>"+item.orgName+"</span></li>");
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
									
									console.log( $(".proxy").html() );
								}
						   
						   });
			   }
			});
		}
    </script>
   
</body>
</html>