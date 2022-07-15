<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="bannerRegForm" style="background-color:#fff">
	

	<div id="bannerBodys" class="easyui-layout" style="width:100%;height:100%;">
	    <div data-options="region:'center',title:'배너상세설정'" style="padding:5px;">
				<div  id="banner_pannel" style="height:auto;padding:5px;border:0;overflow-x:hidden"  > 
					<div class="article_box_wrap cf" style="text-align:center">
						<div class="article_box article_box_left">
						   <form id="bannersub" name="bannersub" method="post">
						   <input type="hidden" id="bannersub_parentidx" name="bannersub_parentidx"/>
						   <input type="hidden" id="multifileidx" name="multifileidx"/>
						   <input type="hidden" id="bannersub_idx" name="bannersub_idx"/>
						   <input type="hidden" id="bannersub_webImg"   class="hidImgSrc" name="bannersub_webImg"/>
						   <input type="hidden" id="bannersub_etcImg"   class="hidImgSrc" name="bannersub_etcImg"/>
						   <input type="hidden" id="bannersub_mobImg"   class="hidImgSrc" name="bannersub_mobImg"/>
						   <input type="hidden" id="bannersub_spareImg" class="hidImgSrc" name="bannersub_spareImg"/>	       	       	       	       
						   <input type="hidden" id="bannersub_webImgfilekey"   class="hidImgSrc" name="bannersub_webImgfilekey"/>
						   <input type="hidden" id="bannersub_etcImgfilekey"   class="hidImgSrc" name="bannersub_etcImgfilekey"/>
						   <input type="hidden" id="bannersub_mobImgfilekey"   class="hidImgSrc" name="bannersub_mobImgfilekey"/>
						   <input type="hidden" id="bannersub_spareImgfilekey" class="hidImgSrc" name="bannersub_spareImgfilekey"/>
				
						   <div class="article_box_inner" style="background-color:#fff">
								<table class="table_st01">
									<colgroup>
										<col width="20%"/>
										<col width="*"/>
									</colgroup>
									<tbody>
										<tr>
											<th colspan="2"><span class="table_tit">이미지등록</span></th>
										</tr>
										<tr>
											<td colspan="2">
												<div class="img_register_wrap img_register_01">
													<ul class="cfs">
														<li>
															<a href="#" class="easyui-linkbutton imgdel" data-options="plain:true,iconCls:'icon-cancel'" style="display:none;position: absolute;left: 94%; z-index:1;"></a>
															<div class="easyui-droppable targetarea targetDropBox" id="target01" data-index="0" style="height:300px;">
																<img src="/admin/img/img_sample.jpg" alt="웹용 이미지">
															</div>
															<span class="img_txt">웹1</span>
														</li>
														<li>
															<a href="#" class="easyui-linkbutton imgdel" data-options="plain:true,iconCls:'icon-cancel'" style="display:none;position: absolute;left: 94%; z-index:1;"></a>
															<div class="easyui-droppable targetarea targetDropBox"  id="target02" data-index="1" style="height:300px;">
																<img src="/admin/img/img_sample.jpg" alt="기타 이미지">
															</div>
															<span class="img_txt">웹2</span>
														</li>
														<li>
															<a href="#" class="easyui-linkbutton imgdel" data-options="plain:true,iconCls:'icon-cancel'" style="display:none;position: absolute;left: 94%; z-index:1;" ></a>
															<div class="easyui-droppable targetarea targetDropBox" id="target03" data-index="2" style="height:300px;">
																<img src="/admin/img/img_sample.jpg" alt="예비 이미지">
															</div>
															<span class="img_txt">모바일1</span>
														</li>
														<li>
															<a href="#" class="easyui-linkbutton imgdel" data-options="plain:true,iconCls:'icon-cancel'" style="display:none;position: absolute;left: 94%; z-index:1;"></a>
															<div class="easyui-droppable targetarea targetDropBox" id="target04" data-index="3" style="height:300px;">
																<img src="/admin/img/img_sample.jpg" alt="예비 이미지">
															</div>
															<span class="img_txt">모바일2</span>
														</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr>
											<th><label for="" class="table_tit">요약</label></th>
											<td><input type="text" 
											name="bannersub_summary" id="bannersub_summary" class=" easyui-validatebox"  
											data-options="required: 'true',missingMessage:'요약은 필수입력입니다.'"
											placeholder=" 내용을 입력해주세요." 
											style="border:1px solid #ccc;width:95%"/></td>
										</tr>
										<tr>
											<th><label for="" class="table_tit">링크</label></th>
											<td><input type="text" style="border:1px solid #ccc;width:95%" name="bannersub_link" id="bannersub_link" class="easyui-validatebox"  data-options="required: 'true',missingMessage:'링크는 필수입력입니다.'"  placeholder=" 내용을 입력해주세요." /></td>
										</tr>
										<tr>
											<th><label for="" class="table_tit">템플릿 코드</label></th>
											<td><input type="text" style="border:1px solid #ccc;width:95%" name="bannersub_tag" id="bannersub_tag"   data-options="required: 'true'"  placeholder=" 내용을 입력해주세요." /></td>
										</tr>
										<tr>
											<th><span class="table_tit">노출기간</span></th>
											<td style="text-align:left"> 
												<div class="period_wrap">
														<input id="bannersub_showstrdate" name="bannersub_showstrdate"  
														class="easyui-datetimebox easyui-validatebox"   data-options="required: 'true',missingMessage:'노출기간은 필수 입력입니다.'"  style="width:200px">
														
														
														~ <input  id="bannersub_showenddate" name="bannersub_showenddate" 
														class="easyui-datetimebox easyui-validatebox" data-options="required: 'true',missingMessage:'노출기간은 필수 입력입니다.'" style="width:200px">
												</div> <!-- //period_wrap -->
											</td>
										</tr>
										<tr>
											<th><span class="table_tit">게시여부</span></th>
											<td style="text-align:left">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" id="bannersub_showY" name="bannersub_show" value="Y" checked>
															<span class="icon_radio">게시</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" id="bannersub_showN" name="bannersub_show" value="N">
															<span class="icon_radio">게시안함</span>
														</label>
													</li>
												</ul> <!-- //radio_wrap -->
											</td>
										</tr>
										<tr>
											<th><span class="table_tit">링크타입</span></th>
											<td style="text-align:left">
												<ul class="radio_wrap radio_st01">
													<li>
														<label>
															<input type="radio" id="bannersub_winpop" name="bannersub_linktype" value="Y" checked>
															<span class="icon_radio">새창</span>
														</label>
													</li>
													<li>
														<label>
															<input type="radio" id="bannersub_selfpop" name="bannersub_linktype" value="N">
															<span class="icon_radio">페이지이동</span>
														</label>
													</li>
												</ul> <!-- //radio_wrap -->
											</td>
										</tr>
										<tr>
											<th><label for="" class="table_tit">노출순서</label></th>
											<td>
												<div class="input_st01">
													<input type="text" class="easyui-numberbox"  name="bannersub_showorder" id="bannersub_showorder"  data-options="required: 'true',missingMessage:'노출순서는 필수 입력입니다.'" class="easyui-validatebox" placeholder="내용을 입력해주세요." style="width:30%"/>
													<span class="input_ex">※ 노출순서가 같은 경우 등록된 최신 순서로 우선으로 노출됩니다.</span>
												</div>
											</td>
										</tr>
										<tr>
											<th><label for="" class="table_tit">설명</label></th>
											<td>
												<textarea name="bannersub_explan" id="bannersub_explan" cols="30" rows="7"  data-options="required: 'true',missingMessage:'설명은 필수입력입니다.'" class="easyui-validatebox" placeholder="내용을 입력해주세요."></textarea>
											</td>
										</tr>
									</tbody>
								</table> <!-- //article_box_wrap -->
								<div class="bd_btn_wrap">
									<ul>
										<li><button id="bannersubSave" type="button" >확인</button></li>
										<c:if test="${_banner.bannersub_idx > 0}">
										<!-- <li><button id="bannersubDel" type="button" >삭제</button></li> -->
										</c:if>
									</ul>
								</div> <!-- //bd_btn_wrap -->
						   </div> <!-- //article_box_inner -->
				
						   </form>
						</div> <!-- //article_box_left -->					
					
					</div>
				</div>	    
	    </div>
	    <div data-options="region:'east',title:'업로드',split:false" style="width:432px;">
	    	<div  class="common_file_pannel${_prefix}" style="height:auto;padding:5px;border:0;overflow:hidden"  > 
	    	</div>
	    </div>	    
	</div>
	
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript" src="/common/js/jquery.tmpl.plus.js"></script>
	<%@ include file="/WEB-INF/views/front/inc/common_banner_js.jsp" %>
	
	<style>
		td { text-align:left}
		td input {border : 1px solid #ccc}
	</style>
	
	<script type="text/javascript">
	
			var $upCategory = "${_banner.s_category}";
			var $bannersub_idx = "${_banner.bannersub_idx}";
			$(".common_file_pannel${_prefix}").panel({
			    href	:	'/admin/file/commonFileRegForm?s_category='+$upCategory					,
			    onLoad:function(){
			        
			    }
			});		
	
	</script>
   	<script type="text/javascript">
   		var html='';
   		var editor;
   		var textarea;

	   		$(document).ready(function(){
	   			
	   			if($bannersub_idx == ""){
	   				textarea = document.getElementById('bannersub_explan');
    				editor = CodeMirror.fromTextArea(textarea, {
    				    lineNumbers: true,
    				    lineWrapping: true,
    				    theme: "eclipse",
    				    mode: "javascript",
    				    val: textarea.value
    				});
	   			}
	   			
	   			if($bannersub_idx != ""){
	   				$("#bannersub_idx").val($bannersub_idx);
	   				var queryString = $("#bannersub").serializeObject();
		        	$.ajax({
		        		type: "POST",
		        		url: "/admin/interface/selectBannersubUpdateInfo",
		        		dataType:"json",
		        		data : queryString,
		        		success: function(data){
		        			if(data != null && data != undefined)
		        			{		        				
		        				$("#bannersub_summary").val(data.rows[0].bannersub_summary);
		        				$("#bannersub_link").val(data.rows[0].bannersub_link);
		        				$("#bannersub_tag").val(data.rows[0].bannersub_tag);		        				
		        				
		        				$('#bannersub_showstrdate').datetimebox('setValue', data.rows[0].bannersub_showstrdate );	
		        				$('#bannersub_showenddate').datetimebox('setValue', data.rows[0].bannersub_showenddate );
		        				
		        				$("#bannersub_showenddate").val(data.rows[0].bannersub_showenddate);
		        				
		        				if(data.rows[0].bannersub_webImg != ""){
		        					$("#target01").find("img").remove();
		        					$("#target01").append('<img src="' + _web_path + data.rows[0].bannersub_webImg + '"/>');
		        					$("#target01").next().text(data.rows[0].weboriname);
		        					$("#target01").prev().css("display","block");
		        					$("#bannersub_webImg").val(data.rows[0].bannersub_webImg);
		        					$("#bannersub_webImgfilekey").val(data.rows[0].bannersub_webImgfilekey);
		        				}
		        				if(data.rows[0].bannersub_etcImg != ""){
		        					$("#target02").find("img").remove();
			        				$("#target02").append('<img src="' + _web_path + data.rows[0].bannersub_etcImg + '"/>');
			        				$("#target02").next().text(data.rows[0].ectoriname);
			        				$("#target02").prev().css("display","block");
			        				$("#bannersub_etcImg").val(data.rows[0].bannersub_etcImg);
		        					$("#bannersub_etcImgfilekey").val(data.rows[0].bannersub_etcImgfilekey);
		        				}
		        				if(data.rows[0].bannersub_mobImg != ""){
		        					$("#target03").find("img").remove();
			        				$("#target03").append('<img src="' + _web_path + data.rows[0].bannersub_mobImg + '"/>');
			        				$("#target03").next().text(data.rows[0].moboriname);
			        				$("#target03").prev().css("display","block");
			        				$("#bannersub_mobImg").val(data.rows[0].bannersub_mobImg);
		        					$("#bannersub_mobImgfilekey").val(data.rows[0].bannersub_mobImgfilekey);
		        				}
		        				if(data.rows[0].bannersub_spareImg != ""){
		        					$("#target04").find("img").remove();
		        					$("#target04").append('<img src="' + _web_path + data.rows[0].bannersub_spareImg + '"/>');
		        					$("#target04").next().text(data.rows[0].spareoriname);
		        					$("#target04").prev().css("display","block");
		        					$("#bannersub_spareImg").val(data.rows[0].bannersub_spareImg);
		        					$("#bannersub_spareImgfilekey").val(data.rows[0].bannersub_spareImgfilekey);
		        				}
		        				
		        				   $(".imgdel").off("click").on("click", function(){
		  							 
		  							 $(this).next().find("img").attr('src','/admin/img/img_sample.jpg')
		  							
		  							 if($(this).next().data("index") == 0)
		  							 {
		  								 $(this).next().next().text("웹1");
		  								 $("#bannersub_webImg").val("");
		  								 $("#bannersub_webImgfilekey").val("");
		  							 }
		  							 else if($(this).next().data("index") == 1){
		  								 $(this).next().next().text("웹2");
		  								 $("#bannersub_etcImg").val("");
		  								 $("#bannersub_etcImgfilekey").val("");
		  							 }
		  							 else if($(this).next().data("index") == 2){
		  								 $(this).next().next().text("모바일1");
		  								 $("#bannersub_mobImg").val("");
		  								 $("#bannersub_mobImgfilekey").val("");
		  							 }
		  							else {
		  								 $(this).next().next().text("모바일2");
		  								 $("#bannersub_spareImg").val("");
		  								 $("#bannersub_spareImgfilekey").val("");
		  							 }
		  						 
		  					  });
		        				   
		        				var radiochk = data.rows[0].bannersub_show;
		        				if(radiochk == "Y"){
		        					jQuery("#bannersub_showY").attr('checked', true);
		        					jQuery("#bannersub_showN").attr('checked', false);
		        				}
		        				else{
		        					jQuery("#bannersub_showN").attr('checked', true);
		        					jQuery("#bannersub_showY").attr('checked', false);
		        				}
		        				
		        				radiochk = data.rows[0].bannersub_linktype;
		        				if(radiochk == "Y"){
		        					jQuery("#bannersub_winpop").attr('checked', true);
		        					jQuery("#bannersub_selfpop").attr('checked', false);
		        				}
		        				else{
		        					jQuery("#bannersub_winpop").attr('checked', false);
		        					jQuery("#bannersub_selfpop").attr('checked', true);
		        				} 
		        	
		        				
		        	
		        				$("#bannersub_showorder").numberbox('setValue',data.rows[0].bannersub_showorder);
		        				$("#bannersub_explan").val(data.rows[0].bannersub_explan);
		        				
		        				textarea = document.getElementById('bannersub_explan');
		        				editor = CodeMirror.fromTextArea(textarea, {
		        				    lineNumbers: true,
		        				    lineWrapping: true,
		        				    theme: "eclipse",
		        				    mode: "javascript",
		        				    val: textarea.value
		        				});
		        				
		        				/* setTimeout (function(){
		        					var textarea = document.getElementById('bannersub_explan');
			        				var editor = CodeMirror.fromTextArea(textarea, {
			        				    lineNumbers: true,
			        				    lineWrapping: true,
			        				    theme: "eclipse",
			        				    val: textarea.value
			        				});
		        				},200); */
		        				
		        				loadBanner();
		        				
		        			}
		        			
		        		},
		        		error: function(xhr, status, error){
		        			alert("error >>> " + error);
		        		},
		        		complete:function(xhr, textStatus){
		        		}
		        	});
	   			}
	   			 setTimeout(function(){
	   				$("#bannersub_showstrdate").next("span").find("input").prop("readonly", true);
	   				$("#bannersub_showenddate").next("span").find("input").prop("readonly", true);
	   			 },500);
   			 $("#bannersubDel").off("click").on("click", function(){
   				$.ajax({
	        		type: "POST",
	        		url: "/admin/interface/deleteBannerInfo",
	        		dataType:"json",
	        		data : "bannersub_idx="+$bannersub_idx,
	        		success: function(data){
	        			if(data != null && data != undefined)
	        			{
	        				parent.bannerListReload();
	        			}
	        			
	        		},
	        		error: function(xhr, status, error){
	        			alert(error);
	        		},
	        		complete:function(xhr, textStatus){
	        			
	        		}
	        	});
   			 });
			 $("#bannersubSave").click(function(){
		        	$("#bannersub_parentidx").val("${_banner.bannersub_parentidx}");
		        	
		        	
		        	
		        	if($("#bannersub_parentidx").val() == ""){
		        		alert($("#bannersub_parentidx").val());
		        		return;
		        	}
		        	
		        	if($("#bannersub_showorder").val() == "")
		        	{
		        		$("#bannersub_showorder").val("999");
		        	}
		        	
		        	if($("#target01").find("img").attr("src") == undefined && $("#target02").find("img").attr("src") == undefined && $("#target03").find("img").attr("src") == undefined && $("#target04").find("img").attr("src") == undefined)
		        	{
		        		alert("최소한 1개 이상의 이미지를 등록해주세요.")
		        		return;
		        	}
		        	
		        	$("#bannersub_explan").val(editor.getValue());
		       		
		        	if ( $("#bannersub").form('validate') == false )
		        	{
		        		alert('내용을 다 입력해주세요. 다시 확인해주시기 바랍니다.');
		        		return;	
		        	}
		        	var format = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		        	var str = $("#bannersub_showstrdate").val().split(" ")[0];
		        	
		        	 if(!format.test(str)) {
		        		alert("달력을 이용하여 날짜를 입력해주세요.");
		        		return;
		        	} 
		        	 str = $("#bannersub_showenddate").val().split(" ")[0];
		        	if(!format.test(str)) {
		        		alert("달력을 이용하여 날짜를 입력해주세요.");
						return;
		        	} 
		        	
		        	var queryString = $("#bannersub").serializeObject();
		        	
		        	$.ajax({
		        		type: "POST",
		        		url: "/admin/interface/insertBannersub",
		        		dataType:"json",
		        		data : queryString,
		        		success: function(data){
		        			if(data != null && data != undefined)
		        			{
		        				parent.bannerListReload();
		        			}
		        			
		        		},
		        		error: function(xhr, status, error){
		        			alert("error >> " + error);
		        		},
		        		complete:function(xhr, textStatus){
		        		}
		        	});			   
		     });

			 
			 
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
					   if(optNum == 0) //웹용이미지
					   {
						   $("#bannersub_webImg").val(filepath + b_filename);
						   $("#bannersub_webImgfilekey").val(filekey);
					   }
					   if(optNum == 1) //기타이미지
					   {
						   $("#bannersub_etcImg").val(filepath + b_filename);
						   $("#bannersub_etcImgfilekey").val(filekey);
					   }
					   if(optNum == 2) //예비이미지
					   {
						   $("#bannersub_mobImg").val(filepath + b_filename);
						   $("#bannersub_mobImgfilekey").val(filekey);
					   }
					   if(optNum == 3) //예비이미지
					   {
						   $("#bannersub_spareImg").val(filepath + b_filename);
						   $("#bannersub_spareImgfilekey").val(filekey);
					   }
					   var html ='<img src="'+ filepath + b_filename +'" />';
		               $(this).next().html(title);
		               $(this).html( html );
		          	   	
		               $(this).prev().css("display", "block");
		               
		  			   $(".imgdel").off("click").on("click", function(){
							 //$(this).next().find("img").remove();
							 $(this).next().find("img").attr('src','/admin/img/img_sample.jpg')
							
							 if($(this).next().data("index") == 0)
							 {
								 $(this).next().next().text("웹1");
								 $("#bannersub_webImg").val("");
								 $("#bannersub_webImgfilekey").val("");
							 }
							 else if($(this).next().data("index") == 1){
								 $(this).next().next().text("웹2");
								 $("#bannersub_etcImg").val("");
								 $("#bannersub_etcImgfilekey").val("");
							 }
							 else if($(this).next().data("index") == 2){
								 $(this).next().next().text("모바일1");
								 $("#bannersub_mobImg").val("");
								 $("#bannersub_mobImgfilekey").val("");
							 }
							 else{
								 $(this).next().next().text("모바일2");
								 $("#bannersub_spareImg").val("");
								 $("#bannersub_spareImgfilekey").val("");
							 }
						 
					  });		               
		        }    				
   			});	
   		});
	   		
   		function loadBanner(){
	   			
   				$bannerCom.set({
   					bannersub_parentidx : ""
					, 	banner_gnb		 		: ""
					, 	bannersub_show	 		: "Y"
					, 	box					 	: "#banner"
					,   templeat				: "#tmpl_main_banner"
	   				,	onCompleate        		: function(){
	   		        	
	   		        }
	   			})
	   			
	   	};	
		        	
   		
   		$.fn.datetimebox.defaults.formatter = function (date) {
   		    console.log('dt formatting '+date);
   		    if (!(date instanceof Date)) date = new Date(date);
   		    
   		    
   		    var h = date.getHours();
   		    var M = date.getMinutes();
   		    var s = date.getSeconds();

   		    function _ff(v) {
   		        return (v < 10 ? "0" : "") + v;
   		    };
   		    return _ff(date.getFullYear())+'-'+_ff(date.getMonth()+1)+'-'+ _ff( date.getDate() ) + ' ' + _ff(h)+':'+_ff(M)+':'+_ff(s);
   		};
   		
   		$.fn.datetimebox.defaults.parser = function (s) {
   		    if ($.trim(s) == "") {
   		        return new Date();
   		    }

   		    var dt = s.split(" ");
   		    var p1 = dt[0].split('-');
   		    var p2 = dt[1].split(':');

   		    return new Date(p1[0],p1[1]-1,p1[2],p2[0],p2[1],p2[2]);
   		};		        	
   		
   	</script>
</body>
</html>