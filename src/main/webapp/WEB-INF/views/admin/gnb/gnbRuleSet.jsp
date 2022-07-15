<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body class="" id="">
	<div class="easyui-panel" title="관리자 정보관리 > 관리자 권한 관리" style="height:60px;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
			<select name="select${_prefix}" id="select${_prefix}" style="width:30%;"></select>
	</div>
	
	<div class="easyui-panel" style="height:auto;padding:5px;border:0;" >

		<table title="메뉴별 관리자 권한관리" id="dtree${_prefix}" class="" style="width:100%;height:auto"></table>
		
		<div id="tbGrTree${_prefix}" style="height:auto;display:none">
			<a href="javascript:void(0)" class="easyui-linkbutton" id="btnGnbRuleAdd" data-options="iconCls:'icon-add',plain:true">권한 변경</a>
		</div>			
	</div>



	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
	
	<style>
	    .datagrid-body td{
	        vertical-align: bottom;
	    }
	</style>	
	<script type="text/javascript">
	
		var editingId = undefined;	//그리드 에디트를 위한 전역변수
		var setGroupCode = "";
		$(document).ready(function(){
			commonFnc.setDataCombo("#select${_prefix}", "A005", "0", "", "관리자 그룹 선택", function(value){
				if( value != "" )
				{
					//getMenuTreeLoaded( value );
					
					setGroupCode = value;

					
					var treePrm = {};
					treePrm.s_level 		= "0";
					treePrm.s_category 	= "GNB02";	
					treePrm.s_useyn		= "Y";
					treePrm.s_group		= value;
				
					
					gnbRuleTtee.dataload(treePrm);
					
				}
			});		
		});
		
		
		var gnbRuleTtee = {
				
				
				dataload : function(param){
					
					
					$("#dtree${_prefix}").treegrid(
							{
								url : "/admin/interface/selectGnb"											,
						        width:'100%'																		,
						        panelWidth:400																		,					
								queryParams :param	 															,
						        labelPosition:'top'																	,						
								rownumbers: true 																,
								idField		: 'id'																		,
								treeField	: 'text'																	,
								toolbar : '#tbGrTree${_prefix}'												,
								onLoadSuccess : function(){
									var data = $("#dtree${_prefix}").treegrid("getData");
									
									$("#btnGnbRuleAdd").off("click");
									$("#btnGnbRuleAdd").on("click", function(){

							             $('#dtree${_prefix}').treegrid('endEdit', editingId);
							             editingId = undefined;
							             
							             var changeRows = $('#dtree${_prefix}').treegrid('getChanges'); //최종 변경사항여부를 체크한다.
										 console.log(changeRows);
							             
							             var newParamArray = new Array();
							             $.each(changeRows, function(x,y){
							            	 console.log(y);
							            	 y.gnb_group_code = setGroupCode;
							            	 newParamArray.push(y);
							             });
							             console.log(newParamArray);
							             

									
											
											$.ajax({  
								                url      			 : "/admin/interface/insertGnbRule"
								               ,data 				 : JSON.stringify( newParamArray )
						                       ,headers  : {
						                            'Accept'       : 'application/json'
						                           ,'Content-Type' : 'application/json;charset=utf-8'
						                       }
								               ,type    			 : "POST"
								               ,dataType 		 : "json"
								               ,success  : function(response) {
								            	  	  console.log(response);					
								            	  	$("#dtree${_prefix}").treegrid("reload");
								               }
								            });							             
									
									
									
									
									});
								}
								,
								onDblClickRow : function(row) {
									
									console.log(row);
									
									
									 if (editingId != undefined)
									{
							             $('#dtree${_prefix}').treegrid('endEdit', editingId);
							             editingId = undefined;
							             
							            if (row){
							                editingId = row.id
							                $('#dtree${_prefix}').treegrid('beginEdit', editingId);
							            }									             
							 
									}
									else
									{
							            if (row){
							                editingId = row.id
							                $('#dtree${_prefix}').treegrid('beginEdit', editingId);
							            }												
									}
										 
									
								}
								,
						        columns:[[
						        	{field:'text', title:'코드명칭'			, width:"70%"}  ,
						            {
						        		  field:'rule'	, title:'권한승인'		
						        		, width:"30%"
						        		, align:"center"
						        		, editor:{
						        				type:'checkbox',
						        				options:{
						        					on: 'Y'	,
							        				off: 'N'
							        			}
						        		}
						        		
						            
						            }  ,
						        ]]					
							}
					);						
					
				}
		}
		
		
	</script>
	
</body>
</html>