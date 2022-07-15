<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="bannerBody">
    <div class="easyui-panel" title="공통관리 > 배너관리" style="height:123px;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
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
    
        
    <div class="easyui-panel" style="height:250px;padding:0px;border:0;">    
	    <table id="dg${_prefix}" title="베너관리" class="" style="width:100%;height:250px">
	    </table>      
    </div>  
    
    <br />
    
    
    <div class="easyui-panel" style="height:auto;padding:0px;border:0;">   
	         
	    <table id="bannertbl" class="" title="베너관리 리스트" style="width:100%;height:auto;">
	        <thead>
	            <tr>
	            	<th data-options="field:'bannersub_idx',hidden:true">idx</th>
	            	<th data-options="field:'p_banner_explan',width:100,align:'center'">메인배너설명</th>
	                <th data-options="field:'bannersub_showorder',width:80,align:'center'">노출순서</th>
	                <th data-options="field:'bannersub_summary',width:80,align:'center'">요약</th>
	                <!-- <th data-options="field:'bannersub_explan',width:200,align:'center'">이미지설명</th> -->
	                <th data-options="field:'bannersub_webImg',width:180,align:'center'">웹용 이미지</th>	                
	                <th data-options="field:'bannersub_etcImg',width:180,align:'center'">기타이미지</th>
	                <th data-options="field:'bannersub_showdate',width:240,align:'center'">노출기간</th>
	                <th data-options="field:'bannersub_show',width:60,align:'center'">게시여부</th>
	                <th data-options="field:'bannersub_func',width:200,align:'center'">기능</th>
	            </tr>
	        </thead>
	    </table>
	    
	    
    </div>
    
	<div id="tb${_prefix}" style="height:auto">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"   onclick="${_prefix}.gridAppend()">배너관리 추가</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true"  onclick="${_prefix}.gridReject()">입력 초기화</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="insertBtn${_prefix}" data-options="iconCls:'icon-save',plain:true">저장</a>
	</div>
	
    <div id="tb_banner_dtl" style="width:100%;">
	   <div style="float:left;width:540px;">
	             노출기간: <input id="substrdate" class="easyui-datebox" 	data-options="formatter:datebox_formatter,parser:datebox_parser"  style="width:110px">
	        ~ <input  id="subenddate" class="easyui-datebox" 	   	data-options="formatter:datebox_formatter,parser:datebox_parser"  style="width:110px">
	             게시여부: 
	        <select id="subselect" class="easyui-combobox" panelHeight="auto" style="width:100px">
	            <option value="Y">Y</option>
	            <option value="N">N</option>
	        </select>
	        <a href="#" class="easyui-linkbutton" id="subseach" iconCls="icon-search">Search</a>
	    </div>
        <div id="bannerRayerpop" style="display:none;float:left;margin-left:0;padding-left:0;">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="fnInsertContent();">컨텐츠등록</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="fnCloseContent();">닫기</a>
        </div>
    </div>
	
	     
	
  	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
       
    <script type="text/javascript">
    		var editIndex = undefined;	//그리드 에디트를 위한 전역변수
    		var initsubidx;
    		var subparamidx = {};
    		var $uploadCategory = "banner";
    		/** 전역 Plugin를 만들어야 한다.**/
   		
    		var ${_prefix} = {
    				
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
														param.banner_search = getValue;
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
    								if ( chageData.banner_explan != "" && chageData.banner_showyn !="" )
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
    	    			    url		:'/admin/interface/selectBannerInfo'		,
    	    			    queryParams :param 								 ,
    	    			    pagination : true 			,
    	    			    rownumbers :  true 		,
    	    			    singleSelect :  true 		,
    	    			    fitColumns : true			,
    	    			    toolbar	: "#tb${_prefix}"				,
    	    			    onLoadSuccess:function(data){
    	    			    	$("#bannertbl").css("display","none");
    	    					$("#tb_banner_dtl").css("display","none");
    	    			    	if(data.rows.length > 0) {
	    	    			    	//initsubidx = data.rows[0].banner_idx;
	    	    			    	var param2 = {
	    	    					};
	    	    			    	param2.bannersub_parentidx = initsubidx;
	    	    			    	param2.bannersub_showstrdate = $("#substrdate").val();
	    	    			    	param2.bannersub_showenddate = $("#subenddate").val();
	    	    			    	param2.bannersub_show = $("#subselect option:selected").val();
	    	    					//getBannerDtl( param2 );
	    	    					
    	    			    	}
    	    					
    	    			    },
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
    	    					var col = $("#dg${_prefix}").datagrid('getColumnOption', 'banner_explan');
    	    					if ( rows.cateCode != "")
    	    					{
    	    						//col.editor = null;	
    	    					}
    	    					else
    	    					{
    	    						col.editor = {
    	    			        			type		:"validatebox"	,
    	    			        			options:{
    	    			        				required:true			,
    	    			        				missingMessage : '설명은 필수 입력값입니다.' ,
    	    			        				validateOnBlur : true ,
    	    			        				//validType : [ 'empty["설명은 필수 입력값입니다."]' , '']
    	    			        				validType : [ 'empty["설명은 필수 입력값입니다."]']
    	    			        			}	    			        			
    		    			        	};	
    	    					}
    	    					
    							
    							    					
    	    				}
    	    				,
    	    			    onDblClickRow: function(index, rows) {
    	    			    	initsubidx = rows.banner_idx;
    	    			    	var $rows = $('#dg${_prefix}').datagrid('getRows');
    	    					$.each($rows , function(index, item){
    	    						if ( item.cateCode == "")
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
    	    				
    	    					
    	    					subparamidx.bannersub_parentidx = rows.banner_idx;
    	    					subparamidx.bannersub_showstrdate = $("#substrdate").val();
    	    					subparamidx.bannersub_showenddate = $("#subenddate").val();
    	    					subparamidx.bannersub_show = $("#subselect option:selected").val();
    	    					getBannerDtl( subparamidx );
    	    					$("#bannerRayerpop").css("display","block");
    	    			    }
    	    				,
    	    			    columns:[[
					    	    			    {
						    			        		field:'banner_explan'		,
						    			        		title:'배너메인설명'			,
						    			        		width:"40%"				,
							    			        	editor:{
						    			        			type		:"validatebox"	,
						    			        			options:{
						    			        				required:true			,
						    			        				missingMessage : '설명은 필수 입력값입니다.' ,
						    			        				validateOnBlur : true ,
						    			        				validType : [ 'empty["설명은 필수 입력값입니다."]' ]
						    			        			}	    			        			
							    			        	}
						    			        }
						    			        ,
						    			        {
						    			        	field:'banner_idx'		,
						    			        	title:'배너key'		,
						    			        }
					    			        	,
					    			        	{
						    			        	field:'banner_gnb'		,
						    			        	title:'배너GNB코드'		, 
						    			        	width:"30%"			    ,
						    			        	editor:{
					    			        			type		:"validatebox"	,
					    			        			options:{
					    			        				required: false			,
					    			        				validateOnBlur : true   ,
					    			        			}	    			        			
						    			        	}
						    			        }
					    			        	,
						    			        {
						    			        	field:'banner_showyn'		,
						    			        	title:'게시여부'		, 
						    			        	width:"10%"			,
						    			        	editor:{
						    			        		type:'checkbox',options:{on:'Y',off:'N'}
						    			        	}
						    			        }
    	    			    ]]
    	    			});     								
    				}
					
					,
					
					gridAppend : function(){
						if (this.gridEditing()){
							$('#dg${_prefix}').datagrid('appendRow', {cateCode : "", cateNm : "", filePath:"", fileExt:"", fileSize:"" } );
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
							url      			 : "/admin/interface/insertBanner"
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

					
    		};    		
			
    		/** 실제 로직화 구현**/
    		
    		$(document).ready(function(){
				var param = {};
				${_prefix}.init( param );
				
				

						
    		});
    		
    	
            
    		function getBannerDtl( param2 )
    		{
    			$('#bannertbl').datagrid({
    				url		:'/admin/interface/selectBannersubInfo'		,
    				queryParams :param2 								,
    				pagination : true 									,
    				rownumbers :  true 								,
    				singleSelect :  true 								,
    				fitColumns : false									,
    				toolbar	: "#tb_banner_dtl"							,
    				emptyMsg: '상위 배너마스터 코드를 1개 선택하셔야 합니다.'		,
    				onDblClickRow: function(index, rows) {
    					
    				}													,
    			    columns:[[
    			    	{
    			        	field:'bannersub_idx',
    			        	title: 'idx',
    			        	hidden:true
    			        }
    			    	,
	    			    {
    			        		field:'p_banner_explan'					,
    			        		title:'메인배너설명',
    			        		width:'100',
    			        		align:'center',
    			        		
	    			        	
    			        }
			        	,
	    			    {
    			        		field:'bannersub_showorder'				,
    			        		title:'노출순서',
    			        		width:'80',
    			        		align:'center',
    			        		
	    			        	
    			        }
	    			    ,
	    			    {
			        		field:'bannersub_summary'				,
			        		title:'요약',
			        		width:'100',
			        		align:'center',
			        		
    			        	
				        }
	    			    ,
	    			    /* {
    			        	field:'bannersub_explan',
    			        	title:'이미지설명',
			        		width:'200',
			        		align:'center',
    			        }
			        	, */
			        	/* {
    			        	field:'bannersub_webImg',
    			        	title:'웹 이미지',
    			        	width:'180',
    			        	align:'center',
    			        	formatter:function(value,row){
	    			        		if(value == "")
	    			        		{
	    			        			return "";	
	    			        		}
	    			        		else{
	    			        			return "<img style='height:147px;' src='" + _web_path + value + "' />";	
	    			        		}
      			    			}
    			        }
			        	,
			        	{
    			        	field:'bannersub_etcImg',
    			        	title:'기타 이미지',
    			        	width:'180',
    			        	align:'center',
        			        formatter:function(value,row){
        			        		if(value == "")
        			        		{
        			        			return "";	
        			        		}
        			        		else{
        			        			return "<img style='height:147px;' src='" + _web_path + value + "' />";	
        			        		}
             			    		
             			    		}
    			        }
			        	, */
			        	{
    			        	field:'bannersub_showdate',
    			        	title:'노출기간',
			        		width:'240',
			        		align:'center'
    			        }
			        	,
			        	{
    			        	field:'bannersub_show',
    			        	title:'게시여부',
    			        	width:'60',
    			        	align:'center'
    			        }
			        	,
			        	{
    			        	field:'bannersub_func',
    			        	title:'기능',
    			        	width:'240',
    			        	align:'center',
    			        	
    			        }
    			
    					]],
    				  
    				onLoadSuccess:function(){
    					var dg = $(this);
    					var opts = $(dg).datagrid('options');
    					opts.finder.getTr(dg[0], -1, 'allbody').css('height', '150px');
    					$(dg).datagrid('resize');
    					
    					$(".bannerbutton").linkbutton({
    	    				toggle : true
    	    				});
    				},
    				
    			});    
    			
    			//$('#bannertbl').datagrid('resize');
    			
    			var dg = $('#bannertbl');
    			dg.datagrid('options').rowHeight = 60;
    			for(var i=0; i<dg.datagrid('getRows').length; i++){
    			    dg.datagrid('refreshRow', i);
    			}
    			
    			
    		}    		
    </script>

    <script type="text/javascript">
		$("#subseach").on("click", function(){
			 var subparam = {};
				subparam.bannersub_showstrdate = $("#substrdate").val();
				subparam.bannersub_showenddate = $("#subenddate").val();
				subparam.bannersub_show = $("#subselect option:selected").val();
				subparam.bannersub_parentidx = initsubidx;
				getBannerDtl( subparam );
		});
		
    	function fnInsertContent() {
    		
			$('#w${_prefix}').window('center').window('open');
			$('#w${_prefix}').window('refresh', '/admin/banner/bannerForm?s_category='+$uploadCategory + '&bannersub_parentidx=' + initsubidx);
			
    		/**
    		$('#bannersub').form('reset');
    		$('#w${_prefix}').window('open');
    		$("#searchTxt").val('');
    		fnGetFileList(null);
    		$(".img_register_03 > .cf").empty();
    		fnGetFileList(null);
			$("#searchTxt").val('');
			**/
    	}
    	
    	function fnUpdateContent(bannersub_idx){
    		$('#w${_prefix}').window('center').window('open');
			$('#w${_prefix}').window('refresh', '/admin/banner/bannerForm?s_category='+$uploadCategory + '&bannersub_idx=' + bannersub_idx + '&bannersub_parentidx=' + initsubidx);
    	}
    	
    	function fnCloseContent() {
    		$('#w${_prefix}').window('close');
    		console.log('fnCloseContent');
    		return false;
    	}
    	
    	function bannerListReload()
    	{
			$('#w${_prefix}').window('close');
			//$('#dg${_prefix}').datagrid("reload");    
			$('#bannertbl').datagrid("reload");
    	}
    	
    	function datebox_formatter(date){
    	    //console.log('dt formatting '+date);
    	    if (!(date instanceof Date)) date = new Date(date);
    	    
    	    
    	    var h = date.getHours();
    	    var M = date.getMinutes();
    	    var s = date.getSeconds();

    	    function _ff(v) {
    	        return (v < 10 ? "0" : "") + v;
    	    };
    	    return _ff(date.getFullYear())+'-'+_ff(date.getMonth()+1)+'-'+ _ff( date.getDate() );    		
    		
    	}
    	
    	function datebox_parser(s){

    		if ($.trim(s) == "") {
    	        return new Date();
    	    }
    	    var p1 = s.split('-');
    	    return new Date(p1[0],p1[1]-1,p1[2]);
    	}    	
    	
  	
   </script>
    <style>
    	.datagrid-body td{
        vertical-align: middle;
    }
    </style>
    <div id="w${_prefix}" class="easyui-window" title="배너 관리" data-options="modal:true ,closed:true" style="width:90%;height:90%;padding:10px;">
    </div>
    
    


</body>
</html>


