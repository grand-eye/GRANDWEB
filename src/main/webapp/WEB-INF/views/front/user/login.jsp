<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub subEyecareJoinRetinaRevision">
			<div class="login_wrap"><!-- 로그인 -->
				<h2 class="cont-tit">로그인</h2>
				<div class="inner">
					<ul class="input-box">
						<li>
							<p>아이디 <span class="input-required">*</span></p>
							<div class="input-wrap">
								<input type="text" id="id_input">
							</div>
						</li>
						<li>
							<p>비밀번호 <span class="input-required">*</span></p>
							<div class="input-wrap">
								<input type="password" id="password_input" autocomplete="new-password">
							</div>
						</li>
					</ul>
					<div class="login-option">
						<div class="check_box">
							<input type="checkbox" id="rmbID" name="rmbID">
							<label for="rmbID">아이디 저장</label>
						</div>
						<div class="right-cont">
							<a href="/user/id_password_search" class="btn-find">아이디 ㅣ 비밀번호 찾기</a>
						</div>
					</div>
					<div class="btn-wrap">
						<button class="btn-main btn-login" type="button">로그인</button>
						<%--
						<div id="naver_id_login" style="display:none;"></div>
						<button class="btn-main btn-login-naver" type="button" onclick="document.getElementById('naver_id_login_anchor').click();"><img src="/common/img/sub/icon_naver.png" alt="naver"> 네이버 로그인</button>
						<button class="btn-main btn-login-kakao" type="button"><img src="/common/img/sub/icon_kakao.png" alt="naver"> 카카오 로그인</button>
						<button class="btn-main btn-login-google" type="button"><img src="/common/img/sub/icon_google.png" alt="naver"> 구글 로그인</button>
						--%>
						<p class="login-division"><span>or</span></p>
						<button class="btn-main btn-join" onclick="location.href='/user/join_terms'" type="button">회원 가입</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript" src="/common/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript">
	
	var prm ={};
	var email;
	var nickname;
	var name;
	var phone;

	/*
	var naver_id_login = new naver_id_login("Nh9x0gmuqMPpVv4EkP8o", "http://localhost:8080/");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 7,55);
	naver_id_login.setDomain("http://localhost:8080/");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	*/
	
	// 접근 토큰 값 출력
	//console.log("@@"+naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	//naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	 
		this.prm = {};
		this.email = naver_id_login.getProfileData('email');
		this.nickname = naver_id_login.getProfileData('nickname');
		this.name = naver_id_login.getProfileData('name');
		this.phone = naver_id_login.getProfileData('phone');
		 
		prm.type="naver|";
		prm.email = email;
		prm.nickname = "sns|guest";
		prm.name = name;
		prm.phone = phone;
	 
	 
		if ( naver_id_login.oauthParams.access_token !=null ){
			
			$(document).ajaxSend(function(e, xhr, options) {
		        xhr.setRequestHeader(header, token);
		    });
		  
			$.ajax({
				url	: 		"/user/interface/snsLogin"
				,data : 	prm
				,type : 	'POST'
				,success:function(data){
				if ( data.resultCode == "Y")
				{
					
					var url;
					if ( sessionStorage.getItem("urlParam") !=null && sessionStorage.getItem("urlParam") ){
						url = sessionStorage.getItem("urlParam");
					}else{
						url = data.recallurl;
					}
					sessionStorage.removeItem("urlParam");
					window.opener.document.location.href=url;
				}
				else if ( data.resultCode == "D")
				{
					window.opener.document.location.reload();
					return;	
				}
				else
				{
					console.log("message="+data.resultCode);
					return;
				}
				
				window.close();
				},
				error:function(jqXHR,textStatus,errorThrown){
					alert("관리자에게 문의해주세요.");
					window.close();
				}
					
			});
		}
	}
	
	var cookieData = document.cookie;
	
	$(document).ready(function(){
		
		
		if (cookieData.indexOf("save_id=true") > 0) {
			this.data = cookieData.split(";");
			this.data = this.data[1].split(".");
			$("#id_input").val(this.data[1]);
			$("input:checkbox[id='rmbID']").attr("checked",true);
		}
		
		//google_OAuth();
	});
	
	function google_OAuth(){
		
		$(".btn-login-google").on('click',function(){
			this.prm = {};
			this.prm.client_id = "865268950738-hmvcg2at8ctr32psfojpdtovd0qosjfr.apps.googleusercontent.com";
			//this.prm.client_secret = "JNXAM62NAVcPLd096ulB6Ern";
			this.prm.response_type = "code";
			this.prm.scope = "https%3A//www.googleapis.com/auth/drive.metadata.readonly";
			this.prm.redirect_uri = "https%3A//localhost:8080/";
			this.prm.access_type = "offline";
			this.prm.include_granted_scopes = true;
			this.prm.state = "test";
			
			
			$.ajax({
				url			: "https://accounts.google.com/o/oauth2/v2/auth"
				,type		: "POST"
				,data		: prm
				,success	: function(data){
					console.log("@@"+JSON.stringify(data));
				}
			});
			
			return false;
			
			this.prm = {};
			this.prm.client_id = "https%3A//www.googleapis.com/auth/drive.metadata.readonly";
			this.prm.client_secret = "offline";
			this.prm.grant_type = "authorization_code";
			this.prm.redirect_uri = "http://localhost:8080/";
			this.prm.state = "";
			this.prm.redirect_uri = "";
			this.prm.client_id = "";
			
			$.ajax({
				url			: "https://oauth2.googleapis.com/token"
				,type		: "POST"
				,data		: prm
				,success	: function(data){
					
				}
			})
		});
	}
	
	function getCookie(obj) {
		var name = obj + "=";
		var ca = document.cookie.split(';');

		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ')
				c = c.substring(1);
			if (c.indexOf(name) != -1)
				return c.substring(name.length, c.length);
		}
		return "";
	}
	
	var id = [];
	
	//아이디 저장 쿠키 SET
	function setCookie(ename, cvalue, exdays, userid) {
		var today = new Date();
		today.setTime(today.getTime() + (exdays * 12 * 60 * 60 * 1000));
		var expires = "expires" + today.toUTCString();

		document.cookie = ename + "=" + cvalue +"."+ userid + "; " + expires;
		id = document.cookie.split(".");
	}
	
	var prm = {};
		//이메일 도메인 선택
		$(".email-select li").on("click", function (){
			var text = $(this).html();
			$(".input-email2").val(text);
		});
		
		$(".btn-login").on('click',function(){
			
			prm.tblStrID = $("#id_input").val();
			prm.tblStrPass = $("#password_input").val();
			
			if( prm.tblStrID ==null || prm.tblStrID =='' ){
				alert('아이디를 입력해주세요.');
				return false;
			}
			
			if( prm.tblStrPass == null || prm.tblStrPass =='' ){
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			
			$.ajax({
				url			: "/user/interface/login"
				,data		: prm
				,type		: "POST"
				,success	: function(data){
					
					if( data.result =="fail" ){
						alert("아이디 혹은 비밀번호를 잘못 입력 하셨습니다.");
					}else{
						
						setCookie("save_id",$("input:checkbox[id='rmbID']").is(":checked"), 10000,$("#id_input").val());//
						
						alert("강남그랜드안과에 오신것을 환영합니다.");
						location.href="/";
					}
				}
			})	
			
		});
		
	</script>
</body>
</html>