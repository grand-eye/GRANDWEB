<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body>
	<img class="img" src = "${WebPath}${filePath}" alt="이미지">
	
	<script>
	$(document).ready(function () {

		alert("webpath = >> " + ${WebPath} + " // filePath = >> " + ${filePath});
		
		var imgWidth = "";
		var imgHeight = "";
		$(".img").load(function(){ //이미지를 다 불러온후 확인하기 위해
       		imgWidth = this.naturalWidth;
       		imgHeight = this.naturalHeight;
       		
       		 document.body.style.overflow='hidden';  
			 if (navigator.userAgent.indexOf('Chrome')>-1) {  
			    window.resizeTo(imgWidth, imgHeight);   
			 }
 
         });
	});
	</script>
	
</body>
</html>