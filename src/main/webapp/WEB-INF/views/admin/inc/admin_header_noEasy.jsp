<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!-- 관리자 헤더 -->
<meta charset="UTF-8">
<meta name="_csrf" content= "${_csrf.token}" />
<meta name="_csrf_header" content= "${_csrf.headerName}" />
<meta name="_web_path" content= "${WebPath}" />
<title>KFC-Web Administrator Service</title>


<link rel="stylesheet" href="/resources/admin/meplz/css/reset.css" />
<link rel="stylesheet" href="/resources/admin/meplz/css/jquery-ui.css" />
<link rel="stylesheet" href="/resources/admin/meplz/css/jquery-ui.theme.css" />
<link rel="stylesheet" href="/resources/admin/meplz/css/jquery.timepicker.css" />
<link rel="stylesheet" href="/resources/admin/meplz/css/style.css">


<script type="text/javascript" src="/resources/admin/meplz/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/admin/meplz/js/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/admin/meplz/js/jquery.timepicker.js"></script>
<script type="text/javascript" src="/resources/admin/meplz/js/run.js"></script>
	
	
<script type="text/javascript">
	var $header = $("meta[name='_csrf_header']").attr("content");
	var $token  = $("meta[name='_csrf']").attr("content");

	$.ajaxSetup({
		  beforeSend: function(jqXHR,settings) {
			  jqXHR.setRequestHeader( $header, $token);
		    return true;
		  }
	});
</script>



