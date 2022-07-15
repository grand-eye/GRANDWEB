<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="messageBody">
    <div class="easyui-panel" title="코드관리 > 마스터코드 관리" style="height:123px;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
          <div 		id="p${_prefix}" 
        			class="easyui-panel" 
        			title="검색창" 
        			style="width:100%;height:80px;padding-left:10px;padding-top:15px"                
        			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">

		    <div>
	            <input id="search_box${_prefix}" class="easyui-textbox" style="width:50%;">
		    </div>
        </div>
    </div>
    
        
    <div class="easyui-panel" style="height:auto;padding:5px;border:0;"  >    
	    <table id="dg${_prefix}" title="마스터 코드관리" class="" style="width:100%;height:235px">
	    </table>      
    </div>  
    
	<div id="tb${_prefix}" style="height:auto">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"   onclick="${_prefix}.gridAppend()">마스터코드 추가</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true"  onclick="${_prefix}.gridReject()">입력 초기화</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="insertBtn${_prefix}" data-options="iconCls:'icon-save',plain:true">저장</a>
	</div>
	
	

	
	
    <div class="easyui-panel" id="child_panel" style="height:auto;padding:5px;border:0;" >    
		<table title="하위 코드관리" id="dgtree${_prefix}" class="" style="width:100%;height:auto">
			<thead>
				<tr>
					<th data-options="field:'tcd_title'" 		width="15%">코드명칭</th>			
					<th data-options="field:'tcd_code'" 		width="15%">Code</th>			
					<th data-options="field:'tcd_index'" 		width="10%">idField</th>
					<th data-options="field:'tcd_useyn'" 		width="10%">사용여부</th>
					<th data-options="field:'tcd_attr1'" 		width="10%">속성1<br/>(노출기간사용여부)</th>
					<th data-options="field:'tcd_attr2'" 		width="10%">속성2<br/>(카테고리)</th>
					<th data-options="field:'tcd_attr3'" 		width="10%">속성3<br/>(업로드설정코드)</th>					
					<th data-options="field:'tcd_attr4'" 		width="10%">속성4<br/>(URL입력여부)</th>
					<th data-options="field:'tcd_attr5'" 		width="10%">속성5<br/>(contents사용여부)</th>
					<th data-options="field:'tcd_attr6'" 		width="10%">속성6<br/>(썸네일리스트여부)</th>					
				</tr>
			</thead>
		</table>
		
		<div id="tb_sub${_prefix}" style="height:auto">
			<a href="javascript:void(0)" class="easyui-linkbutton" id="btn_add_child" data-options="iconCls:'icon-add',plain:true"   >코드 추가</a>
		</div>	
		
        <div id="ww${_prefix}"class="easyui-window" title="코드관리" data-options="modal:true,width:800,height:640,closed:true">
        </div>
    </div>  	

  	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>

    <script type="text/javascript" src="/admin/js/treegrid-dnd.js"></script>   
    <script type="text/javascript">
    
    		var editIndex = undefined;	//그리드 에디트를 위한 전역변수
    		var $selected = {
    				"master_code" : ""
    		};
    		
    		
    		
    		
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
														//alert( getValue );
														if ( getValue == "" )
														{
															$.messager.alert('경고창','검색어를 입력하세요.' ,'error' );
															$(e.data.target).focus();
															return false;
														}
														var opts = $('#dg${_prefix}').datagrid('options');
														var param = {};
														param.code_search = getValue;
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
    								if ( chageData.code_id != "" && chageData.code_name !=""  )
    								{
    									
    									chageData.code_useyn  = 'Y';
    									chageData.code_parent = '0';
    									chageData.code_order  = '0';
    									chageData.code_level    = '0';
    									chageData.code_path    = '0';
    									
    									chageData.code_attr_01    = '';
    									chageData.code_attr_02    = '';
    									chageData.code_attr_03    = '';
    									
    									
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
    	    			    url		:'/admin/interface/selectMasterCode'		,
    	    			    queryParams :param 								 	,
    	    			    pagination : true 			,
    	    			    rownumbers :  true 		,
    	    			    singleSelect :  true 		,
    	    			    fitColumns : false					,
    	    			    pageSize : 5 ,
    	    			    pageList : [5] 	    ,
    	    			    toolbar	: "#tb${_prefix}"				,
    	    			    onAfterEdit : function(index, row, changes)
    	    			    {

    	    			    }
    	    				,
    	    				onEndEdit : function(index, row, changes)
    	    				{
    							var len = $.map(changes, function(n, i) { return i; }).length;
    							if ( len > 0)
    							{

    							}
    	    				}
    	    				,
    	    				onBeforeEdit : function(index,rows){
    	    					var col = $("#dg${_prefix}").datagrid('getColumnOption', 'code_id');
    	    					if ( rows.code_id != "")
    	    					{
    	    						col.editor = null;	
    	    					}
    	    					else
    	    					{
    	    						col.editor = {
    	    			        			type		:"validatebox"	,
    	    			        			options:{
    	    			        				required:true			,
    	    			        				missingMessage : '코드 ID는 필수 입력값입니다.' ,
    	    			        				validateOnBlur : true ,
    	    			        				validType : [ 'empty["코드 ID는 필수 입력값입니다."]' , 'ajax_check["/admin/interface/selectExistsCodeID","code","이미 등록된 코드입니다."]']
    	    			        			}	    			        			
    		    			        	};	
    	    					}
    	    					
    							
    							    					
    	    				}
    	    				,
    	    			    onDblClickRow: function(index, rows) {
								
    	    			    	
    	    			    	
    	    			    	
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
    	    					
    	    					console.log(rows);
    	    					
    	    					var treePrm = {};
    	    					
    	    					treePrm.search_level = "0";
    	    					treePrm.search_master = rows.code_id;
    	    					$selected.master_code = rows.code_id;
    	    					
    	    					childTreeGrid.dataload(treePrm);
    	    					
    	    	 		    }
    	    				,
    	    			    columns:[[
    	    			        {
    	    			        		field:'code_id'		,
    	    			        		title:'Code ID'			,
    	    			        		width:"30%"				,
    		    			        	editor:{
    	    			        			type		:"validatebox"	,
    	    			        			options:{
    	    			        				required:true			,
    	    			        				missingMessage : '코드 ID는 필수 입력값입니다.' ,
    	    			        				validateOnBlur : true ,
    	    			        				validType : [ 'empty["코드 ID는 필수 입력값입니다."]' ]
    	    			        					
    	    			        				
    	    			        			}	    			        			
    		    			        	}
    	    			        }
    	    			        ,
    	    			        {
    	    			        	field:'code_name'		,
    	    			        	title:'코드명칭'		, 
    	    			        	width:"70%"			,
    	    			        	editor:{
    				        			type		:"validatebox"	,
    				        			options:{
    				        				required:true			,
    				        				missingMessage : '코드 내용은 필수 입력값입니다.' ,
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
							$('#dg${_prefix}').datagrid('appendRow', {
									code_id 			: "" ,
									code_name 		: "" 
							} );
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
							url      			 : "/admin/interface/insertCode"
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
			
    		
    		var childTreeGrid = {
    				
    				dataload : function (paramTree)
    				{
    					$('#dgtree${_prefix}').treegrid({
    						url : "/admin/interface/selectCodeDetail"								,
    						queryParams :paramTree 		,
    						rownumbers: true 			,
    						idField: 'tcd_index',
    						treeField: 'tcd_title',				
    						toolbar : '#tb_sub${_prefix}',
    						onDblClickRow: function(rows) {
    							
    							if ( rows.tcd_code != "" )
    							{
        							$('#ww${_prefix}').window('center').window('open');
        							$('#ww${_prefix}').window('refresh', '/admin/code/codeForm?search_code='+encodeURIComponent(rows.tcd_code)+'&search_master=' + $selected.master_code);    							 
    							}
    						}
    						,
    						onLoadSuccess: function(row){
    							//$(this).treegrid('enableDnd', row?row.id:null);
    							$(this).treegrid('hideColumn', 'tcd_index');
    						}		
    					});
    				}
    					
    		};    	
			


			$('.easyui-window').window({
				collapsible	: false,
				minimizable	: false,
				maximizable	: false,
				closable	: true
			});


    		/** 실제 로직화 구현**/
    		
    		$(document).ready(function(){
				var param = {};
				${_prefix}.init( param );
				
				var treePrm = {};
				treePrm.search_level = "99";
				treePrm.search_master = "@X";
				childTreeGrid.dataload(treePrm);	
				

				$("#btn_add_child").on("click", function(){
					
					if ( $selected.master_code == "" )
					{
						//$.messager.alert('경고창','마스터 코드를 선택하셔야 자식코드 정보를 추가하실수 있습니다.' ,'error' );
						alert('마스터 코드를 선택하셔야 자식코드 정보를 추가하실수 있습니다.');
						return;
					}
					
					$('#ww${_prefix}').window('center').window('open');
					$('#ww${_prefix}').window('refresh', '/admin/code/codeForm?search_master=' + $selected.master_code);

				});
    		});
    		
    		
    		function closeWindow(){
    			$('#ww${_prefix}').window("close");
    			$('#dgtree${_prefix}').treegrid("reload");
    		}
    </script>

	



</body>
</html>