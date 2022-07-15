<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="messageBody" style="background-color:#fff">

	<form id="frmTcd" method="post">
	<div class="article_box_wrap cf" style="width:768px;text-align:center">
		<div class="article_box article_box_left" style="width:768px">
			<div class="article_box_inner" style="background-color:#fff">
				<table class="table_st01">
					<colgroup>
						<col width="30%"/>
						<col width="*"/>
					</colgroup>
					<tbody>

						<tr>
							<th><label for="" class="table_tit">부모 Code</label></th>
							<td style="text-align:left">
									<input class="easyui-combotfreegrid" id="cc_code_tree" style="border:1px solid #ccc" />
							</td>
						</tr>

						<tr>
							<th><label for="" class="table_tit">Code</label></th>
							<td style="text-align:left">
        					    <input type="text" id="tcd_code" name="tcd_code" class="easyui-validatebox tb" style="border:1px solid #ccc" />
							</td>
						</tr>
						<tr>
							<th><label for="" class="table_tit">명칭</label></th>
							<td style="text-align:left">
        					    <input type="text" id="tcd_title" name="tcd_title" class="easyui-validatebox tb" style="border:1px solid #ccc" />							
							</td>
						</tr>
						<tr>
							<th><label for="" class="table_tit">사용여부</label></th>
							<td style="text-align:left">
								<input class="easyui-switchbutton" id="tcd_useyn" checked data-options="onText:'사용',offText:'사용안함', width:100" style="">
							</td>
						</tr>
						
						
						
						<tr>
							<th><span class="table_tit">속성1</span></th>
							<td style="text-align:left;">
									<input type="text" id="tcd_attr1" name="tcd_attr1" class="easyui-textbox" style="width:98%;border:1px solid #ccc" />
							</td>
						</tr>
						
						<tr>
							<th><span class="table_tit">속성2</span></th>
							<td style="text-align:left">
									<input  id="tcd_attr2" name="tcd_attr2" class="easyui-textbox" style="width:98%;border:1px solid #ccc" />
							</td>
						</tr>
						
						<tr>
							<th><span class="table_tit">속성3</span></th>
							<td style="text-align:left">
									<input  id="tcd_attr3" name="tcd_attr3" class="easyui-textbox" style="width:98%;border:1px solid #ccc" />
							</td>
						</tr>


						<tr>
							<th><span class="table_tit">속성4</span></th>
							<td style="text-align:left">
									<input  id="tcd_attr4" name="tcd_attr4" class="easyui-textbox" style="width:98%;border:1px solid #ccc" />
							</td>
						</tr>
						
						<tr>
							<th><span class="table_tit">속성5</span></th>
							<td style="text-align:left">
									<input  id="tcd_attr5" name="tcd_attr5" class="easyui-textbox" style="width:98%;border:1px solid #ccc" />
							</td>
						</tr>
						
						<tr>
							<th><span class="table_tit">속성6</span></th>
							<td style="text-align:left">
									<input  id="tcd_attr6" name="tcd_attr6" class="easyui-textbox" style="width:98%;border:1px solid #ccc" />
							</td>
						</tr>						
												



						<tr>
							<th><label for="" class="table_tit">노출순서</label></th>
							<td>
								<div class="input_st01">
									<input class="easyui-numberbox"  id="tcd_order" name="tcd_order"
									 	data-options="prompt:'※ 노출순서가 같은 경우 등록된 최순순이 우선으로 노출됩니다.'"
										 style="width:599px;border:1px solid #ccc"  />

								</div>
							</td>
						</tr>
					</tbody>
				</table> <!-- //article_box_wrap -->
				<div class="bd_btn_wrap">
					<ul>
												
							<c:choose>
							    <c:when test="${fn:length(_codeDetail.search_code) > 0}">
							        <li><button type="button" id="btnCodeModify">수정</button></li>
							    </c:when>
							    <c:otherwise>
							       <li><button type="button" id="btnCodeSet">등록</button></li>
							    </c:otherwise>
							</c:choose>

					</ul>
				</div> <!-- //bd_btn_wrap -->
			</div> <!-- //article_box_inner -->
		</div> <!-- //article_box_left -->
	
	</div>
	</form>
	<script type="text/javascript">
		
		var treePrm = {};
		treePrm.search_level = "0";
		treePrm.search_master = "${_codeDetail.search_master}";	
	
		$("#cc_code_tree").combotreegrid(
				{
					url : "/admin/interface/selectCodeDetail"								,
			        width:'100%'																		,
			        panelWidth:500																		,					
					queryParams :treePrm	 														,
			        labelPosition:'top'																	,						
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
		
		$('#tcd_title').validatebox({
		    required: true	,
		    missingMessage : '코드명칭을 입력하세요.' 
		});				
	
		 <c:choose>
		    <c:when test="${fn:length(_codeDetail.search_code) > 0}">
		    
					$('#tcd_code').validatebox({
					    required	: false	,
					    readonly 	: true  
					});
					
	
					
					var param = {};
					
					param.search_code = "${_codeDetail.search_code}";
					param.search_master = "${_codeDetail.search_master}";	
					
					$.ajax({  
		                url      			 : "/admin/interface/selectCodeDetailNoRoot"
		               ,data 				 : param
		               ,type    			 : "POST"
		               ,dataType 		 : "json"
		               ,success  : function(data) {
		            	  var y = data.rows[0];
		            	  console.log(y);
		            	  
		            	  $("#tcd_code").val(y.tcd_code);
		            	  $("#tcd_title").val(y.tcd_title);
		            	  
		            	  
		            	  $("#tcd_attr1").textbox('setValue', y.tcd_attr1 );
		            	  $("#tcd_attr2").textbox('setValue', y.tcd_attr2 );
		            	  $("#tcd_attr3").textbox('setValue', y.tcd_attr3 );
		            	  
		            	  $("#tcd_attr4").textbox('setValue', y.tcd_attr4 );
		            	  $("#tcd_attr5").textbox('setValue', y.tcd_attr5 );
		            	  $("#tcd_attr6").textbox('setValue', y.tcd_attr6 );		            	  
		            	  
		            	  

		            	  
		            	  
		            	  if ( y.tcd_useyn == "Y")
		            	  {
		            		  $("#tcd_useyn").switchbutton("check");
		            	  }
		            	  else
		            	  {
		            		  $("#tcd_useyn").switchbutton("uncheck");
		            	  }
		            	  
		            	  if ( y.tcd_parent != "0")
		            	 {
		            		  $('#cc_code_tree').combotreegrid('setValue', y.tcd_parent);  
		            	 }
		            	  
		            	  
		            	  if ( y.tcd_order != "99")
			              {
		            		  $("#tcd_order").textbox('setValue', y.tcd_order );
		            		  
			              }		 
		            	  
		            	  
							$("#btnCodeModify").on("click", function(){
								if ( $("#frmTcd").form("validate") )
								{
									var paramForm = $("#frmTcd").serializeObject();
							
									var checked = $("#tcd_useyn").switchbutton('options').checked;
									if ( checked ) {
										paramForm.tcd_useyn = "Y";
									} else {
										paramForm.tcd_useyn = "N";
									}
									
									var g = $('#cc_code_tree').combotreegrid('grid');	// get treegrid object
									var r = g.treegrid('getSelected');	// get the selected row				
									paramForm.tcd_master_code = "${_codeDetail.search_master}";
									if ( r.tcd_code == "" )
									{
										paramForm.tcd_level 			  = "0";
										paramForm.tcd_parent 			  = "0";	
									}
									else
									{
										paramForm.tcd_level 			  = parseInt(r.tcd_level) + 1;
										paramForm.tcd_parent 			  = r.tcd_code;
									}
									
									if ( paramForm.tcd_order == "" )
									{
										paramForm.tcd_order = "99";
									}
									
									console.log(paramForm);
									$.ajax({  
							               url      			 : "/admin/interface/insertCodeDetail"
							              ,data 				 : paramForm
							              ,type    			 : "POST"
							              ,dataType 		 : "json"
							              ,success  : function(data) {
							           	  console.log(data);
							           	  parent.closeWindow();
							              }
							           });				
								}
							});		            	  
		            	  
		            	  
		               }
		            });					

					
					
					//$('#tcd_title').val("TETEETE");
		    
		    </c:when>
		    <c:otherwise>
		    
					$('#tcd_code').validatebox({
					    required: true	,
					    missingMessage : '코드 ID는 필수 입력값입니다.' ,
					    validType : [ 'empty["코드 ID는 필수 입력값입니다."]' , 'ajax_check["/admin/interface/selectExistsCodeDetail","search_code","이미 등록된 코드입니다."]']
					});	

					$("#btnCodeSet").on("click", function(){
						//$("#tcd_useyn").switchbutton("uncheck");
						if ( $("#frmTcd").form("validate") )
						{
							var paramForm = $("#frmTcd").serializeObject();
							
							
							
							var checked = $("#tcd_useyn").switchbutton('options').checked;
							if ( checked ) {
								paramForm.tcd_useyn = "Y";
							} else {
								paramForm.tcd_useyn = "N";
							}
							
							var g = $('#cc_code_tree').combotreegrid('grid');	// get treegrid object
							var r = g.treegrid('getSelected');	// get the selected row				
							
							console.log(r);
							
							paramForm.tcd_master_code = "${_codeDetail.search_master}";
							
							if ( r.tcd_code == "" )
							{
								paramForm.tcd_level 			  = "0";
								paramForm.tcd_parent 			  = "0";	
							}
							else
							{
								paramForm.tcd_level 			  = parseInt(r.tcd_level) + 1;
								paramForm.tcd_parent 			  = r.tcd_code;
							}
							
							if ( paramForm.tcd_order == "" )
							{
								paramForm.tcd_order = "99";
							}
							
							console.log(paramForm);
							$.ajax({  
				                url      			 : "/admin/interface/insertCodeDetail"
				               ,data 				 : paramForm
				               ,type    			 : "POST"
				               ,dataType 		 : "json"
				               ,success  : function(data) {
				            	  console.log(data);
				            	  parent.closeWindow();
				               }
				            });				
							
							
						}
						
						/**
						var g = $('#cc_code_tree').combotreegrid('grid');	// get treegrid object
						var r = g.treegrid('getSelected');	// get the selected row
		
						//alert(1);
						console.log(r);
						**/
						
					});		    
		    
		    
		    
		    </c:otherwise>
		</c:choose>
		


	
	</script>
</body>
</html>