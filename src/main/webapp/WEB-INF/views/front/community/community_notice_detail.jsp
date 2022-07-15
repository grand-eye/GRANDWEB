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
			<div class="wsize pt100 pb200">
				<div class="detail_box">
					
				</div>

				<a href="javascipt:void(0)" class="btn_apply">목록 보기</a>

				<ul class="detail_page_control">
					<li class="control_box prev">
						<a href="javascript:void(0)" class="flex_between">
							<div class="flex">
								<span class="txt">[이전글]</span>
								<div class="title">제 2 주차장 안내</div>
							</div>
							<div class="date">2021-04-06</div>
						</a>
					</li>	
					<li class="control_box next">
						<a href="javascript:void(0)" class="flex_between">
							<div class="flex">
								<span class="txt">[다음글]</span>
								<div class="title">비급여 진료비 안내</div>
							</div>
							<div class="date">2021-04-06</div>
						</a>
					</li>	
				</ul>
			</div> 
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript" src="/common/js/jquery.tmpl.plus.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			load_notice_detail();
		});
		
		function load_notice_detail(){
			$boardList.set({
				box 				: ".detail_box"
				,url           	 	: "/community/interface/communityList/BD01"
				,board_idx			: "${board_idx}"
		      	,templeat      	    : "#notice_detail"
				,onCompleate        : function(data){
					
		        }
			});
		}
		
		
		
	</script>
</body>
</html>