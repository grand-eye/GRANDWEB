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
				<h2 class="cont-tit">마이페이지</h2>
				<div class="wsize">
					<div class="inner">
						<ul class="info-input">
							
						</ul>
						<button class="btn_update" type="button">비밀번호 수정</button>
						<button class="btn_delete" type="button">회원탈퇴</button>
						<button class="btn_update_apply" style="display:none;" type="button">확인</button>
						<button class="btn_delete_apply" style="display:none;" type="button">확인</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript">
	var prm = {};
	
	var pwdVaild = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
	var charValid = /[~!@#$%^&*()_+|<>?:{}]/;
	
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
	
	$(".btn_update").on('click',function(){
		$("#update_info").tmpl().appendTo(".info-input");
		
		$(".btn_update").hide();
		$(".btn_delete").hide();
		
		$(".btn_update_apply").show();
	});
	
	$(".btn_delete").on('click',function(){
		
		if(confirm("회원을 탈퇴하게 되시면 기존에 입력한 자료에 대한 \n수정 및 삭제에 대한 권한은 없어집니다.\n\n 그래도 탈퇴하시겠습니까?")){
			$("#update_info").tmpl().appendTo(".info-input");
			
			$(".btn_update").hide();
			$(".btn_delete").hide();
			
			$(".btn_delete_apply").show();
		}else{
			
		  return false;
		}	
	});
	
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
		
		$(".btn_update_apply").on('click',function(){
			
			if ($('#password_input').val() =="" || !pwdVaild.test($('#password_input').val()) || !charValid.test($('#password_input').val()) ){
				alert('비밀번호는 8자 이상 20자 이하,문자,숫자,특수문자(!,@,#등) 조합으로 입력하여 주세요.');
				$('#password_input').focus();
				return;
			}
			
			prm = {};
			
			prm.tblStrID = "${sessionScope.GRAND_USER_ID}";
			prm.tblStrPass = $("#password_input").val();
			prm.tblStrName = "${sessionScope.GRAND_USER_NAME}";
			prm.tblStrPhone = "${sessionScope.GRAND_USER_MOBILE}";
			prm.tblStrEmail = "${sessionScope.GRAND_USER_EMAIL}";
			
			$.ajax({
				url		:"/user/interface/updateUser"
				,data	:prm
				,type	:"POST"
				,success:function(data){
					
					if( data.result =="1" ){
						alert("비밀번호 수정이 완료 됐습니다.");
						location.href="/user/interface/logout";
					}else{
						alert("에러가 발생했습니다. 관리자에게 문의해주세요.");
					}
				}
			})	
			
		});
		
		$(".btn_delete_apply").on('click',function(){
			
			prm = {};
			
			prm.tblStrID = "${sessionScope.GRAND_USER_ID}";
			prm.tblStrPass = $("#password_input").val();
			prm.tblStrName = "${sessionScope.GRAND_USER_NAME}";
			prm.tblStrPhone = "${sessionScope.GRAND_USER_MOBILE}";
			prm.tblStrEmail = "${sessionScope.GRAND_USER_EMAIL}";
			
			$.ajax({
				url		:"/user/interface/deleteUser"
				,data	:prm
				,type	:"POST"
				,success:function(data){
					
					if( data.result =="1" ){
						alert("회원탈퇴가 완료 됐습니다. 그동안 이용해주셔서 감사합니다.");
						location.href="/user/interface/logout";
					}else{
						alert("비밀번호를 잘못 입력하셨습니다.");
					}
				}
			})	
			
		});
		
		
	</script>
	
<script type="text/x-jquery-tmpl"  id="update_info">	
	<li>
		<p>비밀번호 <span class="input-required">*</span></p>
		<div class="input-wrap">
			<input type="password" id="password_input" autocomplete="new-password">
		</div>
	</li>
</script>
	
</body>
</html>