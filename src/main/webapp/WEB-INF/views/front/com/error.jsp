<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>	
	<title>HOME : 강남 그랜드안과</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<link rel="shortcut icon" href="/common/img/16.ico">
</head>
<body>
	<script type="text/javascript">
		<c:if test="${vo.errMsg ne null}">
			alert("${vo.errMsg}");
		</c:if>

		<c:if test="${fn:length(vo.errUrl) > 0}" >
			location.href="/${vo.errUrl}";
		</c:if>

		
		<c:if test="${vo.errClose ne null}">
			window.close();
		</c:if>
		
		<c:if test="${vo.errBack ne null}">
			history.back(-1);
		</c:if>		
		
		
		<c:if test="${fn:length(vo.errOpenUrl) > 0}" >
			opener.location.href="/${vo.errOpenUrl}";
			window.close();
		</c:if>		
	</script>
</body>
</html>