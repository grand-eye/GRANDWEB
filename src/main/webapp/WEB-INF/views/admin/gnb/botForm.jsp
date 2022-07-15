<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="messageBody" style="background-color:#fff">
	<form id="frmGnb" method="post">
	
	<input type="hidden" id="tm_share_img" name="tm_share_img" />
	
	<div class="article_box_wrap cf" style="width:100%;text-align:center">
		<div class="article_box article_box_left" style="width:100%">
			<div class="article_box_inner" style="background-color:#fff">
				<table class="table_st01">
					<colgroup>
						<col width="20%"/>
						<col width="*"/>
					</colgroup>
					<tbody>

						<tr>
							<th><label for="" class="table_tit">부모 Code</label></th>
							<td style="text-align:left">
									<input id="cc_gnb_tree" style="border:1px solid #ccc" />
							</td>
						</tr>

						<tr>
							<th><label for="" class="table_tit">Gnb Code</label></th>
							<td style="text-align:left">
        					    <input type="text" id="tm_code" name="tm_code" class="easyui-validatebox tb" style="border:1px solid #ccc" readonly />
							</td>
						</tr>
						<tr>
							<th><label for="" class="table_tit">Gnb 명칭</label></th>
							<td style="text-align:left">
        					    <input type="text" id="tm_name" name="tm_name" class="easyui-validatebox tb" style="border:1px solid #ccc" />							
							</td>
						</tr>
						<tr>
							<th><label for="" class="table_tit">사용여부</label></th>
							<td style="text-align:left">
								<input class="easyui-switchbutton" id="tm_useyn" checked data-options="onText:'사용',offText:'사용안함', width:100" style="">
							</td>
						</tr>

						
						<tr>
							<th><span class="table_tit">연결 URL</span></th>
							<td style="text-align:left">
									<input type="text" id="tm_url" name="tm_url" class="easyui-textbox" style="width:100%;border:1px solid #ccc" />
							</td>
						</tr>
						
						<tr>
							<th><span class="table_tit">_prefix</span></th>
							<td style="text-align:left">
									<input type="text" id="tm_prefix" name="tm_prefix" class="easyui-textbox" style="width:100%;border:1px solid #ccc" />
							</td>
						</tr>	

						<tr>
							<th><span class="table_tit">공유제목</span></th>
							<td style="text-align:left">
									<input  id="tm_share_title" name="tm_share_title" class="easyui-textbox" style="width:100%;border:1px solid #ccc" />
							</td>
						</tr>
						
						<tr>
							<th><span class="table_tit">공유내용</span></th>
							<td style="text-align:left">
									<input  id="tm_share_desc" name="tm_share_desc" class="easyui-textbox" data-options="multiline:true" style="width:100%;border:1px solid #ccc;height:80px" />
							</td>
						</tr>						
						<tr>
							<td colspan="2">
								<div style="width:70%;height:160px;border: 5px dashed #999;line-height:80px;float:left" id="gnb_upload_drop">
									SNS공유시 사용할 이미지를  Drag&Drop하세요.
								</div>
								<div id="imgBox">
						
								</div>
							</td>
						</tr>
				
						<tr>
							<th><label for="" class="table_tit">노출여부</label></th>
							<td style="text-align:left">
								<input class="easyui-switchbutton" id="tm_ssl"  data-options="onText:'사용',offText:'사용안함', width:100" style="">
							</td>
						</tr>

						<tr>
							<th><label for="" class="table_tit">Footer사용여부</label></th>
							<td style="text-align:left">
								<input class="easyui-switchbutton" id="tm_login"  data-options="onText:'사용',offText:'사용안함', width:100" style="">
							</td>
						</tr>




						<tr>
							<th><label for="" class="table_tit">노출순서</label></th>
							<td>
								<div class="input_st01">
									<input class="easyui-numberbox"  id="tm_order" name="tm_order"
									 	data-options="prompt:'※ 노출순서가 같은 경우 등록된 최순순이 우선으로 노출됩니다.'"
										 style="width:100%;border:1px solid #ccc"  />

								</div>
							</td>
						</tr>
					</tbody>
				</table> <!-- //article_box_wrap -->
				<div class="bd_btn_wrap">
					<ul>
				       <li><button type="button" id="btnCodeSet">확인</button></li>
					</ul>
				</div> <!-- //bd_btn_wrap -->
			</div> <!-- //article_box_inner -->
		</div> <!-- //article_box_left -->
	</div>
	</form>
	
	
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp" %>
	<script type="text/javascript">
		var cateCode 	= "gnb";	// 각자 맞는 카데고리 설정 코드 (예) notice)
   		var fileExt  		= '<spring:message code="gnb"  ></spring:message>'.split("@")[0];		// 해당 카데고리의 파일 확장자
   		var fileSize 		= '<spring:message code="gnb"  ></spring:message>'.split("@")[1] +'mb';	// 해당 카데고리의 파일 사이즈

   		
   		$meplzUploader.init({
					parameter : {
				        "groupCode" : ''					,
				        "cateCode" 	: cateCode							
					} 
					, dropBool : true
					, multiSelect : false
					, dropBox  : "gnb_upload_drop"
					, uploadStartButton : "gnb_upload_drop"
					, fileSize : fileSize
					, extensionMessage : "Image Files"
					, extension : fileExt
					, onLoadSucces : function(){
						console.log("abbdddeefe");
					}
					, onFileAdd : function(up, files){
						
					}
					, onUpdProgress : function(up, files){
						
					}
					, onError : function( up, err ){
						$("#imgBox").html("");
						$("#imgBox").html( "<span style='color:red'>" + err.message + "</span>");
						$("#tm_share_img").val('');				
					}
					, onComplete : function( svrResponse , fileInfo,  response ){
						console.log(svrResponse);
						if(svrResponse.flag == "N") 
						{
							alert("서버오류로 인해 파일 업로드가 실패하였습니다.");
							$("#tm_share_img").val('');
							$("#imgBox").html("");
						}
						else
						{
							
							var html = "";
							
							$("#imgBox").html("");
							$("#tm_share_img").val( svrResponse.file_path + "/" + svrResponse.file_name );
							
							html +=' <img src="'+_web_path+svrResponse.file_path+'/'+svrResponse.file_name+'" class="bigImgStart" style="width:100px;height:100px" /> ';
							html +=' <br /> ';
							html +=' <a href="#" class="imgDeleteBtnSet" style="width:100px;margin-top:5px"><div style="width: 50px;height:20px;background-color: red;float: left;color: white;font-weight: bold;line-height: 21px;margin-left: 61px;">X</div></a>	 ';

							$("#imgBox").html(html);
							
							$(".imgDeleteBtnSet").off("click");
							$(".imgDeleteBtnSet").on("click", function(){
								$("#tm_share_img").val('');
								$("#imgBox").html("");									
							});
							
						}				
					}
			}   				
		);   		
   		
   		
   	</script>
		
	
	
	<script type="text/javascript">
	
		$('#tm_code').validatebox({
		    required: false 
		});
		
		
		$('#tm_name').validatebox({
		    required: true	,
		    missingMessage : 'Bot답변을 입력하세요.'  ,
		    validType : [ 'empty["메세지코드는 필수 입력값입니다."]' , 'ajax_check_bot["/admin/interface/selectExistsBotName","${_gnb.s_category}","BOT답변은 중복될 수 없습니다."]']
		});					
	
	
		var treePrm = {};
		treePrm.s_level 		= "0";
		treePrm.s_category 	= "${_gnb.s_category}";	
		treePrm.s_useyn		= "Y";
		
		$("#cc_gnb_tree").combotreegrid(
				{
					url : "/admin/interface/selectBot"											,
			        width:'100%'																		,
			        panelWidth:400																		,					
					queryParams :treePrm	 														,
			        labelPosition:'top'																	,						
					rownumbers: true 																,
					idField		: 'id'																		,
					treeField	: 'text'																	,
					onLoadSuccess : function(){
					
						
						<c:choose>
						    <c:when test="${fn:length(_gnb.s_code) > 0}">
								var param = {};
								param.s_code			  = "${_gnb.s_code}";
								param.s_category		  = "${_gnb.s_category}";	
								param.s_root = "N";
								param.s_level = "";
								
								$.ajax({  
					                url      			 : "/admin/interface/selectBot"
					               ,data 				 : param
					               ,type    			 : "POST"
					               ,dataType 		 : "json"
					               ,success  : function(data) {
					            	  
					            	   var y = data.rows[0];
					            	   $('#cc_gnb_tree').combotreegrid('setValue', y.tm_parent);
					            	   $("#tm_code").val( y.tm_code );
					            	   $("#tm_name").val( y.tm_name );
					            	   
										if ( y.tm_useyn == "Y")
										{
											$("#tm_useyn").switchbutton("check");
										}
										else
										{
											$("#tm_useyn").switchbutton("uncheck");
										}	            	   
					            	    
										 $("#tm_url").textbox('setValue', y.tm_url);
										 $("#tm_prefix").textbox('setValue', y.tm_prefix);
										 $("#tm_share_title").textbox('setValue', y.tm_share_title);
										 $("#tm_share_desc").textbox('setValue', y.tm_share_desc);
										
										 
											var html = "";
											
											$("#imgBox").html("");
											
											if (y.tm_share_img != "")
											{
												$("#tm_share_img").val( y.tm_share_img );
												html +=' <img src="'+_web_path+y.tm_share_img+'" class="bigImgStart" style="width:100px;height:100px" /> ';
												html +=' <br /> ';
												html +=' <a href="#" class="imgDeleteBtnSet" style="width:100px;margin-top:5px"><div style="width: 50px;height:20px;background-color: red;float: left;color: white;font-weight: bold;line-height: 21px;margin-left: 61px;">X</div></a>	 ';
		
												$("#imgBox").html(html);
		
												$(".imgDeleteBtnSet").off("click");
												$(".imgDeleteBtnSet").on("click", function(){
													$("#tm_share_img").val('');
													$("#imgBox").html("");									
												});						 
											}

											if ( y.tm_ssl == "Y")
											{
												$("#tm_ssl").switchbutton("check");
											}
											else
											{
												$("#tm_ssl").switchbutton("uncheck");
											}	      
											
											if ( y.tm_login == "Y")
											{
												$("#tm_login").switchbutton("check");
											}
											else
											{
												$("#tm_login").switchbutton("uncheck");
											}	      	
											
							            	  
							            	  if ( y.tm_order != "99")
								              {
							            		  $("#tm_order").textbox('setValue', y.tm_order );
								              }		 
					               }
					            });						    
						    
						    
						    
						    
						    
						    </c:when>
						    <c:otherwise>
						    	
						    		var sParent = '${_gnb.s_parent}';
						    		
						    		if ( sParent == "")
						    		{
						    			sParent = "root";
						    		}
						    
						    
						    		$('#cc_gnb_tree').combotreegrid('setValue', sParent);  
						    		$("#tm_code").val("${_new}");
						    		$("#tm_code").prop("readonly", true);
						    </c:otherwise>
						</c:choose>						
					}
					,
			        columns:[[
			        	{field:'text', title:'코드명칭'	, width:300}
			            ,
			            {field:'id'	, title:'Code'		, width:100}
			        ]]					
				}
		);	
		
		
		
		$("#btnCodeSet").on("click", function(){
			//
				if ( $("#frmGnb").form("validate") )
				{
					var paramForm = $("#frmGnb").serializeObject();
					
					
					var checked = $("#tm_useyn").switchbutton('options').checked;
					
					if ( checked ) {
						paramForm.tm_useyn = "Y";
					} else {
						paramForm.tm_useyn = "N";
					}
					
					var checked = $("#tm_ssl").switchbutton('options').checked;
					if ( checked ) {
						paramForm.tm_ssl = "Y";
					} else {
						paramForm.tm_ssl = "N";
					}
					
					var checked = $("#tm_login").switchbutton('options').checked;
					if ( checked ) {
						paramForm.tm_login = "Y";
					} else {
						paramForm.tm_login = "N";
					}
					
					paramForm.tm_category = "${_gnb.s_category}";
					
					
					var g = $('#cc_gnb_tree').combotreegrid('grid');	// get treegrid object
					var r = g.treegrid('getSelected');	// get the selected row				
					
					if ( r.id == "root" )
					{
						paramForm.tm_level 			  = "0";
						paramForm.tm_parent 			  = "root";	
					}
					else
					{
						paramForm.tm_level 			  = parseInt(r.tm_level) + 1;
						paramForm.tm_parent 			  = r.tm_code;
					}					
					
					
					if ( paramForm.tm_order == "" )
					{
						paramForm.tm_order = "99";
					}
					
					$.ajax({  
			               url      			 : "/admin/interface/insertGnb"
			              ,data 				 : paramForm
			              ,type    			 : "POST"
			              ,dataType 		 : "json"
			              ,success  : function(data) {
			            	  //$("#gnb_menu_tree").tree("reload");
			            	  alert("BOT 컨텐츠가 등록/수정되었습니다.");
			            	  parent.getMenuTreeLoaded(  "${_gnb.s_category}" );
			              }
			           });							
				}
		});
		
	
	
		



	
	</script>
</body>
</html>