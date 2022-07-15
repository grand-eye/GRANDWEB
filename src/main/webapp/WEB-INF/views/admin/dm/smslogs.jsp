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

	<div class="easyui-panel" title="전송내역 "
		style="height: 120px; padding: 5px; border: 0;"
		data-options="iconCls:'icon-redo'">
		<div id="p${_prefix}" class="easyui-panel" title="검색창"
			style="width: 100%; height: 100%; padding-left: 10px; padding-top: 15px"
			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">
			<div>		
				
				<select class="easyui-combobox searchSel" id="board_search_option${_prefix}" style="width: 5%">					
					<option value="phone">수신번호</option>
					<option value="msg">메시지</option>
				</select>
				
				<input id="search_box${_prefix}" data-prefix="${_prefix}" class="easyui-textbox"style="width: 20%;">
			</div>
		</div>
	</div>


	<div class="easyui-panel"
		style="height: auto; padding: 5px; border: 0;">
		<table id="dg${_prefix}" title="전송내역"  class="" style="width: 100%; height: auto">
		</table>
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	<script type="text/javascript">
    		
    		/** 전역 Plugin를 만들어야 한다.**/
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
														var opts = $('#dg${_prefix}').datagrid('options');
														
														var param = {};																												
														param.board_search = getValue;
														param.board_search_option		= $("#board_search_option${_prefix}").val();
														
														param.page = 1;
														${_prefix}.dataload( param ); 
												}
											}
											,
											{
												iconCls:'icon-reload',
												handler: function(e){
													$(e.data.target).textbox('clear');
													var opts = $('#dg${_prefix}').datagrid('options');
													var param = {};
													param.rows = opts.pageSize;
													param.page = 1;
													${_prefix}.dataload( param  ); 				    						
												}
											}
										]
						
						});   

						this.dataload( param  );

					}
					,
					
					dataload  : function(param){
    	    			$('#dg${_prefix}').datagrid({
    	    			    url		:'/admin/interface/selectSmslogsList'		,
    	    			    queryParams :param 								 ,
    	    			    pagination : true 			,
    	    			    rownumbers :  true 		,
    	    			    singleSelect :  true 		,
    	    			    fitColumns : true			,
    	    			    fit : false		,
    	    			    toolbar	: "#tb${_prefix}"				,
    	    			    onAfterEdit : function(index, row, changes)
    	    			    {

    	    			    }
    	    				,
    	    				onEndEdit : function(index, row, changes)
    	    				{

    	    				}
    	    				,
    	    				onBeforeEdit : function(index,rows){
    	    					
    	    				}
    	    				,
    	    			    onDblClickRow: function(index, rows) {
    	    			    	
    	    			    }
    	    				,
    	    			    columns:[[    	    			        
    	    			    	{
    	   			        		field:'tblStrSender'	,
    	   			        		title:'발신번호'				,
    	   			        		width:"10%"					,
    	    			        	align:'center'	
    	    			        },
    	    			    	{
    	   			        		field:'tblStrAddressee'	,
    	   			        		title:'수신번호'				,
    	   			        		width:"10%"					,
    	    			        	align:'center'
    	    			        },
    	    			        {
    	   			        		field:'tblStrComment'	,
    	   			        		title:'메시지'				,
    	   			        		width:"40%"					,
    	    			        	align:'left'				
    	    			        },
    	    			        {	
    	    			        	field:'tblDtmRegDate'			,
    	    			        	title:'전송일시'					, 
    	    			        	width:"10%"					,
    	    			        	align:'center'					
    	    			        },
    	    			        {	
    	    			        	field:'tblStrStatus'			,
    	    			        	title:'상태'					, 
    	    			        	width:"5%"					,
    	    			        	align:'center'					
    	    			        },
    	    			        {	
    	    			        	field:'tblNumber'			,
    	    			        	hidden:true					
    	    			        }
    	    			    ]]
    	    				
    	    			});     								
    				}					
					,
					gridAppend : function(){
					}
					,
					gridReject : function(){
					}
					,
					gridDelete : function(){
					}
					,
					gridEditing : function(){
					}
					,
					dataInsert : function( param , success, failes )
					{
					}
					,
					getPushData : function(callback){
					}

					
    		};    		
			
    		/** 실제 로직화 구현**/
    		
    		$(document).ready(function(){
    			
				var param = {};
				${_prefix}.init( param );
				
    		});
    		
    </script>
    
</body>
</html>
