<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<style>
      body {
        font-family: Verdana, Geneva, sans-serif;
        font-size: 20px;
        color: #333;
        width: 100%;
      }
      #drop-target {
        border: 10px dashed #999;
        text-align: center;
        color: #999;
        height: 400px;
        line-height: 300px;
        cursor: pointer;
      }      
      #drop-target.dragover {
        background: rgba(255, 255, 255, 0.4);
        border-color: green;
      }
</style> 
<body>
	<div class="easyui-panel" id="p${_prefix}" title="Editor 이미지 업로드" style="height:5%;border:0;margin-bottom:20px;"data-options="iconCls:'icon-redo'"> 
    </div>
    
    <div class="easyui-panel" style="height:auto;padding_top:5px;border:0;"  >    
	     <table id="dg_file${_prefix}" title="업로드 설정정보" class="easyui-upload" style="width:100%;height:auto">
	    </table>
    </div>  
    
	<div id="tb_file${_prefix}" style="width:98%;height:auto;margin-left:8px;">
		<form id="fileForm${_prefix}" method="post" action="/fileCommonUploadForm?${_csrf.parameterName}=${_csrf.token}">
			<input type="hidden" name="groupCode" id="groupCode" value="">
			<div id="drop-target">Editor에 사용할 이미지를 Drag & Drop 하세요.</div>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp" %>
	
	<script type="text/javascript">
		var cateCode 	= "editor";	// 각자 맞는 카데고리 설정 코드 (예) notice)
   		var fileExt  		= '<spring:message code="editor"  ></spring:message>'.split("@")[0];		// 해당 카데고리의 파일 확장자
   		var fileSize 		= '<spring:message code="editor"  ></spring:message>'.split("@")[1] +'mb';	// 해당 카데고리의 파일 사이즈
   		
  		
   		$meplzUploader.init({
					parameter : {
				        "groupCode" : '',
				        "cateCode" 	: cateCode							
					} 
					, dropBool : true
					, multiSelect : false
					, dropBox  				: "drop-target"
					, uploadStartButton 	: "drop-target"
					, fileSize : fileSize
					, extensionMessage : "Image Files"
					, extension : fileExt
					, onLoadSucces : function(){
						
					}
					, onFileAdd : function(up, files){
						
					}
					, onUpdProgress : function(up, files){
						
					}
					, onError : function( up, err ){
						
					}
					, onComplete : function( svrResponse , fileInfo,  response ){
						console.log(svrResponse);
						
						if(svrResponse.flag == "N") 
						{
							alert("서버오류로 인해 파일 업로드가 실패하였습니다.");
							return;
						}
						else
						{
							window.opener.$meplzEditorCommon.uploadSuccecs(svrResponse); 
							window.close();
						}						
					}
				}   				
   		);
   		
    </script>
    
</body>
</html>




