<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칼럼</title>
<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
<%@ include file="/WEB-INF/views/front/inc/common_board_js.jsp" %>
<%@ include file="/WEB-INF/views/front/inc/common_js.jsp" %>
<link rel="stylesheet" type="text/css" href="/common/css/notice/board.css"/>
<link rel="stylesheet" type="text/css" href="/common/css/notice/board_m.css"/>
<link rel="stylesheet" type="text/css" href="/common/css/notice/template.css"/>

</head>
<body class="pc sub view column_area">
<!-- wrap -->
<div id="wrap">
	<!-- main -->
	<main id="main">
		<div id="board_contents" class="csize01">
			<div id="boardSkin">
				<div class="board_view_wrap">
					<div class="board_view">
						<div class="board_view_contents">
							<div class="customCentent" style="padding-bottom:0px">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</div>
		
		<script src="/common/js/jquery.inview.min.js"></script>
<script>

$(function(){
	
	var columnContentXhtml = window.opener.columnContentXhtml;
	$(".customCentent").replaceWith(columnContentXhtml);
	
	setTimeout(function() {
		$( "iframe" ).each(function( index ) {
			var $p = $(this).parents('p, div');
			if($p){
				if ( $p.hasClass("template"))
				{
					
				}
				else
				{
					$p.addClass('view_movie');	
				}
			}
		});
	}, 500);
});

</script>
<!-- //wrap -->
</body>
</html>


