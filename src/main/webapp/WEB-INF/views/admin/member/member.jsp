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

	<div class="easyui-panel" title="회원관리 "
		style="height: 120px; padding: 5px; border: 0;"
		data-options="iconCls:'icon-redo'">
		<div id="p${_prefix}" class="easyui-panel" title="검색창"
			style="width: 100%; height: 100%; padding-left: 10px; padding-top: 15px"
			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">
			<div>		
				<div style="display:inline-block;width:23%;">
					<input id="board_search_str_date${_prefix}" name="board_search_str_date${_prefix}" class="easyui-datebox easyui-validatebox" style="width: 120px">
					~
					<input id="board_search_end_date${_prefix}" name="board_search_end_date${_prefix}" class="easyui-datebox easyui-validatebox" style="width: 120px"> 
				</div>
				
				<select class="easyui-combobox searchSel" id="board_search_email${_prefix}" style="width: 5%">
					<option value="ALL" selected="selected">메일수신</option>
					<option value="Y">수신</option>
					<option value="N">거부</option>
				</select>
				
				<select class="easyui-combobox searchSel" id="board_search_sms${_prefix}" style="width: 5%">
					<option value="ALL" selected="selected">SMS수신</option>
					<option value="Y">수신</option>
					<option value="N">거부</option>
				</select>
						
				<select class="easyui-combobox searchSel" id="board_search_memDel${_prefix}" style="width: 5%">
					<option value="ALL" selected="selected">탈퇴여부</option>
					<option value="Y">신청대기</option>
					<option value="N">미신청</option>
				</select>
				
				<select class="easyui-combobox searchSel" id="board_search_option${_prefix}" style="width: 5%">					
					<option value="id">이름</option>
					<option value="name">아이디</option>
					<option value="mobile">휴대폰</option>
					<option value="email">이메일</option>
				</select>
				
				<input id="search_box${_prefix}" data-prefix="${_prefix}" class="easyui-textbox"style="width: 20%;">
			</div>
		</div>
	</div>


	<div class="easyui-panel"
		style="height: auto; padding: 5px; border: 0;">
		<table id="dg${_prefix}" title="회원관리"  class="" style="width: 100%; height: auto">
		</table>
	</div>
	<div id="tb${_prefix}" style="height: auto">
		<a href="javascript:void(0)" class="easyui-linkbutton excelDownMemberList${_prefix }" data-prefix="${_prefix}" menu_code_text="엑셀다운"  data-options="iconCls:'icon-download',plain:true">엑셀다운로드</a>
		<a href="javascript:void(0)" class="easyui-linkbutton addBoardWinCallBtn${_prefix}" data-prefix="${_prefix}" menu_code_text="회원등록"  data-options="iconCls:'icon-add',plain:true">회원등록</a>
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
														
														var board_show_str_date = "";
										   				var board_show_end_date = "";
										   				
												    	var format = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
												    	var str = $("#board_search_str_date${_prefix}").val().split(" ")[0];
												    	var end = $("#board_search_end_date${_prefix}").val().split(" ")[0];
												    	
												    	if( str != "" && str != null && end != "" && end != null) {
												    		var strArr = str.split('-');
												    		var endArr = end.split('-');
												    		var strCompare = new Date(strArr[0], parseInt(strArr[1])-1, strArr[2]);
												            var endCompare = new Date(endArr[0], parseInt(endArr[1])-1, endArr[2]);
												    		
												            if(strCompare.getTime() > endCompare.getTime()) {											                
												                alert("시작날짜와 종료날짜를 확인해 주세요.");
												                return false;
												            }
												    	}
											            														
														var param = {};																												
														param.board_search = getValue;
														param.board_search_str_date	= $("#board_search_str_date${_prefix}").val();
														param.board_search_end_date	= $("#board_search_end_date${_prefix}").val();
														param.board_search_email		= $("#board_search_email${_prefix}").val();
														param.board_search_sms			= $("#board_search_sms${_prefix}").val();
														param.board_search_memDel	= $("#board_search_memDel${_prefix}").val();
														param.board_search_option		= $("#board_search_option${_prefix}").val();
														
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

						param.board_search_show = "ALL";
						this.dataload( param  );

					}
					,
					
					dataload  : function(param){
    	    			$('#dg${_prefix}').datagrid({
    	    			    url		:'/admin/interface/selectMemberList'		,
    	    			    queryParams :param 								 ,
    	    			    pagination : true 			,
    	    			    rownumbers :  true 		,
    	    			    pageSize : 50			,
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
    	    			    	
    	    			    	var row = $('#dg${_prefix}').datagrid('getSelected');  
    	    			    	$('#w${_prefix}').window('center').window('open');
    	    			    	
    	    					$('#w${_prefix}').window('refresh', '/admin/member/memberForm?tblNumber=' + row.tblNumber);
    	    			    	
    	    			    }
    	    				,
    	    			    columns:[[    	    			        
    	    			        {
    	   			        		field:'tblIntLevel'	,
    	   			        		title:'회원구분'				,
    	   			        		width:"5%"					,
    	    			        	align:'center'	,
    	    			        	formatter: function(value, row) {
    	    			        		if( value != '' && value != null) {
    	    			        			return row.levelName;	
    	    			        		}    	    			        			
    	    			        	}
    	    			        },
    	    			        {
    	   			        		field:'tblStrID'	,
    	   			        		title:'아이디'				,
    	   			        		width:"7%"					,
    	    			        	align:'center'				
    	    			        },
    	    			        {	
    	    			        	field:'tblStrName'			,
    	    			        	title:'이름'					, 
    	    			        	width:"7%"					,
    	    			        	align:'center'					
    	    			        }
    	    			        ,
    	    			        {
    	    			        	field:'tblStrMobile'			,
    	    			        	title:'연락처'				, 
    	    			        	width:"8%"					,
    	    			        	align:'center'					
    	    			        },
    	    			        {
    	    			        	field:'tblStrEmail'		,
    	    			        	title:'이메일'				, 
    	    			        	width:"10%"					,
    	    			        	align:'center'				
    	    			        },
    	    			        {	
    	    			        	field:'tblDtmRegDate'		,
    	    			        	title:'가입일'				, 
    	    			        	width:"10%"					,
    	    			        	align:'center'					
    	    			        },
    	    			        {	
    	    			        	field:'tblDtmLastDate'		,
    	    			        	title:'최근접속일'				, 
    	    			        	width:"10%"					,
    	    			        	align:'center'					
    	    			        },
    	    			        {
    	   			        		field:'tblPassType'	,
    	   			        		title:'비고'				,
    	   			        		width:"5%"					,
    	    			        	align:'center'			,    	    			        	
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
    			
    			$(".addBoardWinCallBtn${_prefix}").off("click").on("click", function(){
    				
        			var $windowTarget = $("#w" +  $(this).data("prefix"));
        			
        			$windowTarget.window('center').window('open');
        			$windowTarget.window('refresh', '/admin/member/memberForm');    				
    				
    			});
    			
				var param = {};
				${_prefix}.init( param );
				
				$(".excelDownMemberList${_prefix}").off("click").on("click", function() {
	    			
	    			var encodeName = encodeURIComponent("회원리스트");
	    			
	        		location.href= "/admin/member/excelDownload?file="+encodeName+"&target=tblMember";
	    		});
				
    		});
			    		
    		function memberListReload(_prefix)
        	{
    			var prefix = "_" + _prefix;
    			$('#w' + prefix).window('close');
    			$('#dg' + prefix).datagrid("reload");
        	}
    		
    		$.fn.datebox.defaults.formatter = function (date) {
    		    if (!(date instanceof Date)) date = new Date(date);

    		    function _ff(v) {
    		        return (v < 10 ? "0" : "") + v;
    		    };
    		    return _ff(date.getFullYear())+'-'+_ff(date.getMonth()+1)+'-'+ _ff( date.getDate() );
    		};
    		
    		 $.fn.datebox.defaults.parser = function (s) {
    		    if ($.trim(s) == "") {
    		        return new Date();
    		    }

    		    var dt = s.split(" ");
    		    var p1 = dt[0].split('-');
    		    
    		    return new Date(p1[0],p1[1]-1,p1[2]);
    		};
    		
    		
    		
    </script>
    <div id="w${_prefix}" class="easyui-window" title="회원상세" data-options="modal:true ,closed:true" style="width:90%;height:90%;padding:10px;">
    </div>
    
</body>
</html>
