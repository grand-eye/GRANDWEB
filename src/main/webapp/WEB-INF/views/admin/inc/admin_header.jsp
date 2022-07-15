<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!-- 관리자 헤더 -->
<meta charset="UTF-8">
<meta name="_csrf" content= "${_csrf.token}" />
<meta name="_csrf_header" content= "${_csrf.headerName}" />
<meta name="_web_path" content= "${WebPath}" />
<title>강남그랜드안과 관리자</title>

<link rel="stylesheet" type="text/css" href="/resources/admin/themes/material/easyui.css">
<link rel="stylesheet" type="text/css" href="/resources/admin/themes/icon.css">
<link rel="stylesheet" type="text/css" href="/resources/admin/themes/color.css">
<link rel="stylesheet" type="text/css" href="/resources/admin/common.css">
<link rel="stylesheet" type="text/css" href="/resources/admin/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/admin/style.css">
<link rel="stylesheet" type="text/css" href="/resources/admin/admin.css" />
<link rel="stylesheet" type="text/css" href="/resources/admin/admin_board.css" />
<script type="text/javascript" src="/resources/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/admin/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/resources/admin/js/datagrid-export.js"></script>
<script type="text/javascript" src="/resources/admin/js/datagrid-cellediting.js"></script>
<script type="text/javascript" src="//www.jeasyui.com/easyui/jquery.edatagrid.js"></script>
<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/resources/admin/js/plupload.full.min.js"></script>
<%@ include file="/WEB-INF/views/admin/inc/admin_editor_js.jsp" %> 

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
				
				if(xhr.status=="999")
				{
					alert('로그인이 필요한 서비스입니다.\n다시 이용해주세요.');
					location.href='/admin/login';
					return;
				}					
		  }		  
	});	
		
</script>



