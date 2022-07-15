<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
		<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub subEyecareJoinRetinaRevision page-join page-cmplt">
			<div class="join_wrap"><!-- 회원가입 -->
				<h2 class="cont-tit">회원가입</h2>
				<ul class="join-process">
					<li>
						<span class="ls0">01</span> 약관 동의
					</li>
					<li class="process-symbol"><span class="f_go">&lt;</span></li>
					<li>
						<span class="ls0">02</span> 정보 입력
					</li>
					<li class="process-symbol"><span class="f_go">&lt;</span></li>
					<li class="active">
						<span class="ls0">03</span> 가입 완료
					</li>
				</ul>
				<div class="wsize txt-center">
					<div class="inner">
						<div class="img-wrap">
							<img src="/common/img/sub/logo_1letter.png" alt="">
						</div>
						<h3 class="join-tit">
							강남그랜드안과 회원이 되신 것을 <br>
							진심으로 축하드립니다.
						</h3>
						<p class="cont-desc">
							강남그랜드안과 웹사이트의 다양한 정보는 <br>
							물론, 편리한 온라인 예약 및 상담, 다양한 이벤트, 체험기 등 <br>
							풍부하고 알찬 서비스를 지금 바로 이용 하실 수 있습니다.
						</p>
						<p class="join-note">
							*입력해 주신 고객님의 정보는 인터넷 상에서 <br>
							개인정보 보호정책에 따라 소중하게 보호됩니다.
						</p>
						<div class="btn-wrap">
							<button class="btn_apply" type="button" onclick="location.href='/user/login'">로그인</button>
							<button class="btn_apply btn-2nd" type="button" onclick="location.href='/'">메인으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript">
	
	</script>
</body>
</html>