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
			<h2 class="sub_title">온라인 상담</h2>
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
								<th>답변 상태</th>
								<th>상담 내용</th>
								<th class="title">제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody id="counsel_list">
							
						</tbody>
					</table>	
				</div>

				<ul class="paging flex">
					<li><span> < </span></li>
					<li class="active">1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
					<li>6</li>
					<li>7</li>
					<li>8</li>
					<li>9</li>
					<li><span> > </span></li>
				</ul>

				<a href="javascipt:void(0)" class="btn_apply">온라인 상담하기</a>
			</div> 
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript" src="/common/js/jquery.tmpl.plus.js"></script>
	<script type="text/javascript">
	
	var prm = {};
	
		$(document).ready(function(){
			load_notice_list();
		});
	
		function load_notice_list(){
			$boardList.set({
				box 				: ".table_notice"
				,url           	 	: "/community/interface/communityList/BD03"
		      	,templeat      	    : "#counsel_list"
				,onCompleate        : function(data){
		        }
			});
		}
		
		
		
		$(".btn_search").on('click',function(){
			
			prm.board_title = $("input[type='search']").val();
			prm.board_menu_code="BD03";
			
			$.ajax({
				url:"/community/interface/searchCounselList"
				,data:prm
				,type:"POST"
				,success:function(data){
					
				}
			});
		});
	</script>
</body>
</html>