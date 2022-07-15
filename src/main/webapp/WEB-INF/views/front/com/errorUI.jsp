	<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>

		
			<!-- main -->
			<main class="main">
				<div class="content">
					<!-- delivery section -->
					<div class="delivery-section">
						<div class="ui-breadcrumb">

						</div>
						
						
						<section class="delivery-content">
							<div class="delivery_fail">
								<div class="delivery_fail_msg">
									<div class="fail_icon"><img src="/common/img/static2/fail_icon.jpg" alt="실패아이콘"></div>
									<p class="fail_msg_tt" >
										<b>서비스 이용에 불편을 드려 죄송합니다.</b>
										<br />
										<br />
										<span style="font-size:20px;color:#000">
										요청한 웹페이지의 이름이 바뀌었거나 현재 사용할 수 없거나 삭제되었습니다.
										<br />
										입력하신 주소가 정확한지 다시 한번 확인해보시기 바랍니다.
										</span>
									</p>
									<p class="fail_msg_stxt"></p>
								</div>
								<div class="btn-area btn-area__ty3 btn-area__ty4">
									<a href="javascript:history.back(-1);" class="btn btn-lg pHrefBtn">이전페이지</a>
									<a href="/main" class="btn btn-lg pHrefBtn">메인으로</a>
									
								</div>
							</div>
						</section>
					</div>
					<!-- //delivery section -->
				</div>
			</main>
			<!-- //main -->		

		

		<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	</div>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".pHrefBtn").on("click", function(e){
					e.preventDefault();
					
					var href = $(this).attr("href");
					opener.location.href=href;
					window.close();
			});
		});
	
	</script>
	
</body>
</html>