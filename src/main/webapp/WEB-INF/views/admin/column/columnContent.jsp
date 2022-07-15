<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>
</head>
<style>
	.box {position:relative;height:100px;board:1px solid #000;}
	.addContent {margin:0;height:30px;font-size:25px;}
</style>
<body id="columnBody">
	<div id="eventBodys" class="easyui-layout" style="width:100%;height:100%;position:relative;">
		<div data-options="region:'west',title:'컨텐츠 내용',split:true" style="width:62%; padding:50px 0;"> 
			<div id="columnContainer" style="max-width:980px;margin:0 auto;font-size: 18px; color: #666666; font-family: "Noto Sans KR", "Nanum Gothic",나눔고딕, 맑은고딕, "Malgun Gothic", "Apple SD Gothic Neo", sans-serif, Dotum; font-weight:400; line-height:1.33; word-break:keep-all; letter-spacing:-0.05em;">
				<div class="button-area">
			        <button type="button" class="contentAdd">
			        	<image src="/resources/admin/images/btn/icon_plus.png" alt="더보기" />
			        </button>
			    </div>
		    </div>		    
		</div>
		<div data-options="region:'east',title:'엘리먼트',split:true" style="width:37%;">
	    	<div  class="common_element_pannel${_prefix}" style="height:auto;padding:5px;border:0;"  > 
	    	</div>
	    </div>
	    <div id="previewContainer">
	   		<div id="container_type" class="container_p">
	    		<div id="valiableWidth"></div>
	    	</div>
	    </div>
    </div>
	
	<div class="landing_btn_wrap">
		<ul>
			<li class="preview_only">
				<button class="viewType" data-prefix="${_prefix}" data-opt="mobile"><img src="/admin/img/icon_phone.gif" alt="핸드폰"></button>
				<button class="viewType" data-prefix="${_prefix}" data-opt="tablet"><img src="/admin/img/icon_tablet.gif" alt="테블릿"></button>
				<button class="viewType" data-prefix="${_prefix}" data-opt="pc"><img src="/admin/img/icon_pc.gif" alt="컴퓨터"></button>
			</li>
			<li>
				<button id="preview_content${_prefix}" data-prefix="${_prefix}" data-opt="preview">미리보기</button>
			</li>			
			<li class="publish_only">
				<button id="save_content${_prefix}" data-prefix="${_prefix}">내용등록</button>
			</li>
			<li class="publish_only">
				<button class="cancelBtn" onclick="$('#w_columnForm_content').window('close');return false;">취소</button>
			</li>
		</ul>
	</div>
	<!-- //bd_btn_wrap -->
	
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	
	<script type="text/javascript" src="/resources/admin/ckeditor_v4/ckeditor.js"></script>
	<script type="text/javascript" src="/resources/admin/js/html2canvas.js"></script>
	<script type="text/javascript" src="/common/js/swiper.min.5.2.1.js"></script>
	
	<script type="text/javascript">
	
		var columnContentXhtml;
		var iframeNum = 0;
		
		function columnContentXhtml() {
			return columnContentXhtml;
		}
			
	  function addCSS(filename){
			 var head = document.getElementsByTagName('head')[0];
			 var style = document.createElement('link');
			 style.href = filename;
			 style.type = 'text/css';
			 style.rel = 'stylesheet';
			 head.append(style);
		}
	
	
	    $(document).ready(function(){
	    	
	    	var $index = "${_column.column_idx}";
	    	var param = {};
	    	var timeval = 5*60*1000;
	    	
	    	$(".cancelBtn").off('click').on('click',function(){
	    		clearInterval(autosave);
	    	});
	    	
	    	
	    	var autosave = setInterval(function(){
	    		
	    		console.log("$index="+$index);
	    		
	    		var param = {};
		    	param.column_idx 		= $index;
				param.column_content_backup 	= $("#columnContainer").parents().html();		    	
				
				$.ajax({  
		               url      		 	: '/admin/interface/insertColumnBackup'
		              ,data 			 	: param
		              ,type    			: "POST"
		              ,dataType 		: "json"
		              ,success  : function(data) {
		            	  if( $index == 0){
		            		  $index = data.returnInt;
		            	  }
		            	  console.log("temp save");
		              }
        		});
				
	    	},timeval);
	    	
	    	if ( $index != 0 )
			{
	    		param.column_idx = $index;
	    		
	    		$.ajax({  
		               url      		 	: '/admin/interface/selectColumn'
		              ,data 			 	: param
		              ,type    			: "POST"
		              ,dataType 		: "json"
	            	  ,success			:function(data){
	            		  if( data.column_idx > 0 ) {
	            			  
								$("#columnContainer").html("");
								$("#columnContainer").html(data.column_content);
								
								setTimeout(function(e){
									
								},500);
								
								
								//addCSS("/common/css/font.css");
								//addCSS("/common/css/style.css");
								//addCSS("/common/css/board/default.css");
								//addCSS("/common/css/notice/board.css");
								//addCSS("/common/css/notice/board_m.css");
								
								
	
								
								if( $("#columnContainer").find("div[contenteditable='true']").length > 0 ) {
									
									$('div[contenteditable="true"]').each(function(){
										var id = $(this).attr("id");

										CKEDITOR.inline( id );
										CKEDITOR.config.allowedContent = true;
										
									});
									
								} else {
									
									CKEDITOR.inline( "columnContainer" );
									$("#columnContainer").attr("contenteditable", true);
									
								}
								
								
								/* 이미지 영역 확인 */
								setTimeout(function(){
									if( $("#columnContainer").find("div.img-single").length > 0 ) {
										$(".targetDropBox").off("click").on("click", function(e) {
											e.preventDefault();
											e.stopPropagation();
											
											var key = $(this).find("img").data("opt");
											
											file_call($(this), key);
										})	;													
									}
									
									if( $("#columnContainer").find("div.img-multi").length > 0 ) {
										$(".targetDropBox").off("click").on("click", function(e) {
											e.preventDefault();
											e.stopPropagation();
											
											var key = '';
											$(this).find("img").each(function(index){																
												if(index > 0) {
													key += ',';
												}
												key += $(this).data("opt");
											});
											
											file_call($(this), key);
										})	;													
									}
									
									if( $("#columnContainer").find("div.swiper-container").length > 0 ) {
										$(".targetDropBox").off("click").on("click", function(e) {
											e.preventDefault();
											e.stopPropagation();
											
											var key = '';
											$(this).find("img").each(function(index){																
												if(index > 0) {
													key += ',';
												}
												key += $(this).data("opt");
											});
											
											file_call($(this), key);
										})	;													
									}
								}, 500);
															
								$(".contentAdd").off("click").on("click", function(){
									var nth = $(".contentAdd").index(this);
									element_call($(this), nth);					    		
						    	});
								
								deleteContent();
	            		  }
					  }
	    		});
			} else {
				
				$(".contentAdd").off("click").on("click", function(){
					var nth = $(".contentAdd").index(this);
					element_call($(this), nth);		    		
		    	});
		    	
			};
			
			$("#save_content${_prefix}").off("click").on("click", function() {
				
				/* var fontTxt = '"Noto Sans KR", sans-serif';
				
				$("#columnContainer").find(".editor_area").css({
					  "font-family":fontTxt
					, "line-height":"1.5"
					, "font-size":"17px"
					, "letter-spacing":"-0.05em"
					, "font-weight":"400"
					, "color":"#111"
					, "word-break":"keep-all"
				}); */
				
				console.log("save...");
				
				var videoboxLength = $(".video_box").length;
				
				for(var i=0;i<videoboxLength;i++){
					if( $(".video_box:eq(" + i + ")").hasClass("videoboxNum"+i) == false ){
						$(".video_box:eq(" + i + ")").addClass("videoboxNum"+i);
					}
				}
				
				var iframeLength = $(".cke_iframe").length;
				
				for(var i=0;i<iframeLength;i++){
					if( $(".video_box").find("img:eq(" + i + ")").hasClass("iframeNum"+i) == false ){
						$(".cke_iframe:eq(" + i + ")").addClass("iframeNum"+i);
					}
				}
				
				
				
				
				var contentParent = $("#columnContainer").parents().html();
				var content = $("#columnContainer").html();
				var editorArea = $("#columnContainer").find(".editor_area").html();
				
				clearInterval(autosave);
				
				if( content != null && content != "" ) {	
					clearInterval(autosave);
					parent.contentAdd(content,contentParent);
				} else {
					alert("컨텐츠 내용을 추가해 주세요.");
					return false;
				}
				
				/* var content = $("#columnContainer").html();
				
				var iHtml = ""
				$('[contenteditable="true"]').each( function(x,y){
					
					var editById = $(y).prop("id");
					iHtml = iHtml + CKEDITOR.instances[editById].getData();
				});
				
				content = iHtml;
				
				
				if( content != null && content != "" ) {				
					parent.contentAdd(content);
				} else {
					alert("컨텐츠 내용을 추가해 주세요.");
					return false;
				} */
				
			});
			
			$("#preview_content${_prefix}").off("click").on("click", function() {

				columnContentXhtml = $("#columnContainer").html();
				
				winPopUPCenter("/admin/column/previewPopup?${_csrf.parameterName}=${_csrf.token}", "previewPopup", 1000, 800, "yes", "yes");
				
				/*
				var page = $(this).data("opt");
				
				for(var z = 1; z <= $("#previewContainer").find("div.swiper-container").length; z++ )
				{
					    eval("var swiper_"+z+" = null");
				}		
				
				if( page == "preview" ) {
					
					$(this).data("opt", "publish");
					$(this).text("편집하기");
					$(".preview_only").show();
					$(".publish_only").hide();										
					
					var xhtml = $("#columnContainer").clone().prop("id", "valiableWidth");
					$("#valiableWidth").replaceWith(xhtml);
					$("#valiableWidth div").remove(".button-area");
					
					$("#previewContainer").show();
					
					if( $("#previewContainer").find("div.swiper-container").length > 0 ) {
						
						for(var z = 1; z <= $("#previewContainer").find("div.swiper-container").length; z++ )
						{
							    eval("swiper_"+z+" = new Swiper('.swiper-container-"+z+"', {slidePerView: 1,autoheight: true,centeredSlides: true,autoplay: {delay: 2500,disableOnInteraction: false},navigation: {nextEl: '.colum_slide_area .swiper-button-next',prevEl: '.colum_slide_area .swiper-button-prev',},pagination: {el: '.swiper-pagination',type: 'fraction'}})");
						}						
					}
					
				} else {
					
					$(".publish_only").show();
					$(".slideArea").show();
					$(".preview_only").hide();
					$(".swiper-wrapper").addClass("shortly");
					
					$(this).data("opt", "preview");
					$(this).text("미리보기");
					
					$("#previewContainer").hide();
					
					$(".swiper-container").each(function(){
					      this.swiper.destroy(); // <-- 'this' not 'this[0]' worked for me
					});
					
				}
				*/
								
			});
			
			/* 타입별 화면 보기 */
			$(".viewType").off("click").on("click", function() {
				
				var type = $(this).data("opt");
				
				if( type == "mobile" ) {
					
					$("#valiableWidth").width(320);
					$("#container_type").removeClass();
					$("#container_type").addClass("container_m");
					
				} else if( type == "tablet" ) {
					
					$("#valiableWidth").width(800);
					$("#container_type").removeClass();
					$("#container_type").addClass("container_t");
					
				} else {
					
					$("#valiableWidth").width("100%");
					$("#container_type").removeClass();
					$("#container_type").addClass("container_p");
					
				}
								
			});
	    	
	    })
	    
		function element_call($el, nth) {
	    	
			$(".common_element_pannel${_prefix}").panel({
				
    		    href	:	'/admin/templete/templetePanel/BD15',
    		    onLoad:function(){
    		    
    		    	setTimeout(function(){
		    		    	
		    		    	$(".detailBoxPanel_BD15").off("click").on("click", function() {
		    		    				    		    		
								var param = {};
								param.templete_idx = $(this).data("opt");
								param.templete_useyn = 'Y';
								
								$.ajax({
									url				 	:'/admin/interface/selectTemplete'
									,data 		 	: param
									,type    		 	: "POST"
									,dataType 	 	: "json"
									,success  		: function(data) {
										if( data ) {											
												$div = $el.closest(".button-area");
												
												while($("div#editor"+nth).length > 0 )
												{
													nth++;
												}
												
												var  xhtml = '';
													 xhtml += '<div class="button-area">';
													 xhtml += '	<button type="button" class="contentAdd">';
													 xhtml += '		<image src="/resources/admin/images/btn/icon_plus.png" alt="더보기" />';
													 xhtml += '	</button>';
													 xhtml += '</div>';
													 xhtml += '<div class="editor_area">';
													 xhtml += '	<div id="editor'+nth+'" class="editor_editable" contenteditable="true">'+data.templete_content+'</div>';
													 xhtml += '<span class="editor_delete">X</span></div>';
													 xhtml += '<div class="button-area">';
													 xhtml += '	<button type="button" class="contentAdd">';
													 xhtml += '		<image src="/resources/admin/images/btn/icon_plus.png" alt="더보기" />';
													 xhtml += '	</button>';
													 xhtml += '</div>';
													 
												if( data.templete_css != null && data.templete_css != "" ){													
													 xhtml += '<link rel="stylesheet" type="text/css" href="'+data.templete_css+'">';
												}
												if( data.templete_js != null && data.templete_js != "" ){
													 xhtml += '<script type="text/javascript" src="'+data.templete_js+'">';
												}
													 
												
												if( $(".editor_editable").find(".root_daum_roughmap").length > 0 ) {
													$(".root_daum_roughmap").closest(".editor_editable").attr("contenteditable", false);
													
													$div.replaceWith(xhtml);
												} else {
													$div.replaceWith(xhtml);
													CKEDITOR.inline( 'editor'+nth );
													CKEDITOR.config.allowedContent = true;
												}
																							
												$(".common_element_pannel${_prefix}").empty();
												deleteContent();
												
												/* 이미지 영역 확인 */
												setTimeout(function(){
													if( $("#columnContainer").find("div.img-single").length > 0 ) {
														$(".targetDropBox").off("click").on("click", function(e) {
															e.preventDefault();
															e.stopPropagation();
															
															var key = $(this).find("img").data("opt");
															
															file_call($(this), key);
														})	;													
													}
													
													if( $("#columnContainer").find("div.img-multi").length > 0 ) {
														$(".targetDropBox").off("click").on("click", function(e) {
															e.preventDefault();
															e.stopPropagation();
															
															var key = '';
															$(this).find("img").each(function(index){																
																if(index > 0) {
																	key += ',';
																}
																key += $(this).data("opt");
															});
															
															file_call($(this), key);
														})	;													
													}
													
													if( $("#columnContainer").find("div.swiper-container").length > 0 ) {
														$(".targetDropBox").off("click").on("click", function(e) {
															e.preventDefault();
															e.stopPropagation();
															
															var key = '';
															$(this).find("img").each(function(index){																
																if(index > 0) {
																	key += ',';
																}
																key += $(this).data("opt");
															});
															
															file_call($(this), key);
														})	;													
													}
												}, 500);
												
										}
										
										$(".contentAdd").off("click").on("click", function(){
											var nth = $(".contentAdd").index(this);											
											element_call($(this), nth);								    		
								    	});
										
									}
								
								});
								
							});
    		    	
    		    	}, 800);
    		    	
    		    }
    		});	
		}
	    
	    function file_call(currentBox, key) {
	    	
	    	$(".common_element_pannel${_prefix}").panel({
			    href	:	'/admin/file/landingFileRegForm?s_category=column&fileKey='+key,
			    onLoad:function(){
			    	
			    	setTimeout(function(){
			    		$(".dragitem").each(function() {
			    			var data = this.dataset;
			    			data = data.imgsrc + data.imgname; //데이터 경로
			    			var bgImg = $(this).find("img").attr("src");
				    		$(this).css({"width":"100%","height":"190px","box-sizing":"border-box"});
				    		$(this).find("div").css({"width":"100%","height":"100%","background":"url("+bgImg+")","background-size":"cover","background-position":"center"});
				    		$(this).find("img").css("display","none");
				    	})	
			    	}, 500);
			    	
			    	$("#btn_templete_update").off("click").on("click", function() {
			    		
			    		var nth = $(".column_checkbox:checked").length;
			    		
			    		if( $(currentBox).hasClass("img-multi") ) {
			    			
			    			if ( nth < 1 ) {
			    				
			    				alert("하나의 템플릿을 선택해 주세요.");
				    			return false;
				    			
			    			} else {
			    				
			    				var $ch = null;
			    				var $obj = null;
			    				var title = null;
			    				var filekey = null;
			    				var filepath = null;
			    				var b_filename = null;
			    				var imgsrc = null;
			    				
			    				var html = '';
			    				
			    				$(currentBox).empty();
			    				
			    				html = 	 '<ul class="col-2n">';
			    				
			    				$(".column_checkbox:checked").each(function(){ 
			    								
					    			$obj = $(this).closest(".checkbox_area").find(".dragitem");
					    			
					    			title = $obj.data("title");
					               	filekey = $obj.data("filekey");
					               	filepath = $obj.data("imgsrc");
					               	b_filename = $obj.data("imgname");
					               	imgsrc = $obj.find("div").find("img").attr("src");
					               	imgsrc = imgsrc.replace('url(','').replace(')','').replace(/\"/gi, "");
					               	
					               	html += '	<li><img src="'+ imgsrc +'"  data-opt="'+filekey+'" /></li>';
			    					
			    				});
			    				
			    				html += '</ul>'; 
				               	
				               	$(currentBox).html( html );   
				               	$(".common_element_pannel${_prefix}").empty();
			    				
			    			}
			    			
			    		} else if( $(currentBox).hasClass("img-slide") ) {
			    			
							if ( nth < 1 ) {
			    				
			    				alert("하나의 템플릿을 선택해 주세요.");
				    			return false;
				    			
			    			} else {
			    				
			    				var $ch = null;
			    				var $obj = null;
			    				var title = null;
			    				var filekey = null;
			    				var filepath = null;
			    				var b_filename = null;
			    				var imgsrc = null;
			    				
			    				var html = '';
			    				
			    				$(currentBox).empty();
				               	  
			    				$(".column_checkbox:checked").each(function(){ 
			    								
					    			$obj = $(this).closest(".checkbox_area").find(".dragitem");
					    			
					    			title = $obj.data("title");
					               	filekey = $obj.data("filekey");
					               	filepath = $obj.data("imgsrc");
					               	b_filename = $obj.data("imgname");
					               	imgsrc = $obj.find("div").find("img").attr("src");
					               	imgsrc = imgsrc.replace('url(','').replace(')','').replace(/\"/gi, "");
					               	
					                html += '<div class="swiper-slide">';
					               	html += '	<img src="'+ imgsrc +'" data-opt="'+filekey+'" />';
					               	html += '</div>';   
			    					
			    				});
			    				
				               	$(currentBox).html( html );   
				               	$(".common_element_pannel${_prefix}").empty();
			    			}
			    			
			    		} else {
			    			
			    			if ( nth != 1 ) {
				    			alert("하나의 템플릿을 선택해 주세요.");
				    			return false;
				    		} else {
				    			var $ch = $(".column_checkbox:checked");
				    			var $obj = $ch.closest(".checkbox_area").find(".dragitem");
				    			
				    			var title = $obj.data("title");
				               	var filekey = $obj.data("filekey");
				               	var filepath = $obj.data("imgsrc");
				               	var b_filename = $obj.data("imgname");
				               	var imgsrc = $obj.find("div").find("img").attr("src");
				               	imgsrc = imgsrc.replace('url(','').replace(')','').replace(/\"/gi, "");
				    			
				               	var html ='';
				                	html +='<img src="'+ imgsrc +'" data-opt="'+filekey+'" />';				               
				                $(currentBox).html( html );   
				                
				                $(".common_element_pannel${_prefix}").empty();
				    		}	
			    			
			    		}
			    		
			    	});
			    	
			    }	
	    	});
	    	
	    }
	    
	    function deleteContent() {
	    	
	    	$(".editor_area").on("mouseenter", function() {
				$del = $(this).find(".editor_delete");
				$del.show();
				
				if( $del ) {
					$del.on("click", function() {
						$edit = $(this).closest(".editor_area");
						$edit.prev().remove();
						$edit.remove();
					});
				}
			});
			
			$(".editor_area").on("mouseleave", function() {
				$del = $(this).find(".editor_delete");													
				$del.hide();
			})
			
	    }
	    
    </script>
        
    
</body>
</html>
