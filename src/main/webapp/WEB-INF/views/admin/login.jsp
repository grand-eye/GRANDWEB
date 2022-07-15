<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 관리자 헤더 -->
    <meta charset="UTF-8">
    <title>:::강남그랜드안과 관리자페이지:::</title>
	
	<meta name="_csrf" content= "${_csrf.token}" />
	<meta name="_csrf_header" content= "${_csrf.headerName}" />
	<meta name="_web_path" content= "${WebPath}" />
	<link rel="stylesheet" type="text/css" href="/resources/admin/admin.css" />
	<link rel="stylesheet" type="text/css" href="/resources/admin/login.css" />
	<link rel="stylesheet" type="text/css" href="/common/css/font.css" />
	
	<script type="text/javascript" src="/resources/admin/js/jquery.min.js"></script>
		<script type="text/javascript">
		
		var _web_path = "${WebPath}";

		$(document).ready(function(){
	
		});
		
		var $header = $("meta[name='_csrf_header']").attr("content");
		var $token  = $("meta[name='_csrf']").attr("content");
	
		$.ajaxSetup({
			  beforeSend: function(jqXHR,settings) {
				  jqXHR.setRequestHeader( $header, $token);
			    return true;
			  }
			  ,
			  error: function(xhr , status, error ) {
					console.log(xhr);
					console.log(status);
					console.log(error);
					
					if(xhr.status=="404")
					{
						alert('요청한 서버정보가 존재하지 않습니다.<br />시스템 관리자에게 문의하세요');
						return;
					}
					
					if(xhr.status=="403")
					{
						alert('보안에러 입니다.<br />다시 로그인 후 이용해주세요.');
						return;
					}
					
					if(xhr.status=="500")
					{
						alert('서버 에러가 발생하였습니다.<br />시스템 관리자에게 문의하세요');
						return;
					}				
			  }		  
		});	
			
	</script>	
</head>
<body onkeydown="javascript:onEnterLogin();">

	<form>
		<div id="al_wrap">
			<div class="al_center">
				<h1><img src="/common/img/common/logo.png" width="200"/></h1>
				<div class="al_form">
					<p><img src="/resources/admin/images/login/login_title.jpg" /></p>
					<ul>
						<li class="al_input_area1">
							<p class="first"><img src="/resources/admin/images/login/login_id.jpg" /></p>
							<p><img src="/resources/admin/images/login/login_pw.jpg" /></p>
						</li>
						<li class="al_input_area2">
							<p class="first"><input type="text" id="admin_id" class="al_input" name="admin_id" style="width:158px;"></p>
							<p><input type="password" id="admin_pwd" name="admin_pwd" class="al_input" style="width:158px;"></p>
						</li>
						<li>
							<button type="button" id="btnLogin"><img src="/resources/admin/images/login/login_btn.jpg"></button>
						</li>
					</ul>
				</div>
				
			</div>
		</div>
	</form>
    <script type="text/javascript">
    	$(document).ready(function(){
    		
    		$("#btnLogin").on("click", function(){
    			  login();
    		});
    		    		
    	});
    	
    	function onEnterLogin(){
			var keyCode = window.event.keyCode;
			if (keyCode == 13) { //엔테키 이면
				login();
			}
		}

    	
    	function login() {
    		var id_val = $("#admin_id").val();
			var pw_val = $("#admin_pwd").val();
			
			if ( id_val == "")
			{
				alert("관리자 아이디를 입력하세요.");
				$("#admin_id").focus();
				return;
			}
			
			
			if ( pw_val == "")
			{
				alert("관리자 비밀번호를 입력하세요.");
				$("#admin_pwd").focus();
				return;
			}
			var param ={};
			
			param.i_user_id = id_val;
			param.i_password = pw_val;
			
			$.ajax({  
				url      	: "/adm/interface/selectManagerLogin"
			   ,data 		: param
			   ,type    	: "POST"
			   ,dataType 	: "json"
			   ,success  	: function(data) {
					
					if ( data.resultCode == "Y")
					{
						alert("강남그랜드안과 웹관리자에 접속하였습니다.");
						location.href='/admin/manager/';
						return;							
					}
					else
					{
						alert(data.resultMessage);
						return;
					}
			   }
			});  
    	}
    
    
    </script>
    
</body>
</html>