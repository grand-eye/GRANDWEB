<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>

</head>
<body id="baordBody">

	<div class="easyui-panel" title="DM관리 > 문자자동전송설정" style="height:10px;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
    </div>    
	<div id="tb${_prefix}" style="height:auto">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true"  onclick="${_prefix}.gridReject()">입력 초기화</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="insertBtn${_prefix}" data-options="iconCls:'icon-save',plain:true">저장</a>
	</div>
	<div class="easyui-panel" style="height: auto; padding: 5px; border: 0;">
		<table id="dg${_prefix}" title="문자자동전송설정"  class="" style="width: 100%; height: auto">
		</table>
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	
	<script type="text/javascript">
    		
    		/** 전역 Plugin를 만들어야 한다.**/
    		var editIndex = undefined;
    		
    		var ${_prefix} = {
    				
					_data : new Array() ,

					init : function(param){

						this.dataload( param  );
						
						$("#insertBtn${_prefix}").off("click").on("click", function(){
							
							var selectedRow   = $('#dg${_prefix}').datagrid('getSelected');	//현재 선택된 행정보 객체를 가져오고
							var selectedIndex = $('#dg${_prefix}').datagrid("getRowIndex", selectedRow); //해당 객체에서 인덱스정보를 조회
							$('#dg${_prefix}').datagrid('endEdit', selectedIndex);			// 해당 인덱스 EditMod를 해제하고
							editIndex = undefined;

							var changeRows = $('#dg${_prefix}').datagrid('getChanges'); //최종 변경사항여부를 체크한다.

							var len = $.map(changeRows, function(n, i) { return i; }).length;
							if ( len > 0)
							{
								var chageData = changeRows[0]; // 여러개의 변경점이 있다면, 최신데이터 1개만
								/** 각자 알아서 처리한다 ----- **/
								if ( chageData.send_msg != "" )
								{
									${_prefix}.dataInsert( chageData, function( data ){
										   if ( data.resultCode == "Y")
										   {
											   $('#dg${_prefix}').datagrid('reload');
										   }
										   else
										   {
											   $('#dg${_prefix}').datagrid('rejectChanges');
										   }
    									}
										, 
										function( xhr, ajaxOptions, thrownError ){
											
										}
									); 
								}
								else
								{
									$('#dg${_prefix}').datagrid('rejectChanges');
					    			editIndex = undefined;    									
								}
							}		
							else
							{
								
							}
							
							console.log(changeRows);
							
					});

					}
					,
					
					dataload  : function(param){
    	    			$('#dg${_prefix}').datagrid({
    	    			    url		:'/admin/interface/selectSmsMsgSetList'		,
    	    			    queryParams :param 								 ,
    	    			    pagination : true 			,
    	    			    rownumbers :  true 		,
    	    			    singleSelect :  true 		,
    	    			    fitColumns : true			,
    	    			    fit : false		,
    	    				onEndEdit : function(index, row, changes)
    	    				{
    	    					
    	    				}
    	    				,
    	    				onDblClickRow: function(index, rows) {
    	    					var $rows = $('#dg${_prefix}').datagrid('getRows');
    	    					
    	    					if (editIndex != index)
    	    					{
    	    						if (${_prefix}.gridEditing())
    	    						{
    	    							$('#dg${_prefix}').datagrid('selectRow', index).datagrid('beginEdit', index);
    	    							
    	    							editMode = "M";
    	    							editIndex = index;
    	    						} 
    	    						else 
    	    						{
    	    							$('#dg${_prefix}').datagrid('selectRow', editIndex);
    	    						}
    	    					}
    	    					
    	    				}
    	    				,
    	    			    columns:[[    	    			        
    	    			    	{
    	   			        		field:'comment'			,
    	   			        		title:'카테고리'				,
    	   			        		width:"15%"				,
    	    			        	align:'center'	
    	    			        },
    	    			    	{
    	   			        		field:'send_msg'		,
    	   			        		title:'내용'					,
    	   			        		width:"70%"				,
    	    			        	align:'left'					,
    	    			        	editor:{
	    			        			type		:"textbox"	    			        				    			        			
		    			        	}
    	    			        },
    	    			        {
    	   			        		field:'send_msg_length'	,
    	   			        		title:'비고'					,
    	   			        		width:"10%"				,
    	    			        	align:'center'				,
    	    			        	formatter:function(value,row){
    	    			        		return value + ' /1000';
    	    			        	}
    	    			        },    	    			        
    	    			        {	
    	    			        	field:'tblNumber'		,
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
						
						$('#dg${_prefix}').datagrid('rejectChanges');
		    			editIndex = undefined;
		    			
					}
					,
					gridDelete : function(){
					}
					,
					gridEditing : function(){
						
						if (editIndex == undefined)
						{
							return true;
						}

						$('#dg${_prefix}').datagrid('endEdit', editIndex);
						editIndex = undefined;
						return true;
						
					}
					,
					dataInsert : function( param , success, failes )
					{
						$.ajax({  
							url      			 : "/admin/interface/insertSmsMsgSet"
						   ,data 				 : param
						   ,type    			 : "POST"
						   ,dataType 		 : "json"
						   ,success  : function(data) {
								success( data );								
						   }
						   ,
						   error:function (xhr, ajaxOptions, thrownError){
								failes(xhr, ajaxOptions, thrownError);
						   } 
						});	
					}
					,
					getPushData : function(callback){
						callback(this._data);
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
