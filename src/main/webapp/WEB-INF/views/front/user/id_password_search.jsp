<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub">
			<div class="idpw_wrap wsize03 inner">
				<h2 class="cont-tit">아이디 ㅣ 비밀번호 찾기</h2>
				<div class="flex_between">
					<div class="idpw_box id_box">
						<h3 class="tit">아이디 찾기</h3>
						<ul class="input-box">
							<li>
								<p>이름 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="text" id="name" autocomplete="new-password">
								</div>
							</li>
							<li>
								<p>이메일 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="text" id="email" autocomplete="new-password">
								</div>
							</li>
						</ul>
						<button class="btn-main btn-confirm btn-id" type="button">확인</button>
					</div>
					<div class="idpw_box pw_box">
						<h3 class="tit">비밀번호 찾기</h3>
						<ul class="input-box">
							<li>
								<p>아이디 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="text" id="id" autocomplete="new-password">
								</div>
							</li>
							<li>
								<p>이름 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="text" id="name" autocomplete="new-password">
								</div>
							</li>
							<li>
								<p>이메일 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="text" id="email" autocomplete="new-password">
								</div>
							</li>
						</ul>
						<button class="btn-main btn-confirm btn-pw" type="button">확인</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript">
		$(".btn-id").on('click',function(){
			
			if( $(".id_box").find("#name").val() ==null || $(".id_box").find("#name").val() == '' ){
				alert("이름을 입력해주세요.");
				return false;
			}
			
			if( $(".id_box").find("#email").val() ==null || $(".id_box").find("#email").val() == '' ){
				alert("이메일을 입력해주세요.");
				return false;
			}
			
			this.prm = {};
			this.prm.tblStrName = $(".id_box").find("#name").val();
			this.prm.tblStrEmail = $(".id_box").find("#email").val();
			
			$.ajax({
				url			: "/user/interface/user_check"
				,type		: "POST"
				,data		: this.prm
				,success	: function(data){
					
					if( data.result == null || data.result== '' ){
						alert('입력하신 사용자를 찾지 못하였습니다. 다시 한번 확인해주세요.');
					}else{
						alert("가입하신 아이디는 '"+data.result.tblStrID+"' 입니다.");
						$(".pw_box").find("#id").val(data.result.tblStrID);
					}
				}
			})
		});
		
		$(".btn-pw").on('click',function(){
			
			if( $(".pw_box").find("#id").val() ==null || $(".pw_box").find("#id").val() == '' ){
				alert("아이디를 입력해주세요.");
				return false;
			}
			
			if( $(".pw_box").find("#name").val() ==null || $(".pw_box").find("#name").val() == '' ){
				alert("이름을 입력해주세요.");
				return false;
			}
			
			if( $(".pw_box").find("#email").val() ==null || $(".pw_box").find("#email").val() == '' ){
				alert("이메일을 입력해주세요.");
				return false;
			}
			
			this.prm = {};
			this.prm.tblStrID = $(".pw_box").find("#id").val();
			this.prm.tblStrName = $(".pw_box").find("#name").val();
			this.prm.tblStrEmail = $(".pw_box").find("#email").val();
			this.prm.caseBy = 2;
			
			$.ajax({
				url			: "/user/interface/user_check"
				,type		: "POST"
				,data		: this.prm
				,success	: function(data){
					
					if( data.result == null || data.result== '' ){
						alert('입력하신 사용자를 찾지 못하였습니다. 다시 한번 확인해주세요.');
					}else{
						alert('입력하신 정보로 메일이 발송 되었습니다.');
						location.href="/user/login";
					}
					
				}
			});
			
		});
	</script>
</body>
</html>