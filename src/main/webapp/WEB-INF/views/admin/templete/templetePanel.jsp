<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>

</head>
<body id="memberBody">

	<div class="easyui-panel" style="height: 80px; padding: 0 5px; border: 0;" data-options="iconCls:'icon-redo'">
		<div id="p${_prefix}" class="easyui-panel" title="검색창" style="width: 100%; height: 100%; padding:5px" data-options="iconCls:'icon-tip'">
			<div>		
				<select class="easyui-combobox" id="templete_cate_${_prefix}"  data-prefix="${_prefix}" style="width: 30%;"> </select>
								
				<input id="search_box${_prefix}" data-prefix="${_prefix}" class="easyui-textbox"style="width: 60%;">
			</div>
		</div>
	</div>
	
	<div id="tb${_prefix}" style="width:100%; height: auto;padding:5px;">
		<div class="panel-header" style="width: 95%;">
			<div class="panel-title">템플릿관리</div>
		</div>
		<div id="templetePanelList${_prefix}" class="board_news_area" ></div>
		<div class="datagrid-pager" style="border:1px solid #eee;width:95%;">
			<div id="listPagePanel${_prefix}"></div>
		</div>		
	</div>


	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	<script type="text/javascript">
    		
    		/** 전역 Plugin를 만들어야 한다.**/
    		var $page = 1;
   			var $rows = 60;
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
														var templete_cate_search = ""
																												
														var param = {};
																												
														param.templete_search = getValue;
														param.templete_cate_search = templete_cate_search;
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
													${_prefix}.dataload( param ); 				    						
												}
											}
										]
						
						});   
						
						${_prefix}._data.push("a");
						${_prefix}._data.push("b");

						param.rows = $rows;
						param.page = $page;
						param.templete_useyn = "Y";
						
						this.dataload( param );
						
					}
					,
					
					dataload  : function(param){
						
						$.ajax({  
							   url				 :'/admin/interface/selectTempleteList'
				              ,data 			 : param
				              ,type    		 : "POST"
				              ,dataType 	 : "json"
				              ,success  : function(data) {				            	  						
									
									if( data.rows.length > 0 ) {
										
										$page = data.rows[0].page;
										
										var html = '';
										html += '<ul class="board_news">';
										
										for (var i = 0; i < data.rows.length; i++) 
										{
											var title = textLength(data.rows[i].templete_title, 30);

											html += '	<li class="board_news_box">';
											html += '		<a href="javascript:void(0)" class="detailBoxPanel${_prefix}" data-opt="'+data.rows[i].templete_idx+'">';
											html += '			<div class="box">';
											html += '				<p class="img_wrap" style="border:1px solid #e4e4e4;"><span style="padding:0;height:50px;"><img src="'+data.rows[i].templete_thum+'" alt="" style="height:auto;"></span></p>';
											html += '				<div class="cbox">';
											html += '					<p class="title">'+title+'</p>';
											html += '				</div>';
											html += '			</div>';
											html += '		</a>';
											html += '	</li>';				
										}
																
										html += '</ul>';
										
										$("#templetePanelList${_prefix}").html(html);										
									} else {
										
										var html = '';
										html += '<div style="text-align:center;padding: 50px 0;">등록된 템플릿이 없습니다.</div>';
										$("#templeteList${_prefix}").html(html);
									}
						
									$('#listPagePanel${_prefix}').pagination({
									    total: data.total		,
									    pageList : [12,24,36,48,60]		,
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
    			
    			fnCommonCodeSearch("templete_cate_${_prefix}", "A150", null); 
    			
				var param = {};
				${_prefix}.init( param );
				 
				function fnCommonCodeSearch(appendId, code, level) {
	    			var treePrm = {};
					treePrm.search_master = code;
					treePrm.tcd_useyn = "Y";
					
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
    		});
    		    		
    		function templeteReload(_prefix)
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
    		
    </script>
    
</body>
</html>
