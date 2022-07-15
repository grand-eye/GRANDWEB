<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
	<style>

	</style>
</head>
<body id="messageBody">
    <div class="easyui-panel" title="커뮤니티 > 공지사항" style="height:auto;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
        <div 		id="p${_prefix}" 
        			class="easyui-panel" 
        			title="검색창" 
        			style="width:100%;height:auto;padding-left:10px;padding-top:15px"                
        			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">

		    <div>
     <div id="searchForm">
        <form>
            <select id="opt">
            	<option value="" selected>선택</option>
                <option value="0" >제목</option>
                <option value="1">내용</option>
            </select>
           <input id="search_box${_prefix}" class="easyui-textbox" style="width:50%;"> 
	      </form>     
     </div>
        </div>
      
	 	<input type="checkbox" class="chkValue" name="chk_info[]" value="팝업사용(Window)">팝업사용(Window)
		<input type="checkbox" class="chkValue" name="chk_info[]" value="팝업사용(레이어)">팝업사용(레이어)
		<input type="checkbox" class="chkValue" name="chk_info[]" value="팝업사용안함">팝업사용안함 
        </div>
    </div>
    
        
    <div class="easyui-panel" style="height:auto;padding:5px;border:0;"  >    
	    <table id="dg${_prefix}" title="board" class="easyui-datagrid" style="width:100%;height:auto">
	    </table>      
    </div>  
    
	<div id="tb${_prefix}" style="height:auto">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"   onclick="${_prefix}.gridAppend()">게시글 추가</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true"  onclick="${_prefix}.gridReject()">입력 초기화</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="insertBtn${_prefix}" data-options="iconCls:'icon-save',plain:true">저장</a>
	</div>
	     

  	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
       
    <script type="text/javascript">
    		function checkbox(){
    			//var flag = false;
    			var values = document.getElementsByName("chk_info[]");
    			//alert(values.length);
    			for(var i=0; i<values.length; i++){
    				if(values[i].checked){
    					//alert(values[i].value);
    				}
    			}
    		}
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
														var chk1 = $('input:checkbox[id="chk1"]').val();
														var chk2 = $('input:checkbox[id="chk2"]').val();
														var chk3 = $('input:checkbox[id="chk3"]').val();

														var getValue = $(e.data.target).textbox('getValue');
														if ( getValue == "" )
														{
															$.messager.alert('경고창','검색어를 입력하세요.' ,'error' );
															$(e.data.target).focus();
															return false;
														}
														var opts = $('#dg${_prefix}').datagrid('options');
														var param = {};
														//param.b_title = getValue;
												
													    var target = document.getElementById("opt");
													    var title = target.options[target.selectedIndex].value;
													    if(title == 0){
													    	param.b_title = getValue;													    
													    	checkbox();
												
													    }if(title == 1){
													    	param.b_content = getValue;		
													    	checkbox();
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
    								if ( chageData.b_idx != ""  && chageData.b_title !="")
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
								
								
						});

					}
					,
					
					dataload  : function(param){
    	    			$('#dg${_prefix}').datagrid({
    	    			    url		:'/admin/interface/selectBoard'		,
    	    			    queryParams :param 								 ,
    	    			    pagination : true 			,
    	    			    rownumbers :  true 		,
    	    			   	pageSize : 50			,
    	    			    singleSelect :  true 		,
    	    			    fitColumns : false			,
    	    			//    pageSize : 10 ,
    	    			//    pageList : [10] 	    ,
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
    	    					var col = $("#dg${_prefix}").datagrid('getColumnOption', 'b_idx');
    	    					if ( rows.b_idx != "")
    	    					{
    	    						col.editor = null;	
    	    					}
    	    					else
    	    					{
    	    						col.editor = {
    	    			        			type		:"validatebox"	,
    	    			        			options:{
    	    			        				required:true			,
    	    			        				missingMessage : '순번은 필수 입력값입니다.' ,
    	    			        				validateOnBlur : true ,
    	    			        				validType : [ 'empty["순번은 필수 입력값입니다."]' , 'ajax_check["/admin/interface/selectExistsBoardCode","code","이미 등록된 글입니다."]']
    	    			        			}	    			        			
    		    			        	};	
    	    					}
    	    					
    							
    							    					
    	    				}
    	    				,
    	    			    onDblClickRow: function(index, rows) {
    	    			    	
    	    			    	var $rows = $('#dg${_prefix}').datagrid('getRows');
    	    					$.each($rows , function(index, item){
    	    						if ( item.b_idx == "")
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
						    			        		field:'b_idx'		,
						    			        		title:'순번'			,
						    			        		width:"10%"				,
							    			        	editor:{
						    			        			type		:"validatebox"	,
						    			        			options:{
						    			        				required:true			,
						    			        				missingMessage : '필수 입력값입니다.' ,
						    			        				validateOnBlur : true ,
						    			        				validType : [ 'empty["필수 입력값입니다."]' ]
						    			        					
						    			        				
						    			        			}	    			        			
							    			        	}
						    			        }
						    			        ,
						    			        {
						    			        	field:'b_title'		,
						    			        	title:'제목'		, 
						    			        	width:"20%"			,
						    			        	editor:{
					    			        			
					    			        			type		:"textbox"	,
					    			        			options:{
					    			        				required:true			,
					    			        				missingMessage : '필수 입력값입니다.' ,
					    			        				validateOnBlur : true 
					    			        			}	    			        			
						    			        	}	    			        	
						    			        }
						    			        ,
						    			        {
						    			        	field:'b_date'		,
						    			        	title:'등록일시'		, 
						    			        	width:"20%"			,
						    			        	editor:{
					    			        			
					    			        			type		:"textbox"	,
					    			        			    			        			
						    			        	}	    			        	
						    			        }
						    			        
						    			        ,
						    			        {	
						    			        	field:'b_uesYN'					,
						    			        	
						    			        	title:'팝업여부'			, 
						    			        	width:"20%"					,
						    			        	align:'left'					, 
    	    			        	                editor:{ "type":"textbox"
    	    			        	                	}
	        	
						    			        },
						    			        {	
						    			        	field:'b_popup'					,
						    			        	title:'기능'			, 
						    			        	width:"30%"					,
						    			        	align:'left'					, 
    	    			        	                editor:{ 		type		:"textbox"	,
					    			        	
    	    			        	                	}
	        	
						    			        }
    	    			    ]]
    	    			});     								
    				}
					
					,
					
					gridAppend : function(){
						if (this.gridEditing()){
							$('#dg${_prefix}').datagrid('appendRow', {b_idx : "", b_title : "", b_date:"",b_uesYN:"",b_popup:""} );
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
							url      			 : "/admin/interface/insertBoard"
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