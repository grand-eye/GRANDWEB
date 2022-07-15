<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>	
</head>
<body id="baordBody">
	
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%>

	<script type="text/javascript">
    			
	
    		/** 실제 로직화 구현**/    		
    		$(document).ready(function(){
    			alert("${column_path}");
    		});
    </script>
    <div id="w${_prefix}" class="easyui-window" title="칼럼페이지 상세" data-options="modal:true ,closed:true" style="width:800px;height:600px;padding:10px;">
    </div>
    
</body>
</html>
