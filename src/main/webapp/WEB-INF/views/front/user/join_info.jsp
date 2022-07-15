<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
		<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub subEyecareJoinRetinaRevision page-join page-info">
			<div class="join_wrap"><!-- 회원가입 -->
				<h2 class="cont-tit">회원가입</h2>
				<ul class="join-process">
					<li>
						<span class="ls0">01</span> 약관 동의
					</li>
					<li class="process-symbol"><span class="f_go">&lt;</span></li>
					<li class="active">
						<span class="ls0">02</span> 정보 입력
					</li>
					<li class="process-symbol"><span class="f_go">&lt;</span></li>
					<li>
						<span class="ls0">03</span> 가입 완료
					</li>
				</ul>
				<div class="wsize">
					<div class="inner">
						<ul class="info-input">
							<li>
								<p>아이디 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="text" id="id_input" class="input-chk"><button type="button" class="btn btn-chk">중복 체크</button>
								</div>
							</li>
							<li>
								<p>비밀번호 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="password" id="password_input" autocomplete="new-password">
								</div>
							</li>
							<li>
								<p>비밀번호 확인 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="password" id="password_input_check">
								</div>
								<div id="check_text"></div>
							</li>
							
							<li>
								<p>생년월일 <span class="input-ps">(양력)</span></p>
								<div class="input-wrap">
									<input type="text" maxlength="8" id="birthday_input" onkeypress="return fn_press(event,'numbers');" onkeydown="fn_press_kor(this)" placeholder="예) 20210201( 8 자리)">
								</div>
							</li>
						</ul>
						<ul class="info-input">
							<li>
								<p>이름 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="text" id="name_input">
								</div>
							</li>
							<li>
								<p>휴대폰 번호 <span class="input-required">*</span></p>
								<div class="input-wrap">
									<input type="text" id="tel_input" onkeypress="return fn_press(event,'numbers');" onkeydown="fn_press_kor(this)" placeholder="예) 01012341234( - 없이)">
								</div>
							</li>
							<li>
								<p>이메일 <span class="input-required">*</span></p>
								<div class="input-wrap input-email-wrap">
									<input type="text" class="input-email1" id="email_input1"> <span class="input-txt">@</span> <input type="text" class="input-email2" id="email_input2" placeholder="직접 입력">
									<div class="select_box">
										<div class="select">직접 입력</div>
										<ul class="select_ul email-select">
											<li>직접입력</li>
											<li>daum.net</li>
											<li>hanmail.net</li>
											<li>hotmail.com</li>
											<li>naver.com</li>
											<li>nate.com</li>
											<li>gmail.com</li>
										</ul>
									</div>
								</div>
								<p class="input-note">이메일은 아이디 l 비밀번호 찾기 시에만 사용 됩니다.</p>
							</li>
						</ul>
						<button class="btn_apply" type="button">다음</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript">
	var prm = {};
	
	var charValid = /[~!@#$%^&*()_+|<>?:{}]/;
	var korValid = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var numValid = /[0-9]/;
	var eng = /^[a-zA-Z]*$/;
	var pwdVaild = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
	var id="";
	var idcheck=false;
	
	function fn_press(event,type){
		if(type == "numbers"){
			if(event.keyCode < 48 || event.keyCode > 57){ 
				return false;
			}
		}
	}
	
	function fn_press_kor(obj){
		if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46){
			return ;
		}
		obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g,'');
	}
	
	
		//이메일 도메인 선택
		
		$(".btn-chk").on("click",function(){
			
			id = $("#id_input").val();
			if( id ==null || id==''){
				alert('ID를 입력해주세요.');
				return false;
			}
			
			if( id.length < 4 ){
				alert('ID는 4글자 이상 입력해주세요.');
				return false;
			}
			
			prm.tblStrID = id;
			
			$.ajax({
				url		: "/user/interface/id_check"
				,data	: prm
				,type	: "POST"
				,success:function(data){
					
					if( data.result !=undefined && data.result >= 1 ){
						alert("중복된 아이디입니다.");
						return false;
					}else{
						alert("사용 가능한 아이디입니다.");
						idcheck = true;
					}
				}
			})
		});
		
		/* $("#password_input_check").on("focusout",function(){
			$("#check_text").html("비밀번호가 다릅니다.");
		}); */
		
		$(".btn_apply").on('click',function(){
			
			var tblStrID = $("#id_input").val();
			var phone = $("#tel_input").val();
			
				if (tblStrID =="" || idcheck != true || id != tblStrID ){
					alert('아이디 중복확인을 해주세요!');
					 $('#id_input').focus();
					return ;
				}
				else if ($('#password_input').val() =="" || !pwdVaild.test($('#password_input').val()) || !charValid.test($('#password_input').val()) ){
					alert('비밀번호는 8자 이상 20자 이하,문자,숫자,특수문자(!,@,#등) 조합으로 입력하여 주세요.');
					$('#password_input').focus();
					return;
				}
				else if ($('#password_input').val() != $('#password_input_check').val()){
					alert('비밀번호가 일치하지 않습니다! 다시 입력해 주세요.');
					$('#password_input').focus();
					return;
				}
				else if ($('#name_input').val() =="" || !korValid.test($('#name_input').val()) || charValid.test($('#name_input').val()) || numValid.test($('#name_input').val()) ){
					alert('이름을 정확히 입력해주세요.');
					$('#name_input').focus();
					return;
				}
				else if ($('#tel_input').val().length < 11 || !numValid.test($('#tel_input').val()) || korValid.test($('#tel_input').val()) || charValid.test($('#tel_input').val()) || eng.test($('#tel_input').val())){
					alert('핸드폰번호를 정확히 입력하세요.');
					$('#tel_input').focus();
					return;
				}
				else if ($('#email_input1').val() == null || $('#email_input1').val() =='' || korValid.test($('#email_input1').val()) || charValid.test($('#email_input1').val())){
					alert('이메일(앞자리)를 입력하여 주세요.');
					return;
				}
				else if ($('#email_input2').val() == null || $('#email_input2').val() =='' || korValid.test($('#email_input2').val()) || charValid.test($('#email_input2').val())){
					alert('이메일(뒷자리)를 입력하여 주세요.');
					return;
				}
			
			prm.tblStrId = $("#id_input").val();
			prm.tblStrPass = $("#password_input").val();
			prm.tblStrName = $("#name_input").val();
			prm.tblStrPhone = $("#tel_input").val();
			prm.tblStrEmail = $("#email_input1").val()+"@"+$("#email_input2").val();
			prm.memDel = "N";
			
			$.ajax({
				url		:"/user/interface/insertUser"
				,data	:prm
				,type	:"POST"
				,success:function(data){
					if( data.result =="1" ){
						alert("회원가입이 완료됐습니다.");
						location.href="/user/join_cmplt";
					}else{
						alert("에러가 발생했습니다. 관리자에게 문의해주세요.");
					}
				}
			})	
			
		});
		
		
	</script>
</body>
</html>