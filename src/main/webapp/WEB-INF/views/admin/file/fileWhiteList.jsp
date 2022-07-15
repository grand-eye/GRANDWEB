<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="messageBody">
    <div class="easyui-panel" title="파일관리 > 파일 WhiteList" style="height:10px;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
    </div>
    
        
    <div class="easyui-panel" style="height:auto;padding:5px;border:0;"  >    
	    <table id="dg${_prefix}" title="File White List" class="" style="width:100%;height:auto">
	    </table>      
    </div>  
    
	<div id="tb${_prefix}" style="height:auto">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"   onclick="${_prefix}.gridAppend()">WhiteList 추가</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true"  onclick="${_prefix}.gridReject()">입력 초기화</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="insertBtn${_prefix}" data-options="iconCls:'icon-save',plain:true">저장</a>
	</div>
	     

  	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
       
    <script type="text/javascript">
    
    		var editIndex = undefined;	//그리드 에디트를 위한 전역변수
    		
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
													
													console.log("message -->");
													console.log(e);
													
													
														var getValue = $(e.data.target).textbox('getValue');
														//alert( getValue );
														if ( getValue == "" )
														{
															$.messager.alert('경고창','검색어를 입력하세요.' ,'error' );
															$(e.data.target).focus();
															return false;
														}
														var opts = $('#dg${_prefix}').datagrid('options');
														var param = {};
														param.search_word = getValue;
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
						
						console.log( ${_prefix}._data );


						this.dataload( param  );

						$("#insertBtn${_prefix}").off("click");
						$("#insertBtn${_prefix}").on("click", function(){
							
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
    								if ( chageData.tfw_mimetype != "" && chageData.tfw_ext !="")
    								{
    									${_prefix}.dataInsert( chageData 
    										, 
    										function( data ){
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
    	    			    url		:'/admin/interface/selectFileWhiteList'		,
    	    			    queryParams :param 								 ,
    	    			    pagination : false 			,
    	    			    rownumbers :  true 		,
    	    			    pageSize : 50			,
    	    			    singleSelect :  true 		,
    	    			    fitColumns : false			,
    	    			    toolbar	: "#tb${_prefix}"	 ,
    	    			    onDblClickRow: function(index, rows) {
    	    			    	
    	    			    	var $rows = $('#dg${_prefix}').datagrid('getRows');
    	    					$.each($rows , function(index, item){
    	    						if ( item.msg_code == "")
    	    						{
    	    							//$('#dg${_prefix}').datagrid('deleteRow', index);	    							
    	    						}
    	    					});
    	    			    	
    	    					if (editIndex != index){
    	    						if (${_prefix}.gridEditing())
    	    						{
    	    							$('#dg${_prefix}').datagrid('selectRow', index)
    	    										.datagrid('beginEdit', index);
    	    							
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
    	    			        		field:'tfw_mimetype'		,
    	    			        		title:'mimetype'			,
    	    			        		width:"60%"				,
    		    			        	editor:{
    	    			        			type		:"validatebox"	,
    	    			        			options:{
    	    			        				required:true			,
    	    			        				missingMessage : ' mimetype은 필수 입력값입니다.' ,
    	    			        				validateOnBlur : true ,
    	    			        				validType : [ 'empty["mimetype은 필수 입력값입니다."]' ]
    	    			        					
    	    			        				
    	    			        			}	    			        			
    		    			        	}
    	    			        }
    	    			        ,
    	    			        {
    	    			        	field:'tfw_ext'		,
    	    			        	title:'확장자'		, 
    	    			        	width:"40%"			,
    	    			        	editor:{
    				        			type		:"validatebox"	,
    				        			options:{
    				        				required:true			,
    				        				missingMessage : '확장자 정보는 필수 입력값입니다.' ,
    				        				validateOnBlur : true 
    				        			}	    			        			
    	    			        	}
    	    			        }
    	    			    ]]
    	    			});     								
    				}
					
					,
					
					gridAppend : function(){
						if (this.gridEditing()){
							$('#dg${_prefix}').datagrid('appendRow', {tfw_mimetype : "", tfw_ext : ""} );
							editIndex = $('#dg${_prefix}').datagrid('getRows').length-1;
							
							$('#dg${_prefix}').datagrid('selectRow', editIndex)
										.datagrid('beginEdit', editIndex);
							
							editMode = "I";    				
						}
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

							if ($('#dg${_prefix}').datagrid('validateRow', editIndex))
							{
								$('#dg${_prefix}').datagrid('endEdit', editIndex);
								editIndex = undefined;
								return true;
							}
							else 
							{
								return false;
							}
					}
					,
					dataInsert : function( param , success, failes )
					{
						$.ajax({  
							url      			 : "/admin/interface/insertFileWhite"
						   ,data 				 : param
						   ,type    			 : "POST"
						   ,dataType 		 : "json"
						   ,success  : function(data) {
								success( data );
								/**
							   if ( data.resultCode == "Y")
							   {
								   $('#dg${_prefix}').datagrid('reload');
							   }
							   else
							   {
								   $('#dg${_prefix}').datagrid('rejectChanges');
							   }
							   **/
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