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
		style="height: 180px; padding: 5px; border: 0;"
		data-options="iconCls:'icon-redo'">
		<div id="p${_prefix}" class="easyui-panel" title="검색창"
			style="width: 100%; height: 100%; padding-left: 10px; padding-top: 15px"
			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">
			<div>
				<c:if test="${boardOptionList[0].tcd_attr2 ne 'N'}">
				<select class="easyui-combobox searchSel" id="board_cate_L_${_prefix}"  data-prefix="${_prefix}" style="width: 10%;"> </select>
				</c:if>
				<input id="search_box${_prefix}" data-prefix="${_prefix}" class="easyui-textbox"style="width: 50%;">
				<div style="padding-top: 10px;">
					<div style="float: left;">
						<input id="search_start_date${_prefix}" data-prefix="${_prefix}" class="easyui-datebox" label="시작일" style="width:200px;display:block;">
					</div>
					<div style="float: left; padding-left: 20px;">
						<input id="search_end_date${_prefix}" data-prefix="${_prefix}" class="easyui-datebox" label="종료일" style="width:200px;display:block;">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="easyui-panel" style="height: auto; padding: 5px; border: 0;">
		<table id="dg${_prefix}" title="${boardOptionList[0].tcd_title}" class="" style="width: 100%; height: auto">
		</table>
	</div>
	<div id="tb${_prefix}" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-prefix="${_prefix}" onclick="$('#dg${_prefix}').datagrid('toExcel','리스트.xls')">엑셀 다운</a>
	</div>
	

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp"%>

	<script type="text/javascript">
	
	$.extend($.fn.datebox.defaults, {
        formatter: function(date) {
           date = new Date(date);
           var y = date.getFullYear();
           var m = date.getMonth()+1;
           var d = date.getDate();
           return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
        },
         parser: function (s) {
           if (!s) return new Date();
           var ss = (s.split('-'));
           var y = parseInt(ss[0],10);
           var m = parseInt(ss[1],10);
           var d = parseInt(ss[2],10);
           if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
              return new Date(y,m-1,d);
           } else {
              return new Date();
           }
         }
     });
    		
    		/** 전역 Plugin를 만들어야 한다.**/
    		
    		var reservationStateList;
    		var reservationStateParam = {};
    		reservationStateParam.search_master = "A173";
    		reservationStateParam.tcd_useyn = "Y";
   		
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
														
														
														<c:if test="${boardOptionList[0].tcd_attr2 ne 'N'}">
															board_cate_L_search = $("#board_cate_L_${_prefix} option:selected").val();
														</c:if>
														var opts = $('#dg${_prefix}').datagrid('options');
														var param = {};
														
														param.board_reg_name = getValue;														
														param.board_search = getValue;
														param.board_cate_L_search = board_cate_L_search;
														param.board_start_date = $("#search_start_date${_prefix}").datebox('getValue');
														if($("#search_end_date${_prefix}").datebox('getValue') != '') {
															param.board_end_date = $("#search_end_date${_prefix}").datebox('getValue') + " 23:59:59";
														}
														param.page = 1;
														${_prefix}.dataload( param  ); 
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
						
						${_prefix}._data.push("a");
						${_prefix}._data.push("b");

						this.dataload( param  );

					}
					,
					dataload  : function(param){
    	    			$('#dg${_prefix}').datagrid({
    	    			    url		:'/admin/interface/history'		,
    	    			    queryParams :param 								 ,
    	    			    pagination : true 			,
    	    			    rownumbers :  true 		,
    	    			    pageSize : 50			,
    	    			    pageList : [50, 100, 200, 1000, 10000]			,
    	    			    singleSelect :  true 		,
    	    			    fitColumns : true			,
    	    			    fit : false	,
    	    			    toolbar	: "#tb${_prefix}"				,
    	    			    onAfterEdit : function(index, row, changes)
    	    			    {

    	    			    }
    	    				,
    	    				onEndEdit : function(index, row, changes)
    	    				{
    	    					var ed = $(this).datagrid('getEditor', {
     	    			            index: index,
     	    			            field: 'visit_state'
     	    			        });
     	    			        if(ed) {
     	    			            row.tcd_title = $(ed.target).combobox('getText');
     	    			        }
    	    				}
    	    				,
    	    				onBeforeEdit : function(index,rows){
    	    					
    	    				}
    	    				,
    	    			    columns:[[
    	    			        {
    	    			        	field:'board_idx'		,
    	    			        	title:'인덱스'		, 
    	    			        	align:'center',
    	    			        	width:"5%"
    	    			        }
    	    			        , 
    	    			        {
    	    			        	field:'board_reg_name'		,
    	    			        	title:'고객명'		, 
    	    			        	align:'center',
    	    			        	width:"5%"
    	    			        }
    	    			        ,
    	    			        {
    	    			        	field:'board_mod_id'		,
    	    			        	title:'수정한 관리자'		, 
    	    			        	align:'center',
    	    			        	width:"10%"
    	    			        }
    	    			        ,
    	    			        {
    	    			        	field:'board_menu_code'		,
    	    			        	title:'메뉴'		, 
    	    			        	align:'center',
    	    			        	width:"15%" ,
    	    			        	formatter:function(value,row){
    	    			        		
    									return row.board_menu_code
    								},
    	    			        }
    	    			        ,
    	    			        {
    	    			        	field:'board_content'		,
    	    			        	title:'내용'		, 
    	    			        	align:'center',
    	    			        	width:"50%"
    	    			        }
    	    			        , 
    	    			        {
    	    			        	field:'board_reg_date'		,
    	    			        	title:'등록일'				, 
    	    			        	align:'center'				,
    	    			        	width:"10%"				    	    			        	
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
						//callback(this._data);
					}
    		};    		
			
    		/** 실제 로직화 구현**/
    		
    		$(document).ready(function(){
    			
    			fnCommonCodeSearch("board_cate_L_${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>", null); 
				
				var param = {};
				${_prefix}.init( param );
				 
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
								var html ='<option value="" selected="selected">고객명</option>';
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
				
				$.ajax({  
 	               url      		 : "/admin/interface/selectCodeDetail"
 	              ,data 			 : reservationStateParam
 	              ,type    			 : "POST"
 	              ,dataType 		 : "json"
 	              ,success  : function(data) {
 	            	 reservationStateList = data.rows[0].children;
 	            	  
 	            	 
 	  				var param = {};
 					${_prefix}.init( param );
 					
 					$('#dg${_prefix}').datagrid('enableCellEditing');
 	              }
        		});
    		});
    		
    		function boardReload(_prefix)
        	{
    			var prefix = "_" + _prefix;
    			$('#w' + prefix).window('close');
    			$('#dg' + prefix).datagrid("reload");
        	}
    		
    		
    </script>
    <div id="w${_prefix}" class="easyui-window" title="${boardOptionList[0].tcd_title}" data-options="modal:true ,closed:true" style="width:90%;height:90%;padding:10px;">
    </div>
    
</body>
</html>
