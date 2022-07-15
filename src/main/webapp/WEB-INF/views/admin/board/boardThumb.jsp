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
<body id="baordBody">
	<div class="easyui-panel" title="게시판관리 > ${boardOptionList[0].tcd_title} "
		style="height: 120px; padding: 5px; border: 0;"
		data-options="iconCls:'icon-redo'">
		<div id="p${_prefix}" class="easyui-panel" title="검색창"
			style="width: 100%; height: 100%; padding-left: 10px; padding-top: 15px"
			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">
			<div>
				<c:if test="${boardOptionList[0].tcd_attr2 ne 'N'}">
					<select class="easyui-combobox searchSel" id="board_cate_L_${_prefix}"  data-prefix="${_prefix}" style="width: 10%;"></select>
					<c:if test="${boardOptionList[0].tcd_code =='BD13'}">
					<select class="easyui-combobox searchSel" id="board_cate_M_${_prefix}"  data-prefix="${_prefix}" style="width: 10%;"></select>
					</c:if>
				</c:if>
				<select class="easyui-combobox searchSel" id="board_search_show${_prefix}" style="width: 10%">
					<option value="ALL" selected="selected">전체</option>
					<c:if test="${boardOptionList[0].tcd_code =='BD07' || boardOptionList[0].tcd_code =='BD13'}">
					<option value="NAME">이름</option>
					</c:if>
					<c:if test="${boardOptionList[0].tcd_code =='BD05'}">
					<option value="ACTOR">이름</option>
					</c:if>
					<option value="Y">게시</option>
					<option value="N">게시안함</option>
				</select>
				<input id="search_box${_prefix}" data-prefix="${_prefix}" class="easyui-textbox"style="width: 50%;">
			</div>
		</div>
	</div>

	<div class="easyui-panel" style="height: auto; padding: 5px; border: 0;">
		<table id="dg${_prefix}" title="${boardOptionList[0].tcd_title}" class="" style="width: 100%; height: auto">
		</table>
	</div>
	<div id="tb${_prefix}" style="height: auto;padding:5px;width:1630px;">
		<div class="panel-header" style="width: 1630px;"><div class="panel-title">${boardOptionList[0].tcd_title}</div></div>
		<div id="thumbList${_prefix}"	class="board_news_area board_star_area">
		</div>
		<div class="datagrid-pager" style="border:1px solid #eee;width:1630px;">
			<div id="listPage${_prefix}"></div>
		</div>		
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp"%>

	<script type="text/javascript">
    		
    		/** 전역 Plugin를 만들어야 한다.**/
    		var $page = 1;
   			var $rows = 11;
    		var ${_prefix} = {
    				
					_data : new Array() ,
					init : function(param){
    			
						$('#search_box${_prefix}').textbox({
							prompt: '검색어를 입력하세요',
							iconWidth: 22,
							icons: [
											{
												iconCls:'icon-search',
												handler: function(e){
													
														var getValue = $(e.data.target).textbox('getValue');
														var board_cate_L_search = ""
														var board_cate_M_search = ""
														
														<c:if test="${boardOptionList[0].tcd_attr2 ne 'N'}">
															board_cate_L_search = $("#board_cate_L_${_prefix} option:selected").val();
															if("${_prefix == 'BD13'}"){
															board_cate_M_search = $("#board_cate_M_${_prefix} option:selected").val();	
															}
														</c:if>
																												
														var param = {};
																												
														param.board_search = getValue;
														param.board_search_show = $("#board_search_show${_prefix}").val();
														if($("#board_search_show${_prefix}").val() == "NAME"){
															param.board_search_divide = "NAME";
														}
														else if($("#board_search_show${_prefix}").val() == "ACTOR"){
															param.board_search_divide = "ACTOR";
														}
														else{
															param.board_search_divide = "";
														}
														
														param.board_cate_L_search = board_cate_L_search;
														param.board_cate_M_search = board_cate_M_search
														param.rows = $rows;
														param.page = 1;
														${_prefix}.dataload( param ); 
												}
											}
											,
											{
												iconCls:'icon-reload',
												handler: function(e){
													$(e.data.target).textbox('clear');
													
													var param = {};
													param.rows = $rows;
													param.page = 1;
													${_prefix}.dataload( param  ); 				    						
												}
											}
										]
						
						});   
						
						${_prefix}._data.push("a");
						${_prefix}._data.push("b");

						param.board_search_show = "ALL";
						param.rows = $rows;
						param.page = $page;
						
						this.dataload( param );
						
						$("#insertBtn${_prefix}").off("click");
						$("#insertBtn${_prefix}").on("click", function(){

						});
						
					}
					,
					
					dataload  : function(param){
						
						$.ajax({  
							   url				 :'/admin/interface/selectBoard/${menu_code}'
				              ,data 			 : param
				              ,type    		 : "POST"
				              ,dataType 	 : "json"
				              ,success  : function(data) {
				            	  	
				            	  	var html = '';
									html += '<ul class="board_news">';
									
									/** 컨텐츠 추가하기 버튼 **/
									if( data.rows[0].board_menu_code != "BD10" ){
										html += '	<li class="board_news_box">';
										html += '		<a href="javascript:void(0)" class="addBoardWinCallBtn" id="addBoardWinCallBtn${_prefix}" data-prefix="${_prefix}" menu_code_text="${boardOptionList[0].tcd_title}">컨텐츠 추가</a>';
										html += '	</li>';
									}
				            	  	
									if( data.rows.length > 0 ) {
										
										console.log("rows");
										
										$page = data.rows[0].page;
										
										$("#thumbList${_prefix}").removeClass();
										if( data.rows[0].board_menu_code == "BD07") {
											$("#thumbList${_prefix}").addClass("board_bna_area");
										} else if( data.rows[0].board_menu_code == "BD05") {
											$("#thumbList${_prefix}").addClass("board_star_area");
										} else {
											$("#thumbList${_prefix}").addClass("board_news_area");
										}
										
										
										for (var i = 0; i < data.rows.length; i++) 
										{
											var title = textLength(data.rows[i].board_title, 30);
											
											var file = data.rows[i].save_file;
											var fileName = null;
											var fileNameArr = null;
											var fileArr = null;
											var newFileArr = null;
											
											if(data.rows[i].save_file != '' && data.rows[i].save_file != null ) 
											{
												if( data.rows[i].fileName != '' && data.rows[i].fileName != null ) {
													file = data.rows[i].fileName;
													filePath =data.rows[i].filePath;
													
													filePathArr = filePath.split('|');
												}
												
												fileArr = file.split('|');
											}
											
											if(data.rows[i].new_file != '' && data.rows[i].new_file != null ) 
											{
												newFileArr = data.rows[i].new_file.split('|');
											}
											
											html += '	<li class="board_news_box">';
											html += '		<a href="javascript:void(0)" class="detailBox${_prefix}" data-opt="'+data.rows[i].board_idx+'">';
											html += '			<div class="box">';
											
											
											if(data.rows[i].save_file != '' && data.rows[i].save_file != null ) {
												if( data.rows[i].fileName != '' && data.rows[i].fileName != null ) {
													if(!(filePathArr[0]+'/'+fileArr[0]).complete){
														html += '				<p class="img_wrap"><span><img src="/common/images/noimg.jpg" alt=""></span></p>';
													}else{
														html += '				<p class="img_wrap"><span><img src="'+filePathArr[0]+'/'+fileArr[0]+'" alt=""></span></p>';
													}
													
												} else {
													//html += '				<p class="img_wrap"><span><img src="/common/images'+fileArr[0]+'" alt=""></span><span><img src="/common/images'+fileArr[1]+'" alt=""></span></p>';
													
													if(data.rows[0].board_menu_code == 'BD07' || data.rows[0].board_menu_code == 'BD13'){
														if(fileArr[0].indexOf("http") > -1){
															html += '				<p class="img_wrap"><span><img style="width:50%" src="'+fileArr[0]+'" alt="">';
															html += '				<img style="width:50%;left:50%;" src="'+fileArr[1]+'" alt=""></span></p>';
														}else{
															html += '				<p class="img_wrap"><span><img style="width:50%" src="/common/images'+fileArr[0]+'" alt="">';
															html += '				<img style="width:50%;left:50%;" src="/common/images'+fileArr[1]+'" alt=""></span></p>';
														}
														
													}else{
														html += '				<p class="img_wrap"><span><img src="'+fileArr[0]+'" alt=""></span></p>';
														
														/* if(fileArr[0].indexOf("http") > -1){
															html += '				<p class="img_wrap"><span><img src="'+fileArr[0]+'" alt=""></span></p>';
														}else{
															html += '				<p class="img_wrap"><span><img src="/common/images'+fileArr[0]+'" alt=""></span></p>';
														} */
													} 
												}
											} else if(data.rows[i].new_file != '' && data.rows[i].new_file != null ) {
												if(data.rows[0].board_menu_code == 'BD07' || data.rows[0].board_menu_code == 'BD13'){
													html += '				<p class="img_wrap"><span><img style="width:50%" src="/resources/nas'+newFileArr[0]+'" alt="">';
													html += '				<img style="width:50%;left:50%;" src="/resources/nas'+newFileArr[1]+'" alt=""></span></p>';
												}else{
													html += '				<p class="img_wrap"><span><img src="/resources/nas'+newFileArr[0]+'" alt=""></span></p>';
												}
												
											}else{
												if(data.rows[i].board_etc9 !=null && data.rows[i].board_etc9 !=''){
													var dragFile = data.rows[i].board_etc9;
													var dragArr = dragFile.split('|');
													html += '				<p class="img_wrap"><span><img style="width:50%" src="'+dragArr[0]+'" alt="">';
													html += '				<img style="width:50%;left:50%;" src="'+dragArr[1]+'" alt=""></span></p>';
												}else{
													if(data.rows[i].board_url !=null && data.rows[i].board_url !=''){
														html += '				<p class="img_wrap"><div class="video_box"><iframe src="'+data.rows[i].board_url+'" frameborder="0"></iframe></div></p>';
													}else{
														html += '				<p class="img_wrap"><span><img src="/common/images/noimg.jpg" alt=""></span></p>';
													}
												}
											}										
											
											html += '				<div class="cbox">';
											if(data.rows[0].board_menu_code == 'BD05'){
												html += '					<p class="title">'+title+'|<strong style="color:#000000;font-weight:bold;font-size:130%;">'+data.rows[i].board_etc1+'</strong></p>';
											}else if(data.rows[0].board_menu_code == 'BD07'){
												html += '					<p class="title">'+title+'|<strong style="color:#000000;font-weight:bold;font-size:130%;">'+data.rows[i].board_reg_name+'</strong></p>';
											}else if(data.rows[0].board_menu_code == 'BD13'){
												html += '					<p class="title">'+title+'</p>';
												html += '					<p class="title"><strong style="color:#000000;font-weight:bold;font-size:130%;">'+data.rows[i].board_reg_name+'</strong></p>';
											}else{
												html += '					<p class="title">'+title+'</p>';
											}
											html += '					<p class="date">'+data.rows[i].board_reg_date+'</p>';
											html += '				</div>';
											html += '			</div>';
											html += '		</a>';
											html += '	</li>';				
										}
																
																				
									}
									
									html += '</ul>';
									
									$("#thumbList${_prefix}").html(html);
									
									$("#addBoardWinCallBtn${_prefix}").off("click").on("click", function(){
					    				
					        			var menu_code_text = $(this).attr("menu_code_text");
					        			var $windowTarget = $("#w" +  $(this).data("prefix"));
					        			$windowTarget.window('center').window('open');
					        			$windowTarget.window('refresh', '/admin/board/boardForm/'+menu_code_text+'?board_idx=');    				
					    				
					    			});
									
									$(".detailBox${_prefix}").off("click").on("click", function() {
										
										var board_idx = $(this).data("opt");
										var menu_code_text = $('.tabs-selected').children().children(".tabs-title").text();
																				
										$('#w${_prefix}').window('center').window('open');
				    			    	
				    					$('#w${_prefix}').window('refresh', '/admin/board/boardForm/'+menu_code_text+'?board_idx=' + board_idx);
				    			    	
									})
									
									$('#listPage${_prefix}').pagination({
									    total: data.total		,
									    pageList : [11,22,33,44,55]		,
									    pageSize:	$rows	,
									    onSelectPage : function(pageNumber, pageSize){									    	
											param.page = pageNumber;
											param.rows = pageSize;
											$rows = pageSize;
									    	${_prefix}.dataload( param );
									    }
									});
				              }
							   
		           		}); 
						
    				}
    		};    		
			
    		/** 실제 로직화 구현**/
    		
    		$(document).ready(function(){
    			
    			fnCommonCodeSearch("board_cate_L_${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>", 0,null);
    			
    			
				var param = {};
				${_prefix}.init( param );
				 
				function fnCommonCodeSearch(appendId, code, level, p_code) {
	    			var treePrm = {};
					treePrm.search_master = code;
					treePrm.tcd_useyn = "Y";
					
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
				            	if( "${_prefix == 'BD13'}" ){
				            		
					            	$('#'+appendId).combobox({
					            		onChange : function(newValue,oldValue){			            			
					            			if( appendId == "board_cate_L_${_prefix}" ) {
					            				fnCommonCodeSearch("board_cate_M_${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>", 1, newValue);
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
    		});
    		    		
    		function boardReload(_prefix)
        	{
    			var prefix = "_" + _prefix;
    			$('#w' + prefix).window('close');
    			${_prefix}.dataload(); 
        	}
    		
    		function textLength(str, len) 
    		{
    			var returnValue = ""
    			
    			if( !len || len == "" )
    			{
    				return str;	
    			}
    			
    			if( str.length > len )
    			{
    				returnValue = str.substring(0, len)+"...";    				
    			}
    			else
    			{
    				returnValue = str;
    			}
    			
    			return returnValue;
    		}
    		
    		function ImageExist(url) 
    		{
    			$.ajax({
    			    url: url,
    			    type:'HEAD',
    			    error: function()
    			    {
    			        return false;
    			    },
    			    success: function()
    			    {
    			        return true;
    			    }
    			});
    		}
    		
    </script>
    <div id="w${_prefix}" class="easyui-window" title="${boardOptionList[0].tcd_title}" data-options="modal:true ,closed:true" style="width:90%;height:90%;padding:10px;">
    </div>
    
</body>
</html>
