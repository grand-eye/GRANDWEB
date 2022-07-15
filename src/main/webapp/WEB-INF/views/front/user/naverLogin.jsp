<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<meta charset="UTF-8">
	<meta name="_csrf" content= "${_csrf.token}" />
	<meta name="_csrf_header" content= "${_csrf.headerName}" />
</head>
<body>
<script type="text/javascript">

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

var prm ={};
var email;
var nickname;
var name;
var phone;

var naver_id_login = new naver_id_login("Nh9x0gmuqMPpVv4EkP8o", "http://localhost:8080/");
// 접근 토큰 값 출력
naver_id_login.oauthParams.access_token;
// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");
// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
 
	email = naver_id_login.getProfileData('email');
	nickname = naver_id_login.getProfileData('nickname');
	name = naver_id_login.getProfileData('name');
	phone = naver_id_login.getProfileData('phone');
	 
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
		url	: 		"/member/interface/snsLogin"
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

</script>
</body>
</html>