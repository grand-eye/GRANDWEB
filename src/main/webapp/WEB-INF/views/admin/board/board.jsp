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
<body id="boardBody">

	<div class="easyui-panel" title="게시판관리 > ${boardOptionList[0].tcd_title} "
		 style="padding: 5px; border: 0;" 
		 data-options="iconCls:'icon-redo'">
		<div id="p${_prefix}" class="easyui-panel" title="검색창" 
			style="width: 100%;padding:15px 10px;" 
			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">
			<div class="easyui-combobox-area">
				<c:if test="${boardOptionList[0].tcd_attr2 ne 'N'}">
					<select class="easyui-combobox searchSel" id="board_cate_L_${_prefix}"  data-prefix="${_prefix}" style="width: 12.3%;"> </select>
				</c:if>
				<c:if test="${boardOptionList[0].tcd_attr2 == 'A180'}">
					<select class="easyui-combobox searchSel" id="board_cate_M_${_prefix}"  data-prefix="${_prefix}" style="width: 12.3%;"> </select>
				</c:if>
				<select class="easyui-combobox searchSelDivide" id="board_search_select${_prefix}" style="width: 12.3%">
					<option value="" selected="selected">제목+내용</option>
					<option value="TITLE">제목</option>
					<option value="NAME">작성자</option>
					<option value="DETAIL">내용</option>
					<option value="MOBILE">연락처</option>
				</select>
				<input id="search_start_date${_prefix}" data-prefix="${_prefix}" class="easyui-datebox" label="" style="width: 12.3%;"><b style="margin:0px 15px 0px 0px;">~ </b>
				<input id="search_end_date${_prefix}" data-prefix="${_prefix}" class="easyui-datebox" label="" style="width: 12.3%;">
				<input id="search_box${_prefix}" data-prefix="${_prefix}" class="easyui-textbox" style="width: 20%;">
			</div>
		</div>
	</div>

	<div class="easyui-panel" style="height: auto; padding: 5px; border: 0;">
		<table id="dg${_prefix}" title="${boardOptionList[0].tcd_title}" class="" 
			style="width: 100%; height: 700px;">
		</table>
	</div> 
	<div id="tb${_prefix}" style="height: auto">
		<c:if test="${boardOptionList[0].tcd_code != 'BD04' || boardOptionList[0].tcd_code != 'BD05'}">
		<a href="javascript:void(0)" class="easyui-linkbutton addBoardWinCallBtn" id="addBoardWinCallBtn${_prefix}" data-prefix="${_prefix}" menu_code_text="${boardOptionList[0].tcd_title}"  data-options="iconCls:'icon-add',plain:true">${boardOptionList[0].tcd_title} 추가</a>
		</c:if>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-prefix="${_prefix}" onclick="toExcel();">엑셀 다운</a>
		<%-- <a href="javascript:void(0)" class="easyui-linkbutton" data-prefix="${_prefix}" onclick="visitCheckSave()">저장하기</a> --%>
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
          }else{
             return new Date();
          }
        }
    });
    		
    		/** 전역 Plugin를 만들어야 한다.**/
    		
    		var cateList;
    		var visitStateParam = {};
    		visitStateParam.search_master;
    		visitStateParam.tcd_useyn = "Y";
   		
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
														var board_cate_L_search = "";
														var board_menu_code_search = "";
														var board_cate_M_search = "";
														
														<c:if test="${boardOptionList[0].tcd_attr2 ne 'N'}">
														//board_cate_search = board_cate_search.substring(5);
															/* if ( getValue == "" && board_cate_L_search == "" )
															{
																$.messager.alert('경고창','카테고리선택 또는 제목을 입력해주세요.' ,'error' );
																$(e.data.target).focus();
																return false;
															} */
														</c:if>
														
														var opts = $('#dg${_prefix}').datagrid('options');
														var param = {};
														
														if( $("#board_search_select${_prefix}").val() == "MOBILE"){
															getValue = getValue.replace(/-/g, '');
														}
																								
														param.board_search = getValue;
														param.board_search_show = $("#board_search_show${_prefix}").val();
														if($("#board_search_select${_prefix}").val() == "NAME"){
															param.board_search_divide = "NAME";
														}
														else if($("#board_search_select${_prefix}").val() == "TITLE"){
															param.board_search_divide = "TITLE";
														}
														else if($("#board_search_select${_prefix}").val() == "DETAIL"){
															param.board_search_divide = "DETAIL";
														}
														
														param.board_start_date = $("#search_start_date${_prefix}").datebox('getValue');
														if($("#search_end_date${_prefix}").datebox('getValue') != '') {
															param.board_end_date = $("#search_end_date${_prefix}").datebox('getValue');
														}
														param.board_cate_L_search = board_cate_L_search;
														param.board_menu_code_search = board_menu_code_search;
														//param.board_cate_search = board_cate_search;
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
													param.board_search_show = "ALL";
													${_prefix}.dataload( param  ); 				    						
												}
											}
										]
						
						});
						
						
						
						${_prefix}._data.push("a");
						${_prefix}._data.push("b");

						param.board_search_show = "ALL";
						this.dataload( param  );
						
					}
					,
					dataload  : function(param){
    	    			$('#dg${_prefix}').datagrid({
    	    			    url		:'/admin/interface/selectBoard/${menu_code}'	,
    	    			    queryParams :param 	,
    	    			    pagination : true 			,
    	    			    pageSize : 50,
    	    			    pageList : [50, 100, 200, 1000, 10000]			,
    	    			    rownumbers :  true 		,
    	    			    singleSelect :  true 		,
    	    			    //fitColumns : true			,
    	    			    fit : false						,
    	    			    toolbar	: "#tb${_prefix}"	,
    	    			    onLoadSuccess : function(data) {
    	    			    	if(${_prefix =='_BDMNG'}){
    	    			    		$('#dg${_prefix}').datagrid('hideColumn', 'board_menu_code_hide');
    	    			    	}

        		    	    	var rows = $('#dg${_prefix}').datagrid('getRows');
        		    	    	
        		    	    	if(${_prefix =='_BDMNG'}){
	        		    	    	for(var i=0; i<rows.length; i++) {
	        		    	    		var row = rows[i];
	        		    	    		
	        		    	    		row.board_menu_code_hide = row.board_menu_code;
	        		    	    	}
        		    	    	}
    	    			    }
    	    				,
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
    	    			    	var menu_code_text = $('.tabs-selected').children().children(".tabs-title").text();
    	    			    	
    	    					$('#w${_prefix}').window('refresh', '/admin/board/boardForm/'+menu_code_text+'?board_idx=' + rows.board_idx);
    	    			    	
    	    			    }
    	    				,
    	    			    columns:[[
    	    			    	{
    	    			    		field : 'checkYn',
    	    			    		title : '선택',
    	    			        	width:"3%",
    	    			        	styler: function(value,row,index){
	    								return {class:'checkYn'};
	    							},
    	    			    		editor:{
    	    			    			type:'checkbox',
    	    			    			options:{
    	    			    				on:'Y',
    	    			    				off:'',
    	    			    				default:'Y'
    	    			    			}
    	    			    		},
    	    			        	align:'center'
    	    			    	}
    	    			    	,
    	    			    	{
	    			        		field:'board_reg_date'		,
	    			        		title:'등록일시'			,
	    			        		width:"10%"				,
	    			        		align:'center'		,
	    			        		styler: function(value,row,index){
	    								return {class:'board_reg_date'};
	    							},
	    							sortable:true
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
    	    			        <c:if test="${boardOptionList[0].tcd_attr2 ne 'N' && boardOptionList[0].tcd_code ne 'BD10' && boardOptionList[0].tcd_code ne 'BD09'}">
	    	    			       	{
		    			        		field:'board_cate_L'		,
		    			        		title:'진료종류'			,
		    			        		width:"6%"				,
		    			        		formatter:function(value,row){
		    			        			return row.tcd_title;
	          			    			},
	          			    			sortable:true,
	          			    			/* editor:{
	    									type:'combobox',
	    									options:{
	    										editable: false,
	    										valueField:'board_cate_L_cd',
	    										textField:'board_cate_L_nm',
	    										data: cateList,
	    										required:false,
	    									}
	    								}, */
	          			    			styler: function(value,row,index){
		    								return {class:'board_cate_L'};
		    								// return {class:'c1',style:'color:red'}
		    							}
			    			        }
	    	    			        ,
		    			        	{
		    			        		field:'board_reg_name'		,
		    			        		title:'작성자'			,
		    			        		width:"6%"				,
		    			        		align:'center'		,
		    			        		sortable:true,
		    			        		styler: function(value,row,index){
		    								return {class:'board_reg_name'};
		    								// return {class:'c1',style:'color:red'}
		    							}
		    			        	
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
	    			        </c:if>
		    			    
    			        	 <c:if test="${boardOptionList[0].tcd_code eq 'BD05'}">
	    	    			       	{
		    			        		field:'board_etc2'		,
		    			        		title:'예약시간'			,
		    			        		width:"6%"				,
		    			        		formatter:function(value,row){
		    			        			return row.board_etc2;
	          			    			},
	          			    			sortable:true,
	          			    			/* editor:{
	    									type:'combobox',
	    									options:{
	    										editable: false,
	    										valueField:'board_cate_L_cd',
	    										textField:'board_cate_L_nm',
	    										data: cateList,
	    										required:false,
	    									}
	    								}, */
	          			    			styler: function(value,row,index){
		    								return {class:'board_etc2'};
		    								// return {class:'c1',style:'color:red'}
		    							}
			    			        }
		    			        	,
		    			        	{
		    			        		field:'board_reg_name'		,
		    			        		title:'작성자'			,
		    			        		width:"6%"				,
		    			        		align:'center'		,
		    			        		sortable:true,
		    			        		styler: function(value,row,index){
		    								return {class:'board_reg_name'};
		    								// return {class:'c1',style:'color:red'}
		    							}
		    			        	
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
		    			        		field:'board_mobile'		,
		    			        		title:'연락처'			,
		    			        		width:"10%"				,
										formatter:function(value,row){
											
											if(row.board_mobile.length == 11){
												var split = [];
												var number;
												split[0] = row.board_mobile.substring(0,3);
												split[1] = row.board_mobile.substring(3,7);
												split[2] = row.board_mobile.substring(7);
												number = split[0] +"-"+ split[1] +"-"+ split[2];
												return number;
											}else{
												 return row.board_mobile;
											}
											
		      			    			},
		      			    			styler: function(value,row,index){
		    								return {class:'board_mobile'};
		    								// return {class:'c1',style:'color:red'}
		    							}
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
			    			        
	    			        </c:if>

	    			        <c:if test="${boardOptionList[0].tcd_code eq 'BD21' || boardOptionList[0].tcd_code eq 'BD08' || boardOptionList[0].tcd_code eq 'BDMNG'}">
	    			        {
    			        		field:'board_mobile'		,
    			        		title:'연락처'			,
    			        		width:"6%"				,
								formatter:function(value,row){
									
									if(row.board_mobile.length == 11){
										var split = [];
										var number;
										split[0] = row.board_mobile.substring(0,3);
										split[1] = row.board_mobile.substring(3,7);
										split[2] = row.board_mobile.substring(7);
										number = split[0] +"-"+ split[1] +"-"+ split[2];
										return number;
									}else{
										 return row.board_mobile;
									}
									
      			    			},
      			    			styler: function(value,row,index){
    								return {class:'board_mobile'};
    								// return {class:'c1',style:'color:red'}
    							}
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
	    			        </c:if>
	    			        <c:if test="${boardOptionList[0].tcd_code ne 'BD05'}">
    	    			        {
    	    			        	field:'board_title'		,
    	    			        	title:'제목'		,
    	    			        	id:'board_title_id',
    	    			        	width:"10%"				,
    	    			        	/* formatter:function(value,row){
    	    			        		
          			    			}, */
          			    			sortable:true,
          			    			styler: function(value,row,index){
	    								return {class:'board_title'};
	    								// return {class:'c1',style:'color:red'}
	    							}
    	    			        	/* editor:{
    				        			type		:"validatebox"	,
    				        			options:{
    				        				required:true			,
    				        				missingMessage : '메세지 내용은 필수 입력값입니다.' ,
    				        				validateOnBlur : true 
    				        			}	    			        			
    	    			        	} */
    	    			        }
    	    			    ,
							</c:if> 
    	    			        <c:if test="${boardOptionList[0].tcd_code == 'BD17'}">
    	    			        {
    	    			        	field:'board_detail'		,
    	    			        	title:'고객문의'		, 
    	    			        	width:"15%"				,
									formatter:function(value,row){
											var word = "";
											if(row.board_detail != null && row.board_detail != ''){
												word = row.board_detail.replace(/<br>/gi,"");
												word = word.replace(/[<v](.*?)[>]/g,"");
												word = word.replace(/<p>/gi,"");
												word = word.replace(/<\/p>/gi,"");
												word = word.replace("white-space: pre-wrap;","");
											}
											return word;
          			    			},
          			    			sortable:true,
          			    			styler: function(value,row,index){
	    								return {class:'board_detail'};
	    								// return {class:'c1',style:'color:red'}
	    							}
    	    			        }
    	    			        ,
    	    			        {
    	    			        	field:'board_memory'		,
    	    			        	title:'상담내용(메모)'		, 
    	    			        	width:"15%"				,
									formatter:function(value,row){
												var word = "";
												if( row.board_memory !=null && row.board_memory != ''){
													word = row.board_memory.replace(/<br>/gi,"");
													word = word.replace(/<p>/gi,"");
													word = word.replace(/<\/p>/gi,"");
													
												}
												return word;
											
          			    			},
          			    			sortable:true,
          			    			styler: function(value,row,index){
	    								return {class:'board_memory'};
	    								// return {class:'c1',style:'color:red'}
	    							}
    	    			        }
    	    			        ,
		    			        </c:if>
		    			        /* 전문가상담-온라인상담 휴대폰번호, 플랫폼, 광고상품, 광고특징  칼럼 노출 */
		    			        <c:if test="${boardOptionList[0].tcd_code ne 'BD05'}">
		    			        {
    	    			        	field:'board_cnt'		,
    	    			        	title:'조회수'		,
    	    			        	align:'center',
    	    			        	width:"6%"			,
    	    			        	styler: function(value,row,index){
	    								return {class:'board_cnt'};
	    								// return {class:'c1',style:'color:red'}
	    							},
    	    			        	/* editor:{
    				        			type		:"validatebox"	,
    				        			options:{
    				        				required:true			,
    				        				missingMessage : '메세지 내용은 필수 입력값입니다.' ,
    				        				validateOnBlur : true 
    				        			}	    			        			
    	    			        	} */
    	    			        }
		    			        </c:if>
    	    			        <c:if test="${boardOptionList[0].tcd_code eq 'BD21' || boardOptionList[0].tcd_code eq 'BD08' || boardOptionList[0].tcd_code eq 'BDMNG'}">
    	    			        ,
		    			        {
    	   			        		field:'board_reg_ip'	,
    	   			        		title:'ip'				,
    	   			        		width:"6%"					,
    	    			        	align:'center'			,
    	    			        	styler: function(value,row,index){
	    								return {class:'board_reg_ip'};
	    								// return {class:'c1',style:'color:red'}
	    							},
    	    			        }
		    			        ,
		    			        {
	    			        		field:'utm_source'		,
	    			        		title:'utm_source'			,
	    			        		width:"6%",
	    			        		styler: function(value,row,index){
	    								return {class:'utm_source'};
	    								// return {class:'c1',style:'color:red'}
	    							},
		    			        }
		    			        ,	
		    			        {
	    			        		field:'utm_medium'		,
	    			        		title:'utm_medium'			,
	    			        		width:"6%",
	    			        		styler: function(value,row,index){
	    								return {class:'utm_medium'};
	    								// return {class:'c1',style:'color:red'}
	    							},
		    			        }
		    			        ,	
		    			        {
	    			        		field:'utm_campaign'		,
	    			        		title:'utm_campaign'			,
	    			        		width:"6%",
	    			        		styler: function(value,row,index){
	    								return {class:'utm_campaign'};
	    								// return {class:'c1',style:'color:red'}
	    							},
		    			        }
		    			        
		    			        ,	
		    			        {
	    			        		field:'utm_term'		,
	    			        		title:'utm_term'			,
	    			        		width:"6%",
	    			        		styler: function(value,row,index){
	    								return {class:'utm_term'};
	    								// return {class:'c1',style:'color:red'}
	    							},
		    			        }
		    			        
		    			        ,	
		    			        {
	    			        		field:'utm_content'		,
	    			        		title:'utm_content'			,
	    			        		width:"6%",
	    			        		styler: function(value,row,index){
	    								return {class:'utm_content'};
	    								// return {class:'c1',style:'color:red'}
	    							},
		    			        }
		    			        ,
    	    			        </c:if>
    	    			        
								<c:if test="${boardOptionList[0].tcd_code eq 'BD08' || boardOptionList[0].tcd_code eq 'BDMNG'}">
    	    			        
    	    			        {
	    			        		field:'board_secret'		,
	    			        		title:'공개여부'			,
	    			        		width:"6%"				,
    	    			        	formatter:function(value,row){
    	    			        		
    	    			        		if(row.board_secret == "Y")
   	    			        			{
    	    			        			return "비공개";
   	    			        			} else {
   	    			        				return "공개";
    	    			        		}
          			    			},
          			    			styler: function(value,row,index){
	    								return {class:'board_secret'};
	    								// return {class:'c1',style:'color:red'}
	    							},
		    			        }   
    	    			        </c:if>
    	    			        ,
		    			        {
    	    			        	title:'idx'			,
    	    			        	field : 'board_idx'		,
    	    			        	hidden : true
    	    			        }
    	    			    ]]
    	    			});     								
    				}
					,
					gridAppend : function()
					{
						
					}
					,
					gridReject : function()
					{
						
					}
					,
					gridDelete : function()
					{
						
					}
					,
					gridEditing : function()
					{
							
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
    			fnCommonCodeSearch("board_cate_L_${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>",0, null);
    			
    			$("#addBoardWinCallBtn${_prefix}").off("click");
    			$("#addBoardWinCallBtn${_prefix}").on("click", function(){
    				
        			var menu_code_text = $(this).attr("menu_code_text"); //$('.tabs-selected').children().children(".tabs-title").text();
        			var $windowTarget = $("#w" +  $(this).data("prefix"));
        			
        			$windowTarget.window('center').window('open');
        			$windowTarget.window('refresh', '/admin/board/boardForm/'+menu_code_text+'?board_idx=');    				
    				
    			});
    			visitStateParam.search_master = "ALL";
    			
    			$.ajax({  
  	               url      		 : "/admin/interface/selectCodeDetail"
  	              ,data 			 : visitStateParam
  	              ,type    			 : "POST"
  	              ,dataType 		 : "json"
  	              ,success  : function(data) {
  	            	 //visitStateList = data.rows[0].children;
					
					
					cateList = [];
					$(data.rows[0].children).each(function(a, b) {
						var objData = {};
						if(b.tcd_master_code == 'A080'){
							objData.board_cate_L_cd = b.tcd_code;
							objData.board_cate_L_nm = b.tcd_title;
							
							cateList.push(objData);
						}
					});
  	            	 
  	  				var param = {};
  					${_prefix}.init( param );
  					
  					$('#dg${_prefix}').datagrid('enableCellEditing');
  	              }
         		});
    			
    			
				var param = {};
				${_prefix}.init( param );
				$(".datagrid-row").css("height",25);
				$(".excelDownConsultList").off("click").on("click", function() {
	    			var searchType	 = null;//$("#mh_type_val${_prefix}").val();
	    			
	    			if( searchType != null ) {
		        		location.href= "/admin/board/excelDownload?file="+encodeName+"&target=board&searchType="+searchType;
	    			} else {
	    				location.href= "/admin/board/excelDownload?file="+encodeName+"&target=board&searchType=";
	    			}
	    		});

				function fnCommonCodeSearch(appendId, code, level, p_code) {
	    			var treePrm = {};
					treePrm.search_master = code;
					treePrm.tcd_useyn = "Y";
					if(level != null) {
						treePrm.search_level = level;
						treePrm.search_parent = p_code;
					}
					$.ajax({  
			               url      		 : "/admin/interface/selectCodeDetail"
			              ,data 			 : treePrm
			              ,type    			 : "POST"
			              ,dataType 		 : "json"
			              ,success  : function(data) {
			            	  	if( p_code != null && p_code != '' ) {		            	  		
				            	  	$('#'+appendId).empty();
			            	  	}
			            	  	if(data.rows[0].children.length != 0){
			            	  		if(data.rows[0].children[0].tcd_level == 0){
			            	  			var html ='<option value="" selected="selected">D.B종류 선택</option>';
			            	  		}else{
			            	  			var html ='<option value="" selected="selected">진료종류 선택</option>';
			            	  		}
			            	  	}else{
			            	  		var html ='<option value="" selected="selected">진료종류 선택</option>';
			            	  	}
								
								
					           	var y = data.rows[0].children;
				            	$.each(y , function (index, item) { 
									html += '<option value="'+item.tcd_code+'">'+item.tcd_title+'</option>'
								});
				            	$('#'+appendId).append(html);
								if( "${_prefix == 'BDMNG'}" ){
					            	$('#'+appendId).combobox({
					            		onChange : function(newValue,oldValue){
					            			if( appendId == "board_cate_L_${_prefix}" ) {
					            				fnCommonCodeSearch("board_cate_M_${_prefix}", "<c:out value="${boardOptionList[0].tcd_master_code}" default="Korea" escapeXml="true"/>", 1, newValue);
					            			}				        			
						        		}
					            	});
					            	
				            	}else{
				            		$('#'+appendId).combobox({
						            	   
					            	});
				            	}
				            	
			              }
	           		});
	    		}
				
				$(".excelDownConsultList").off("click").on("click", function() {
	    			if(${_prefix =='_BD21'}){
	    				var encodeName = encodeURIComponent("상담리스트");
	    			}else if(${_prefix == '_BD08'}){
	    				var encodeName = encodeURIComponent("상담리스트");
	    			}
	    			var searchType	 = null;//$("#mh_type_val${_prefix}").val();
	    			
	    			if( searchType != null ) {
		        		location.href= "/admin/board/excelDownload?file="+encodeName+"&target=board&searchType="+searchType;
	    			} else {
	    				location.href= "/admin/board/excelDownload?file="+encodeName+"&target=board&searchType=";
	    			}
	    		});
    		});
    		
    		function boardReload(_prefix)
        	{
    			
    			var prefix = "_" + _prefix;
    			$('#w' + prefix).window('close');
    			$('#dg' + prefix).datagrid("reload");
        	}
    		
			function visitCheckSave() {
    			
    			$('#dg${_prefix}').datagrid('acceptChanges');

    			var visitCheckParam = {};
    	    	var rows = $('#dg${_prefix}').datagrid('getRows');
    	    	var checkCnt = 0;
    	    	var checkRow = [];
    	    	
    	    	for(var i=0; i<rows.length; i++) {
    	    		var row = rows[i];
    	    		
    	    		if(row.checkYn == 'Y') {
    	    			checkCnt++;
    	    			checkRow.push(row);
    	    		}
    	    		
    	    		/* checkCnt++;
	    			checkRow.push(row); */
    	    	}
    	    	
    	    	if(checkCnt == 0) {
    	    		alert("선택된 내용이 없습니다.");
    	    		return false;
    	    	}
    	    	
    	    	visitCheckParam.grid = checkRow;

    	    	visitCheckParam = JSON.stringify(visitCheckParam);
    	    	

    	    	
    	    	$.messager.confirm('저장', '저장하시겠습니까?', function(r){
    	    		if (r){
    	    			$.messager.progress({
    	    				title:'Please waiting',
    	    				msg:'save data...'
    	    			});

    					$.ajax({
			                		url      		 	: '/admin/interface/updateReservationGrid'
	    	    	              , data 			 : visitCheckParam
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
			
			function toExcel()
			{
	            var columns = $('#dg${_prefix}').datagrid('options').columns[0];
	            var rows = $('#dg${_prefix}').datagrid('getRows');
	            
	            rows.map(row => {
	                columns.forEach(column => {
	                	
	                	//console.log("column="+column.formatter);
	                });
	                return row;
	            });
				
				
				$('#dg${_prefix}').datagrid('toExcel',{filename:'grand_data.xls',rows:rows});
				
				var param = {};
				param.rows = 50;
				param.page = 1;
				param.board_search_show = "ALL";
				
				${_prefix}.dataload( param  ); 	
			}
    </script>
    <div id="w${_prefix}" class="easyui-window" title="${boardOptionList[0].tcd_title}" data-options="modal:true ,closed:true" style="width:90%;height:90%;padding:10px;">
    </div>
    
</body>
</html>
