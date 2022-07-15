<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="messageBody">
    <div class="easyui-panel" title="관리자관리 > 관리자정보관리" style="height:167px;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
          <div 		id="p${_prefix}" 
        			class="easyui-panel" 
        			title="검색창" 
        			style="width:100%; height:auto;padding-top:7px;"                
        			data-options="iconCls:'icon-tip',collapsible:true,minimizable:false,maximizable:true,closable:false">
		    		<div>
				        <form id="ff${_prefix}" method="post">
				            <div style="margin-bottom:20px">
				            	<input  id="ta_team_code_s" name="ta_team_code" style="width:20%" />
				                <span style="width:20px"></span>

								<select class="" id="ta_group_code_s" name="ta_group_code" data-options="label:'권한',labelAlign:'right'" style="width:20%"  >
								</select>
				                <span style="width:20px"></span>
								<select class="easyui-combobox"  id="ta_use_yn_s" name="ta_use_yn" data-options="label:'사용여부',labelAlign:'right'" style="width:20%"  >
										<option value="">사용여부</option>
										<option value="Y">사용가능</option>
										<option value="N">사용불가</option>
								</select>                
				            </div>
				            <div style="margin-bottom:20px">
				                <input class="easyui-textbox" name="ta_user_id" style="width:20%" data-options="label:'아이디',labelAlign:'right'">
				                <span style="width:20px"></span>
				                <input class="easyui-textbox" name="ta_user_name" style="width:20%" data-options="label:'성명',labelAlign:'right'">			
				                
				                <a href="javascript:void(0)" class="easyui-linkbutton" id="searchBtn${_prefix}" style="width:80px">검색</a>	   
				                <a href="javascript:void(0)" class="easyui-linkbutton" id="initBtn${_prefix}" 		style="width:80px">초기화</a>             
				            </div>

				        </form>		    
    	
	           		 
		    		</div>
        </div>
    </div>
    
    <div class="easyui-panel" id="child_panel" style="height:auto;padding:5px;border:0;" >    
		<table title="" id="dgtree${_prefix}" class="" style="width:100%;height:auto">
			<thead>
				<tr>
					<th data-options="field:'ta_use_yn_msg'" 		width="10%">사용여부</th>			
					<th data-options="field:'ta_user_id'" 				width="10%" sortable="true"	>아이디</th>
					<th data-options="field:'ta_user_name'" 	 		width="10%" sortable="true"	>성명</th>
					<th data-options="field:'ta_phone'" 		 			width="10%" sortable="true"	>휴대폰</th>
					<th data-options="field:'ta_tel'" 				 		width="10%" sortable="true"	>내선번호</th>
					<th data-options="field:'ta_email'" 					width="20%" sortable="true">이메일</th>
					<th data-options="field:'ta_team_name'" 		width="10%">부서정보</th>
					<th data-options="field:'ta_reg_date'" 				width="20%">등록일시</th>
				</tr>
			</thead>
		</table>
		
		<div id="tb_sub${_prefix}" style="height:auto">
			<a href="javascript:void(0)" class="easyui-linkbutton" id="btn_add_child${_prefix}" data-options="iconCls:'icon-add',plain:true"   >관리자 추가</a>
		</div>	
		
        <div id="ww${_prefix}"class="easyui-window" title="관리자 정보관리" data-options="modal:true,closed:true" style="width:90%;height:90%;padding:10px;">
        </div>
    </div>

  	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>

    <script type="text/javascript" src="/admin/js/treegrid-dnd.js"></script>   
    <script type="text/javascript">
    
    		var editIndex = undefined;	//그리드 에디트를 위한 전역변수
    		var $selected = {
    				"master_code" : ""
    		};
    		
            function formatPrice(val,row){
            	
            	return formatnumber(val);

            }    		
    		
    		
    		var treePrm = {};
    		treePrm.search_level = "0";
    		treePrm.search_master = "A007";	
    	
    		$("#ta_team_code_s").combotreegrid(
    				{
    					url : "/admin/interface/selectCodeDetail"								,
    			        width:'20%'																		,
    			        panelWidth:800																		,					
    					queryParams :treePrm	 														,
    			        labelAlign:'right'																	,		
    			        label : '부서코드'																,
    					rownumbers: true 																,
    					idField: 'tcd_code'																	,
    					treeField: 'tcd_title'																,
    			        columns:[[
    			            {field:'tcd_title',title:'코드명칭',width:200},
    			            {field:'tcd_code',title:'Code',width:100},
    			            {field:'tcd_useyn',title:'사용여부',width:100}
    			        ]]					
    				}
    		);	    		
			
    		commonFnc.setDataCombo("#ta_group_code_s", "A005", "0", "", "관리자권한", function(value){});

    		var carProductListGrid = {
    				
    				dataload : function (paramTree)
    				{
    					$('#dgtree${_prefix}').datagrid({
    						url : "/admin/interface/selectGetManager"								,
    						queryParams :paramTree 		,
    						rownumbers: true 			,
							pagination : false	 			,
    	    			    singleSelect :  true	 		,
    	    			    pageSize : 50					,
    	    			    fitColumns : false				,
    	    			    remoteSort:false				,
    	    			    multiSort:true					,
    						toolbar : '#tb_sub${_prefix}',
    						onDblClickRow: function(index, rows) {
    							
    							console.log(rows)
    							if ( rows.tp_index != "" )
    							{
        							$('#ww${_prefix}').window('center').window('open');
        							$('#ww${_prefix}').window('refresh', '/admin/manager/managerForm?ta_user_id='+rows.ta_user_id);    							 
    								
    							}
    							
    						}
    						,
    						onLoadSuccess: function(row){
    							//$(this).treegrid('enableDnd', row?row.id:null);
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
				param.page = 1;
				param.rows = 50;
				carProductListGrid.dataload(param);	

				$("#searchBtn${_prefix}").on("click", function(){
						var paramForm = $("#ff${_prefix}").serializeObject();
						paramForm.page = 1;
						paramForm.rows = 10;

						carProductListGrid.dataload(paramForm);	
				});

				$("#initBtn${_prefix}").on("click", function(){
					var param = {};
					param.page = 1;
					param.rows = 50;
					carProductListGrid.dataload(param);	
				});

				

				$("#btn_add_child${_prefix}").on("click", function(){
					
					
					$('#ww${_prefix}').window('center').window('open');
					$('#ww${_prefix}').window('refresh', '/admin/manager/managerForm');

				});
    		});
    		
    		
    		function closeWindow(){
    			$('#ww${_prefix}').window("close");
    		}
    </script>

	



</body>
</html>