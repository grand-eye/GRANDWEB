<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
			<div class="article_box article_box_right">
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
					<div class="img_register_wrap img_register_02">
						<ul class="cf">
						</ul>
					</div> <!-- //img_register_02 -->
				</div> <!-- //tab_sec -->
				<div class="tab_sec">
					<div class="file_drag">
							<div id="tb_file${_prefix}" style="height:auto">
								<form id="fileForm${_prefix}" method="post" action="/fileCommonUploadForm?${_csrf.parameterName}=${_csrf.token}">
								  <div id="drop_target_banner" style="width:95%;">클릭 혹은 드레그시 자동업로드</div>
								</form>
							</div>
					</div>
					<div class="img_register_wrap img_register_03">
						<ul class="cf">
						</ul>
					</div> <!-- //img_register_03 -->
				</div>  <!-- //tab_sec -->
			</div> <!-- //article_box_inner -->
		</div> <!-- //article_box_right -->
    
	<style>
      body {
        font-family: Verdana, Geneva, sans-serif;
        font-size: 13px;
        color: #333;
       /*  background: url(/admin/img/bg.jpg); */
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
    </style>
     
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
	  <style type="text/css">
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
           height:165px;
        }
        .proxy{
            border:1px solid #ccc;
            width:80px;
            background:#fafafa;
        }
    </style>
	
	
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp" %>	
	
	
	<script type="text/javascript">
		var cateCode = "banner";	// 각자 맞는 카데고리 설정 코드 (예) notice)
   		var fileExt  = '<spring:message code="banner"  ></spring:message>'.split("@")[0];		// 해당 카데고리의 파일 확장자
   		var fileSize = '<spring:message code="banner"  ></spring:message>'.split("@")[1] +'mb';	// 해당 카데고리의 파일 사이즈
   		
   		$meplzUploader.init({
					parameter : {
				        "groupCode" : ''					,
				        "cateCode" 	: cateCode							
					} 
					, dropBool : true
					, multiSelect : false
					, dropBox  : "drop_target_banner"
					, uploadStartButton : "drop_target_banner"
					, fileSize : fileSize
					, extensionMessage : "Image Files"
					, extension : fileExt
					, onLoadSucces : function(){
						console.log("abbdddeefe");
					}
					, onFileAdd : function(up, files){
						
					}
					, onUpdProgress : function(up, files){
						
					}
					, onError : function( up, err ){
						
					}
					, onComplete : function( svrResponse , fileInfo,  response ){
						console.log(svrResponse);
						alert("Dddddddddd");
						console.log ( $meplzUploader.getFileIdx() );
						console.log ( $meplzUploader.getFileArray() );
						console.log ( $meplzUploader.getFileGroupCode() );
						var banneruploadfileidx = $meplzUploader.getFileIdx();
						
						$(".img_register_03 > .cf").append("<li><div class='dragitem' style=\"width:120px;height:120px\" data-filekey='"+banneruploadfileidx+"' data-title='"+fileInfo.name+"' data-imgsrc='"+svrResponse.filefullpath+"' ><div style=\"width:120px;height:120px;background-image: url(\'"+svrResponse.filefullpath+"\');background-repeat:no-repeat;\"></div></div><span class='img_txt'>"+fileInfo.name+"</span></li>");
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
    </script>

	   
	<script type="text/javascript">
	$(function(){
		$("#searchTxt").val('');
		fnGetFileList(null);
		$(".img_register_03 > .cf").empty();
		
		//tab style 01
		$(document).on('click','.article_box .tab_st01 li',function(){
			
			$(this).addClass('on').siblings().removeClass('on')
			var tab_idx = $('.article_box .tab_st01 li').index($(this))
			$('.article_box .tab_sec').eq(tab_idx).addClass('on').siblings('.tab_sec').removeClass('on');
		});

		var article_boxH = $('.article_box_left .article_box_inner').height();
		$('.article_box_right').css({
			height:article_boxH
		});
		
		$('.article_box .img_register_02').css({
			height:article_boxH - 130
		});
		
		$('.article_box .img_register_03').css({
			height:article_boxH - 435
		});
		
		$("#searchTxt").keyup(function() {
			fnGetFileList($(this).val());
		});
	});


	function fnGetFileList(searchTxt) {
		var prm = {};
		prm.search_cate_code = cateCode;
		if(searchTxt != null) {
			prm.search_org_name = searchTxt;
		}
		
		$.ajax({  
            url      		 : "/admin/interface/selectFileList"
           ,data 			 : prm
           ,type    			 : "POST"
           ,dataType 		 : "json"
           ,success  : function(data) {
        	   		$(".img_register_02 > .cf").empty();
					var html ="";
		           	var y = data.rows;
	            	$.each(y , function (index, item) { 
	            		var fullSrc = data.web_root + item.filePath + item.fileName;
	            		$(".img_register_02 > .cf").append("<li><div class='dragitem' style=\"width:120px;height:120px\" data-filekey='"+item.idx+"' data-title='"+item.orgName+"' data-imgsrc='"+fullSrc +"' ><div style=\"width:120px;height:120px;background-image: url(\'"+fullSrc+"\');background-repeat:no-repeat;\"></div></div><span class='img_txt'>"+item.orgName+"</span></li>");
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
   




