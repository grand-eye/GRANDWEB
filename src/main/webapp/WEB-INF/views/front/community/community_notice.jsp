<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
	<%@ include file="/WEB-INF/views/front/inc/common_board_js.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub">
			<h2 class="sub_title">공지사항</h2>
			<div class="wsize">
				<div class="search_box flex_between">
					<div class="search">
						<input type="search" placeholder="검색어를 입력하세요.">
					</div>
					<button type="button" class="btn_search">검색</button>
				</div>

				<div class="table_notice_wrap">
					<table class="table_notice">
						<thead>
							<tr>
								<th>구분</th>
								<th class="title">제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>	
				</div>

				<ul class="paging flex pb200">
					<li><span> < </span></li>
					<li class="active">1</li>
					
					<li><span> > </span></li>
				</ul>
			</div> 
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript" src="/common/js/jquery.tmpl.plus.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			load_notice_list();
		});
	
		function load_notice_list(page){
			
			$boardList.set({
				box 				: ".table_notice"
				,url           	 	: "/community/interface/communityList/BD01"
		      	,templeat      	    : "#notice_list"
		      	,page				: page
				,onCompleate        : function(data){
					
		        }
			});
		};
		
	</script>
</body>
</html>