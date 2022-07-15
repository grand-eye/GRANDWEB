<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>

<body>
	<div class="easyui-panel" id="p${_prefix}" title="파일관리 > 다중 파일 업로드" style="height:123px;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
        
    </div>
     <div class="easyui-panel" style="height:auto;padding:5px;border:0;"  >    
	     <table id="dg_file${_prefix}" title="업로드 설정정보" class="easyui-upload" style="width:100%;height:auto">
	    </table>
    </div>  
    
	<div id="tb_file${_prefix}" style="height:auto">
		<form id="fileForm${_prefix}" method="post" action="/fileCommonUploadForm?${_csrf.parameterName}=${_csrf.token}">
			<input type="hidden" name="groupCode" id="groupCode" value="">
			  <div id="drop-target">Drop your files or folders (Chrome >= 21) here</div>
    			<div id="debug">No runtime found, your browser doesn't support HTML5 drag &amp; drop upload.</div>
			<br />
			<div id="container">
			    <!-- <button type="button" id="pickfiles">SELECT FILES</button>
			    <button type="button" id="uploadfiles">UPLOAD FILES</button> -->
			    <button type="button" id="getfileIdx">FILE IDX</button>
			    <button type="button" id="getGroupCode">GROUP CODE</button>
			</div>
			 
			<br />
			<pre id="console"></pre>
		</form>
	</div>
	<br>
	<div>
		<span>
			※업로드 적용 방법※<br>
			<br>1. script에 각자 페이지에 맡는 cateCode 적용 (cateCode, fileExt, fileSize)
			<br>2. "admin_upload_js.jsp" include 하기(cateCode 적용한 script 밑에 적용!)
			<br>3.div(tb_file) 영역에 필요한 부분만 복사 후 각자 페이지에 붙여넣기 
			<br>4.본인 페이지에 맞게 파일업로드 함수(filefn) 적용
			<br>(filefn.UploadStart(파일업로드시작),filefn.UploadComplete(업로드성공), filefn.UploadCompleteError(업로드에러))
		</span>
	</div>
	<style>
      body {
        font-family: Verdana, Geneva, sans-serif;
        font-size: 13px;
        color: #333;
       /*  background: url(/admin/img/bg.jpg); */
        width: 90%;
        margin: 40px auto;
      }
      #drop-target {
        border: 10px dashed #999;
        text-align: center;
        color: #999;
        font-size: 20px;
        width: 85%;
        height: 300px;
        line-height: 300px;
        cursor: pointer;
      }
      
      #drop-target.dragover {
        background: rgba(255, 255, 255, 0.4);
        border-color: green;
      }
      
      #debug {
        margin-top: 20px;
      }
    </style> 
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
	<%@ include file="/WEB-INF/views/admin/inc/admin_upload_js.jsp" %>
	
	<script type="text/javascript">
		var cateCode 	= "test";	// 각자 맞는 카데고리 설정 코드 (예) notice)
   		var fileExt  		= '<spring:message code="test"  ></spring:message>'.split("@")[0];		// 해당 카데고리의 파일 확장자
   		var fileSize 		= '<spring:message code="test"  ></spring:message>'.split("@")[1] +'mb';	// 해당 카데고리의 파일 사이즈
   		
  		
   		$meplzUploader.init({
					parameter : {
				        "groupCode" : ''					,
				        "cateCode" 	: cateCode							
					} 
					, dropBool : true
					, multiSelect : false
					, dropBox  : "drop-target"
					, uploadStartButton : "drop-target"
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
						
					}
					, onComplete : function( svrResponse , fileInfo,  response ){
						console.log(svrResponse);
					}
				}   				
   		);
   		

   		
   		$("#getfileIdx").on("click", function(){
   			
   			console.log ( $meplzUploader.enabled );
   			
   			console.log ( $meplzUploader.getFileIdx() );
   			console.log ( $meplzUploader.getFileArray() );
   		});
   		
   		$("#getGroupCode").on("click", function(){
   			console.log ( $meplzUploader.getFileGroupCode() );
   		});   		
   		
   		   		
    </script>
    
</body>
</html>


