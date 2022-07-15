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
			<h2 class="sub_title">미디어</h2>
			<div class="wsize pt100 pb200">
				<div class="search_box flex_between">
					<div class="search">
						<input type="search" placeholder="검색어를 입력하세요.">
					</div>
					<button type="button" class="btn_search">검색</button>
				</div>
				
				<div class="wsize03 pt100">
					<div class="news_wrap">
						<h3 class="sub_title05">뉴스 &middot; 언론 보도</h3>
						<div class="media_news_list mt40">
							<ul class="flex_between media-box">
								
							</ul>
						</div>
					</div>

					<ul class="paging flex">
					
					</ul>

					<div class="tv_wrap mt200">
						<h3 class="sub_title05">안물 안궁 TV</h3>
						<div class="media_tv_list mt40">
							<ul class="flex_between">
								<li>
									<a href="javascript:void(0)">
										<div class="tv_box">        
											<div class="img_box">
												<span><img src="/common/img/sub/community_img_media05.png" alt="미디어"></span>
											</div>        
											<div class="txt_box">                 
												<p class="title">메디컬 투데이 이관훈 원장 인터뷰</p>           
											</div>       
										</div>  
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<div class="tv_box">        
											<div class="img_box">
												<span><img src="/common/img/sub/community_img_media06.png" alt="미디어"></span>
											</div>        
											<div class="txt_box">                 
												<p class="title">의료건강 사회공헌 안과 부분 대상 수상</p>
											</div>       
										</div>  
									</a>
								</li>
							</ul>
						</div>
						<a href="https://www.youtube.com/channel/UC0xNBPgsEszoZ3QINqfcV4A" target="_blank" class="btn_tv">안물안궁 TV 보러가기</a>
					</div>
				</div>
			</div> 
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript" src="/common/js/jquery.tmpl.plus.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			console.log("page load...");
			console.log("thumb page...");
			
			load_list();
		});
	
		function load_list(){
			$boardList.set({
				box 				: ".media-box"
				,url           	 	: "/community/interface/communityList/${menu_code}"
		      	,templeat      	    : "${listdata}"
				,onCompleate        : function(data){
					
		        }
			});
		}
		
	</script>
</body>
</html>