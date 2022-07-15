<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> <!-- 1번  --> 
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body>
	<!-- 2번  START --> 
	<div class="easyui-panel" id="p${_prefix}" title="파일관리 > 파일 업로드" style="height:123px;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
    </div>
     <div class="easyui-panel" style="height:auto;padding:5px;border:0;"  >    
	     <table id="dg_file${_prefix}" title="업로드 설정정보" class="easyui-upload" style="width:100%;height:auto">
	    </table>
    </div>  
    
	<div id="tb_file${_prefix}" style="height:auto"> 
		<form id="fileForm${_prefix}" method="post" action="/fileCommonUploadForm?${_csrf.parameterName}=${_csrf.token}">
			<input type="hidden" name="groupCode" id="groupCode" value="">
			<div id="container">
				<button type="button" id="pickfiles${_prefix}">SELECT FILES</button>
			    <button type="button" id="uploadfiles${_prefix}">UPLOAD FILES</button>
			    <button type="button" id="getfileIdx${_prefix}">FILE IDX</button>
			    <button type="button" id="getGroupCode${_prefix}">GROUP CODE</button>
			</div>
			<br />
		</form>
		<textarea name="test_ed" id="test_ed" style="width:750px;height:300px"></textarea>
		
		<br />
		<br />
		<br />
		<br />
		<h3>※메일발송테스트※</h3>
		<br />
		<br />
		<span> 받는분</span><input type="text" id="mailId" class="easyui-textbox" >
		<br />
		<button id="sendMail">메일발송</button>
	</div>
	<!-- 2번  END --> 
	<br>
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
	
	
	<script type="text/javascript">
		var editorTest = [];
		
		$(document).ready(function(){
			$meplzNaverEditor.init({ 
				container 		: "test_ed"
				, 	useToolBar	 	: true
				, 	editorMode	 	: true
				, 	modeChange		: true
				,	saver			: editorTest
				, 	onLoadSuccecs   : function(){
						//console.log("에디터 로드 됨.");
						//editorTest.getById["test_ed"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
						//editorTest.getById["test_ed"].exec("UPDATE_CONTENTS_FIELD", []);
						//데이터 submit시 test_ed에 에디터 내용을 담는함수
				}
			});
			
			
			 $("#sendMail").off("click").on("click", function(){
				
				if($('#mailId').val() == "") {
					alert("받는분 메일주소를 입력해주세요.");
					return false;
				}
				
				if(confirm($('#mailId').val()+"로 메일을 발송하시겠습니까?")) {
					var param = {};
					param.mail = $('#mailId').val();
					
					$.ajax({
		        		type: "POST",
		        		url: "/mailSender",
		        		dataType:"json",
		        		data : param,
		        		success: function(data){
		        			console.log(data)
		        			if(data.result == "Y") {
		        				alert('발송성공!메일을 확인해주세요.');
		        			} else {
		        				alert('실패');
		        			}
		        		},
		        		error: function(xhr, status, error){
		        			alert(error);
		        		}
		        	});
				}
			 });
		});
	</script> 


	
</body>
</html>


