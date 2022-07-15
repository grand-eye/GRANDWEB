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

	<div class="easyui-panel" title="홈페이지상담관리 "
		style="height: 180px; padding: 5px; border: 0;"
		data-options="iconCls:'icon-redo'">
		<div id="p${_prefix}" class="easyui-panel" title="검색창"
			style="width: 100%; height: 100%; padding-left: 10px; padding-top: 15px"
			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">
			<div>		
				
				<select class="easyui-combobox searchSel" id="mh_type${_prefix}" style="width: 10%">					
				</select>
				<input type="hidden" id="mh_type_val${_prefix}" >
				
				<select class="easyui-combobox searchSelDivide" id="board_search_select${_prefix}" style="width: 12.3%">
					<option value="" selected="selected">이름</option>
					<option value="SOURCE">플랫폼</option>
					<option value="MEDIUM">광고상품</option>
					<option value="CAMPAIGN">광고특징</option>
				</select>
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


	<div class="easyui-panel"
		style="height: auto; padding: 5px; border: 0;">
		<table id="dg${_prefix}" title="상담관리"  class="" style="width: 100%; height: auto">
		</table>
	</div>
	<div id="tb${_prefix}" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-prefix="${_prefix}" onclick="$('#dg${_prefix}').datagrid('toExcel','상담리스트.xls')">엑셀 다운</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-prefix="${_prefix}" onclick="consultCheckSave()">선택 저장</a>
		<%-- <a href="javascript:void(0)" class="easyui-linkbutton" data-prefix="${_prefix}" menu_code_text="엑셀다운"  data-options="iconCls:'icon-download',plain:true">엑셀다운로드</a> --%>		
	</div>


	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
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
 	
 			var consultResultList;
			var consultResultParam = {};
			consultResultParam.search_master = "A172";
			consultResultParam.tcd_useyn = "Y";
			
			var visitStateList;
    		var visitStateParam = {};
    		visitStateParam.search_master = "A173";
    		visitStateParam.tcd_useyn = "Y";
	
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
														param.mh_type				= $("#mh_type${_prefix}").val();
														/* param.mh_reservation		= $("#mh_reservation${_prefix}").val(); */
														param.board_search = getValue;
														param.board_search_show = $("#board_search_show${_prefix}").val();
														if($("#board_search_select${_prefix}").val() == "SOURCE"){
															param.board_search_divide = "SOURCE";
														}
														else if($("#board_search_select${_prefix}").val() == "MEDIUM"){
															param.board_search_divide = "MEDIUM";
														}
														else if($("#board_search_select${_prefix}").val() == "CAMPAIGN"){
															param.board_search_divide = "CAMPAIGN";
														}
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
													var opts = $('#dg${_prefix}').datagrid('options');
													var param = {};
													param.rows = opts.pageSize;
													param.page = 1;
													${_prefix}.dataload( param  ); 				    						
												}
											}
										]
						
						});   
						
						param.mh_type				= "ALL";
						param.mh_reservation		= "ALL";
						this.dataload( param  );

					}
					,
					
					dataload  : function(param){
    	    			$('#dg${_prefix}').datagrid({
    	    			    url		:'/admin/interface/selectSiteConsultList'		,
    	    			    queryParams :param 								 ,
    	    			    pagination : true 			,
    	    			    rownumbers :  true 		,
    	    			    pageSize : 50			,
    	    			    pageList : [50, 100, 200, 1000, 10000]			,
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
    	    			        var ed = $(this).datagrid('getEditor', {
    	    			            index: index,
    	    			            field: 'mh_reservation'
    	    			        });
    	    			        if(ed) {
    	    			            row.tcd_title = $(ed.target).combobox('getText');
    	    			        }
    	    				}
    	    				,
    	    				onBeforeEdit : function(index,rows){
    	    					
    	    				}
    	    				,
    	    			    onDblClickRow: function(index, rows) {
    	    			    	console.log(rows);
    	    			    	$('#w${_prefix}').window('center').window('open');
    	    			    	
    	    					$('#w${_prefix}').window('refresh', '/admin/consult/siteConsultForm?mh_no=' + rows.mh_no);
    	    			    	
    	    			    }
    	    				,
    	    			    columns:[[
    	    			    	{
    	    			    		field : 'checkYn',
    	    			    		title : '선택',
    	    			        	width:"3%",
    	    			    		editor:{
    	    			    			type:'checkbox',
    	    			    			options:{
    	    			    				on:'Y',
    	    			    				off:''
    	    			    			}
    	    			    		},
    	    			        	align:'center'
    	    			    	}
    	    			    	,
    	    			        {
    	   			        		field:'is_mobile'	,
    	   			        		title:'경로'				,
    	   			        		width:"5%"					,
    	    			        	align:'center'
    	    			        }
    	    			    	
    	    			    	,
    	    			        {
    	   			        		field:'mh_type'			,
    	   			        		title:'유형'				,
    	   			        		width:"5%"				,
    	    			        	align:'center'			,
    								formatter:function(value,row){
    									if ( row.mh_type.indexOf('landing') > -1 )
    									{
    										return "랜딩";
    									}
    									else
    									{
    										return "일반";	
    									}
    								}    	    			        	
    	    			        }    	    			    	
    	    			    	,
    	    			        {
    	   			        		field:'mh_datetime'	,
    	   			        		title:'상담요청시간'				,
    	   			        		width:"10%"					,
    	    			        	align:'center'					,
    	    			        	sortable : true
    	    			        },
    	    			        {	
    	    			        	field:'mh_name'			,
    	    			        	title:'이름'					, 
    	    			        	width:"5%"					,
    	    			        	align:'center'					
    	    			        }
    	    			        ,
    	    			        {
    	    			        	field:'mh_hp'			,
    	    			        	title:'연락처'				, 
    	    			        	width:"5%"					,
    	    			        	align:'center'					
    	    			        },
    	    			        {
    	    			        	field:'vi_referer'		,
    	    			        	title:'유입'				, 
    	    			        	width:"10%"					,
    	    			        	align:'left'				
    	    			        },
    	    			        /*
    	    			        {	
    	    			        	field:'mh_reservation'		,
    	    			        	title:'결과'				, 
    	    			        	width:"5%"					,
    	    			        	align:'center'					
    	    			        },
    	    			        */
    	    			    	{
    								field:'mh_reservation',
    	    			        	title:'결과',
    								width:'5%',
    								align:'center',
    								formatter:function(value,row){
    									return row.tcd_title;
    								},
    								editor:{
    									type:'combobox',
    									options:{
    										editable: false,
    										valueField:'tcd_code',
    										textField:'tcd_title',
    										data: consultResultList,
    										required:true,
    									}
    								}
    	    			    	},
    	    			        {	
    	    			        	field:'mh_responsetime'		,
    	    			        	title:'응대시간'						, 
    	    			        	width:"10%"						,
    	    			        	align:'center'						,
    	    			        	sortable : true
    	    			        },
    	    			        {
    	   			        		field:'mh_ip'	,
    	   			        		title:'ip'				,
    	   			        		width:"5%"					,
    	    			        	align:'center'			,    	    			        	
    	    			        },
    	    			        {
    	   			        		field:'utm_source'		,
    	   			        		title:'utm_source'		,
    	   			        		width:"6%"				,
    	    			        	align:'center'				,
    								formatter:function(value,row){
    									if ( row.utm_source == "" || row.utm_source=="null")
    									{
    										return "DIRECT";
    									}
    									else
    									{
    										return row.utm_source;	
    									}
    								}      	    			        	
    	    			        },    	    		
    	    			        {
    	   			        		field:'utm_medium'		,
    	   			        		title:'utm_medium'		,
    	   			        		width:"6%"					,
    	    			        	align:'center'					,
    								formatter:function(value,row){
    									if ( row.utm_medium == "" || row.utm_medium=="null")
    									{
    										return "DIRECT";
    									}
    									else
    									{
    										return row.utm_medium;	
    									}
    								}      	    			        	
    	    			        }
    	    			        ,
    	    			        {
    	   			        		field:'utm_campaign'	,
    	   			        		title:'utm_campaign'				,
    	   			        		width:"6%"					,
    	    			        	align:'center'			,  
    								formatter:function(value,row){
    									if ( row.utm_campaign == "" || row.utm_campaign=="null")
    									{
    										return "DIRECT";
    									}
    									else
    									{
    										return row.utm_campaign;	
    									}
    								}    	    			        	
    	    			        }

    	    			        ,
    	    			        {
    	   			        		field:'utm_term'	,
    	   			        		title:'utm_term'				,
    	   			        		width:"6%"					,
    	    			        	align:'center'			,   
    								formatter:function(value,row){
    									if ( row.utm_term == "" || row.utm_term=="null")
    									{
    										return "DIRECT";
    									}
    									else
    									{
    										return row.utm_term;	
    									}
    								}    	    			        	
    	    			        }

    	    			        
    	    			        ,
    	    			        {
    	   			        		field:'utm_content'	,
    	   			        		title:'utm_content'		,
    	   			        		width:"6%"				,
    	    			        	align:'center'				,
    								formatter:function(value,row){
    									if ( row.utm_content == "" || row.utm_content=="null")
    									{
    										return "DIRECT";
    									}
    									else
    									{
    										return row.utm_content;	
    									}
    								}        	    			        	
    	    			        }

    	    			        
    	    			        ,
    	    			        {
    								field:'consult_state',
    	    			        	title:'상담',
    								width:'5%',
    								align:'center',
    								formatter:function(value,row){
    									var state;
    									if(row.consult_state == 'A173_0' || row.consult_state == null || row.consult_state == ''){
    										state ="대기"
    									}else if(row.consult_state == 'A173_1'){
    										state ="확인"
    									}else if(row.consult_state == 'A173_2'){
    										state ="취소"
    									}
    									return state;
    								},
    								editor:{
    									type:'combobox',
    									options:{
    										editable: false,
    										valueField:'tcd_code',
    										textField:'tcd_title',
    										data: visitStateList,
    										required:false,
    									}
    								}
    	    			    	}
		    			        ,
		    			        {
    								field:'reservation_state',
    	    			        	title:'예약',
    								width:'5%',
    								align:'center',
    								formatter:function(value,row){
    									var state;
    									if(row.reservation_state == 'A173_0' || row.reservation_state == null || row.reservation_state == ''){
    										state ="대기"
    									}else if(row.reservation_state == 'A173_1'){
    										state ="확인"
    									}else if(row.reservation_state == 'A173_2'){
    										state ="취소"
    									}
    									return state;
    								},
    								editor:{
    									type:'combobox',
    									options:{
    										editable: false,
    										valueField:'tcd_code',
    										textField:'tcd_title',
    										data: visitStateList,
    										required:false,
    									}
    								}
    	    			    	}
		    			        ,
		    			        {
    								field:'visit_state',
    	    			        	title:'내원',
    								width:'5%',
    								align:'center',
    								formatter:function(value,row){
    									var state;
    									if(row.visit_state == 'A173_0' || row.visit_state == null || row.visit_state == ''){
    										state ="대기"
    									}else if(row.visit_state == 'A173_1'){
    										state ="확인"
    									}else if(row.visit_state == 'A173_2'){
    										state ="취소"
    									}
    									return state;
    								},
    								editor:{
    									type:'combobox',
    									options:{
    										editable: false,
    										valueField:'tcd_code',
    										textField:'tcd_title',
    										data: visitStateList,
    										required:false,
    									}
    								}
    	    			    	}
		    			        ,
		    			        {
    								field:'contract_state',
    	    			        	title:'계약',
    								width:'5%',
    								align:'center',
    								formatter:function(value,row){
    									var state;
    									if(row.contract_state == 'A173_0' || row.contract_state == null || row.contract_state == ''){
    										state ="대기"
    									}else if(row.contract_state == 'A173_1'){
    										state ="확인"
    									}else if(row.contract_state == 'A173_2'){
    										state ="취소"
    									}
    									return state;
    								},
    								editor:{
    									type:'combobox',
    									options:{
    										editable: false,
    										valueField:'tcd_code',
    										textField:'tcd_title',
    										data: visitStateList,
    										required:false,
    									}
    								}
    	    			    	}
		    			        ,
    	    			        {	
    	    			        	field:'mh_no'			,
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
    			
    			//fnCommonCodeSearch("mh_type${_prefix}", "A170", null); 
    			
    			commonFnc.setDataCombo("#mh_type${_prefix}", "A171", "0", "", "타입 선택", function(value){
    				if( value != "" )
    				{
    					$("#mh_type_val${_prefix}").val(value);
    					var param = {};    					
    					param.mh_type 	= value;
    					
    					
    					
    					${_prefix}.dataload( param  );
    					
    				}
    			});		

    			$.ajax({  
    	               url      		 : "/admin/interface/selectCodeDetail"
    	              ,data 			 : consultResultParam
    	              ,type    			 : "POST"
    	              ,dataType 		 : "json"
    	              ,success  : function(data) {
    	            	  consultResultList = data.rows[0].children;
    	            	  
    	  				var param = {};
    					${_prefix}.init( param );
    					
    					$('#dg${_prefix}').datagrid('enableCellEditing');
    	              }
           		});
    			
    			$.ajax({  
 	               url      		 : "/admin/interface/selectCodeDetail"
 	              ,data 			 : visitStateParam
 	              ,type    			 : "POST"
 	              ,dataType 		 : "json"
 	              ,success  : function(data) {
 	            	 visitStateList = data.rows[0].children;
 	            	  
 	  				var param = {};
 					${_prefix}.init( param );
 					
 					//$('#dg${_prefix}').datagrid('enableCellEditing');
 	              }
        		});
				
				//기존 엑셀다운로드
				/* $(".excelDownConsultList").off("click").on("click", function() {
	    			
	    			var encodeName = encodeURIComponent("홈페이지상담리스트");
	    			var searchType	 = $("#mh_type_val${_prefix}").val();
	    			
	    			if( searchType != null ) {
		        		location.href= "/admin/consult/excelDownload?file="+encodeName+"&target=siteConsult&searchType="+searchType;
	    			} else {
	    				location.href= "/admin/consult/excelDownload?file="+encodeName+"&target=siteConsult&searchType=";
	    			}
	    		}); */
				
    		});
    		
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
							var html ='<option value="" selected="selected">타입 선택</option>';
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
		
			    		
    		function consultListReload(_prefix)
        	{
    			var prefix = "_" + _prefix;
    			$('#w' + prefix).window('close');
    			$('#dg' + prefix).datagrid("reload");
        	}
    		
    		function consultCheckSave() {
    			
    			$('#dg${_prefix}').datagrid('acceptChanges');

    			var consultCheckParam = {};
    	    	var rows = $('#dg${_prefix}').datagrid('getRows');
    	    	var checkCnt = 0;
    	    	var checkRow = [];
    	    	
    	    	for(var i=0; i<rows.length; i++) {
    	    		var row = rows[i];
    	    		
    	    		if(row.checkYn == 'Y') {
    	    			checkCnt++;
    	    			checkRow.push(row);
    	    		}
    	    	}
    	    	
    	    	if(checkCnt == 0) {
    	    		alert("선택된 내용이 없습니다.");
    	    		return false;
    	    	}
    	    	
    	    	consultCheckParam.grid = checkRow;

    	    	consultCheckParam = JSON.stringify(consultCheckParam);

    	    	console.log(consultCheckParam);
    	    	
    	    	$.messager.confirm('저장', '저장하시겠습니까?', function(r){
    	    		if (r){
    	    			$.messager.progress({
    	    				title:'Please waiting',
    	    				msg:'save data...'
    	    			});

    					$.ajax({
			                		url      		 	: '/admin/interface/updateSiteConsultGrid'
	    	    	              , data 			 : consultCheckParam
	    	    	              , type   			 : "POST"
	    	    	              , dataType 	 	 : "json"
	    	    	              , contentType		 : "application/json; charset=UTF-8"
    			              	  , success  : function(data) {
    	    	    				$.messager.progress('close');
    	    	    				$('#dg${_prefix}').datagrid('getPager').pagination('select');
    			              }
    	           		});
    	    		}
    	    	});
    		}
    		
    </script>
    <div id="w${_prefix}" class="easyui-window" title="상담상세" data-options="modal:true ,closed:true" style="width:90%;height:90%;padding:10px;">
    </div>
    
</body>
</html>
