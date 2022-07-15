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
		<a href="javascript:void(0)" class="easyui-linkbutton" data-prefix="${_prefix}" onclick="$('#dg${_prefix}').datagrid('toExcel','상담리스트.xls')">엑셀 다운</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-prefix="${_prefix}" onclick="reservationCheckSave()">선택 저장</a>
		<%-- <a href="javascript:void(0)" class="easyui-linkbutton" data-prefix="${_prefix}" menu_code_text="엑셀다운"  data-options="iconCls:'icon-download',plain:true">엑셀다운로드</a> --%>		
	</div>
	

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp"%>

	<script type="text/javascript">
	
    		
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
    	    			    url		:'/admin/interface/selectBoard/${menu_code}'		,
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
    	    			    onDblClickRow: function(index, rows) {
    	    			    	
    	    			    	var row = $('#dg${_prefix}').datagrid('getSelected');  
    	    			    	
    	    			    	$('#w${_prefix}').window('center').window('open');
    	    			    	
    	    			    	var menu_code_text = $('.tabs-selected').children().children(".tabs-title").text();
    	    			    	
    	    					$('#w${_prefix}').window('refresh', '/admin/board/boardForm/'+menu_code_text+'?board_idx=' + rows.board_idx);
    	    			    	
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
	    			        		field : 'board_cate_L'		,
	    			        		title : '카테고리'			,
	    			        		align : 'center'		,
	    			        		width : '10%'				,
    	    			        	formatter:function( value, row ){    	    			        		
    	    			        		return "<span>"+value+"</span>";
          			    			},
		    			        	/* editor:{
	    			        			type		:"validatebox"	,
	    			        			options:{
	    			        				required:true			,
	    			        				missingMessage : '메세지코드는 필수 입력값입니다.' ,
	    			        				validateOnBlur : true ,
	    			        				validType : [ 'empty["메세지코드는 필수 입력값입니다."]' ]
	    			        			}	    			        			
		    			        	} */
		    			        }    	    			        
    	    			        , 
    	    			        {
    	    			        	field:'board_reg_name'		,
    	    			        	title:'이름'		, 
    	    			        	align:'center',
    	    			        	width:"5%"
    	    			        }
    	    			        , 
    	    			        {
    	    			        	field:'board_mobile'		,
    	    			        	title:'연락처'		, 
    	    			        	align:'center',
    	    			        	width:"10%"
    	    			        }
    	    			        , 
    	    			        {
    	    			        	field:'board_etc1_date'		,
    	    			        	title:'예약일'				, 
    	    			        	align:'center'				,
    	    			        	width:"10%"				    	    			        	
    	    			        }
    	    			        , 
    	    			        {
    	    			        	field:'board_etc1_time'		,
    	    			        	title:'예약시간'		, 
    	    			        	align:'center',
    	    			        	width:"5%"
    	    			        }
    	    			        , 
    	    			        {
    	    			        	field:'board_etc2'		,
    	    			        	title:'상태'		, 
    	    			        	align:'center',
    	    			        	width:"5%",
    	    			        	formatter:function(value,row){
    	    			        		
    	    			        		var val;
										
    	    			        		if( value == '1' ) {
    	    			        			val= '접수';
    	    			        		} else if( value == '2' ) {
    	    			        			val= '대기';
    	    			        		} else if( value == '3' ) {
    	    			        			val= '완료';
    	    			        		} else if( value == '4' ) {
    	    			        			val= '취소';
    	    			        		}     	    		
    	    			        		
    	    			        		return val;
    	    			        	}
    	    			        }
    	    			        , 
    	    			        {
    	    			        	field:'utm_source'		,
    	    			        	title:'utm_source'		, 
    	    			        	align:'center',
    	    			        	width:"5%"
    	    			        }
    	    			        , 
    	    			        {
    	    			        	field:'utm_medium'		,
    	    			        	title:'utm_medium'		, 
    	    			        	align:'center',
    	    			        	width:"5%"
    	    			        }
    	    			        , 
    	    			        {
    	    			        	field:'utm_campaign'		,
    	    			        	title:'utm_campaign'		, 
    	    			        	align:'center',
    	    			        	width:"5%"
    	    			        }
    	    			        
    	    			        , 
    	    			        {
    	    			        	field:'utm_term'		,
    	    			        	title:'utm_term'		, 
    	    			        	align:'center',
    	    			        	width:"5%"
    	    			        }
    	    			        
    	    			        , 
    	    			        {
    	    			        	field:'utm_content'		,
    	    			        	title:'utm_content'		, 
    	    			        	align:'center',
    	    			        	width:"5%"
    	    			        }
    	    			        
    	    			        
		    			        ,		    			        
		    			        {
	    			        		field:'board_reg_date'		,
	    			        		title:'등록일시'			,
	    			        		width:"10%"				,
	    			        		align:'center'		,
		    			        	/* editor:{
	    			        			type		:"validatebox"	,
	    			        			options:{
	    			        				required:true			,
	    			        				missingMessage : '메세지코드는 필수 입력값입니다.' ,
	    			        				validateOnBlur : true ,
	    			        				validType : [ 'empty["메세지코드는 필수 입력값입니다."]' ]
	    			        			}	    			        			
		    			        	} */
		    			        }
		    			        ,
		    			        {
    								field:'consult_state',
    	    			        	title:'상담',
    								width:'5%',
    								align:'center',
    								formatter:function(value,row){
    									var state;
    									if(row.consult_state == 'A173_0'){
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
    										data: reservationStateList,
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
    									if(row.reservation_state == 'A173_0'){
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
    										data: reservationStateList,
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
    									if(row.visit_state == 'A173_0'){
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
    										data: reservationStateList,
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
    									if(row.contract_state == 'A173_0'){
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
    										data: reservationStateList,
    										required:false,
    									}
    								}
    	    			    	}
		    			        ,
		    			        {
    	    			        	field : 'board_idx'		,
    	    			        	hidden : true
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
    		
			function reservationCheckSave() {
    			
    			$('#dg${_prefix}').datagrid('acceptChanges');

    			var reservationCheckParam = {};
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
    	    	
    	    	reservationCheckParam.grid = checkRow;

    	    	reservationCheckParam = JSON.stringify(reservationCheckParam);

    	    	
    	    	$.messager.confirm('저장', '저장하시겠습니까?', function(r){
    	    		if (r){
    	    			$.messager.progress({
    	    				title:'Please waiting',
    	    				msg:'save data...'
    	    			});

    					$.ajax({
			                		url      		 	: '/admin/interface/updateReservationGrid'
	    	    	              , data 			 : reservationCheckParam
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
    <div id="w${_prefix}" class="easyui-window" title="${boardOptionList[0].tcd_title}" data-options="modal:true ,closed:true" style="width:90%;height:90%;padding:10px;">
    </div>
    
</body>
</html>
