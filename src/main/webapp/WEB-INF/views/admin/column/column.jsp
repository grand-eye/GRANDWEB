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
	<div class="easyui-panel" title="칼럼관리 > 칼럼리스트"
		style="height: 120px; padding: 5px; border: 0;"
		data-options="iconCls:'icon-redo'">
		<div id="p${_prefix}" class="easyui-panel" title="검색창"
			style="width: 100%; height: 100%; padding-left: 10px; padding-top: 15px"
			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">
			<div>				
				<select class="easyui-combobox searchSel" id="column_cate_${_prefix}"  data-prefix="${_prefix}" style="width: 10%;"></select>
				
				<input id="search_box${_prefix}" data-prefix="${_prefix}" class="easyui-textbox"style="width: 50%;">
			</div>
		</div>
	</div>

	<div class="easyui-panel" style="height: auto; padding: 5px; border: 0;">
		<table id="dg${_prefix}"  class="" style="width: 100%; height: auto">
		</table>
	</div>
	<div id="tb${_prefix}" style="height: auto;padding:5px;width:1620px;">
		<div class="panel-header" style="width: 1620px;"><div class="panel-title">칼럼리스트</div></div>
		<div id="thumbList${_prefix}"	class="board_news_area">
		</div>
		<div class="datagrid-pager" style="border:1px solid #eee;width:1620px;">
			<div id="listPage${_prefix}"></div>
		</div>		
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>

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
														var column_cate_search = "";
														column_cate_search = $("#column_cate_${_prefix} option:selected").val();
																												
														var param = {};
													
														param.board_search = getValue;
														param.column_cate_search = column_cate_search;
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

						param.rows = $rows;
						param.page = $page;
						
						this.dataload( param );
						
					}
					,
					
					dataload  : function(param){
						$.ajax({  
							   url				 :'/admin/interface/selectColumnList'
				              ,data 			 : param
				              ,type    		 : "POST"
				              ,dataType 	 : "json"
				              ,success  : function(data) {				            	  						
									
				            	  if( data.total == 0 ) {
				            		  
				            		  var html = '';
										html += '<ul class="board_news">';
										html += '	<li class="board_news_box">';
										html += '		<a href="javascript:void(0)" class="addBoardWinCallBtn" id="addBoardWinCallBtn${_prefix}" data-prefix="${_prefix}"  menu_code_text="칼럼페이지">칼럼페이지 추가</a>';
										html += '	</li>';
										html += '</ul>';
										
										$("#thumbList${_prefix}").html(html);
				            	  } else {
				            	  
										if( data.rows.length > 0 ) {
											
											$page = data.rows[0].page;
											
											var html = '';
											html += '<ul class="board_news">';
											html += '	<li class="board_news_box">';
											html += '		<a href="javascript:void(0)" class="addBoardWinCallBtn" id="addBoardWinCallBtn${_prefix}" data-prefix="${_prefix}" menu_code_text="칼럼페이지">칼럼페이지 추가</a>';
											html += '	</li>';
											
											for (var i = 0; i < data.rows.length; i++) 
											{
												var title = textLength(data.rows[i].column_title, 30);
																								
												var file = data.rows[i].column_thum;
												var fileName = null;
												var fileArr = null;
																								
												if(data.rows[i].column_thum != '' && data.rows[i].column_thum != null ) 
												{
													if( data.rows[i].fileName != '' && data.rows[i].fileName != null ) {
														file = data.rows[i].fileName;
														filePath =data.rows[i].filePath;														
													}
												}
												
																						
												html += '	<li class="board_news_box">';
												html += '		<a href="javascript:void(0)" class="detailBox${_prefix}" data-opt="'+data.rows[i].column_idx+'">';
												html += '			<div class="box">';
												
												if( data.rows[i].fileName != '' && data.rows[i].fileName != null ) {
													if(!(data.rows[i].filePath+'/'+data.rows[i].fileName).complete){
														html += '				<p class="img_wrap"><span><img src="/common/images/noimg.jpg" alt=""></span></p>';
													}else{
														html += '				<p class="img_wrap"><span><img src="${_webPath}'+data.rows[i].filePath+'/'+data.rows[i].fileName+'" alt=""></span></p>';
													}
													
												} else if(data.rows[i].column_thum != '' && data.rows[i].column_thum != null ) {
													
													html += '				<p class="img_wrap" style="border:1px solid #e4e4e4;"><span><img src="/common/images'+data.rows[i].column_thum+'" alt=""></span></p>';													
												}
																								
												html += '				<div class="cbox">';
												html += '					<p class="title">'+title+'</p>';
												html += '				</div>';
												html += '			</div>';
												html += '		</a>';
												html += '	</li>';				
											}
																	
											html += '</ul>';
											
											$("#thumbList${_prefix}").html(html);										
										}
				            	  	}
									
									$("#addBoardWinCallBtn${_prefix}").off("click").on("click", function(e){
										e.preventDefault();
										e.stopPropagation();
					    				
					        			var menu_code_text = $(this).attr("menu_code_text");
					        			var $windowTarget = $("#w" +  $(this).data("prefix"));
					        			
					        			$windowTarget.window('center').window('open');
					        			$windowTarget.window('refresh', '/admin/column/columnForm');    				
					    				
					    			});
									
									$(".detailBox${_prefix}").off("click").on("click", function() {
										
										var column_idx = $(this).data("opt");
										var menu_code_text = $('.tabs-selected').children().children(".tabs-title").text();
																				
										$('#w${_prefix}').window('center').window('open');
				    			    	
				    					$('#w${_prefix}').window('refresh', '/admin/column/columnForm?column_idx=' + column_idx);
				    			    	
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
    			
    			var param = {};
				${_prefix}.init( param );
				
				fnCommonCodeSearch("column_cate_${_prefix}", "A060", null); 
    			
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
	    		};
    		});
    		    		
    		function columnReload(pre)
        	{
    			var prefix = "_" + pre;
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
    		
    </script>
    <div id="w${_prefix}" class="easyui-window" title="칼럼페이지 상세" data-options="modal:true ,closed:true" style="width:90%;height:90%;padding:10px;">
    </div>
    
</body>
</html>
