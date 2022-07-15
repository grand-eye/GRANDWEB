function ElementVar(ele,uid){
	$("input[name=" + ele + "]").val(uid);
}

/*상단메뉴 스크롤 고정 셋팅*/
function Loin_Check(form){
    if(!form.userid.value || form.userid.value=="아이디"){
		alert("아이디를 입력해 주세요!");
		form.userid.focus();
		return false;
	}
	if(!form.pwd.value || form.pwd.value=="패스워드"){
		alert("비밀번호를 입력해 주세요!");
		form.pwd.focus();
		return false;
	}
	return true;
}

function isNumber(str) {
	if (str) {
		if (str.search(/[^0-9]/g) == -1) return true;
		else return false;
	}
	else return false;
}

function korOnly(str) {
	var strLength = str.length;
	var i;
	var Unicode;
	for (var i=0; i<strLength; i++){
		Unicode = str.charCodeAt(i);
		if ( !(44032 <= Unicode && Unicode <= 55203) ) return false;
	}
	return true;
}

function WinPop(clo_name,pop_name){
	if(clo_name){
		jQuery(document.body).overlayPlayground('close');
	}
	if(pop_name){
		$("#" + pop_name + "_linker").click();
	}
}

function Agrr2_Check(form){
	var v_true=false;
	var j_true=false;
	var numeric = /[0-9]/gi;
	var passwdvalue = form.pwd.value;
	var pattern = /[~!@\#$%<>^&*\()\-=+_\']/gi;

	if(!form.strUserId.value){
		alert("아이디를 입력해 주세요!");
		form.strUserId.focus();
		return false;
	}
	if(!is_ID(form.strUserId.value)){
		alert("아이디는 숫자 또는 영문만 입력가능하며, 6~20자 이내로 작성해야 합니다.");
		form.strUserId.value = "";
		form.strUserId.focus();
		return false;
	}
	if(!form.idchch.value || form.idchch.value.replace(/_/g,"") != 'checkingsuccess'){
		alert("아이디 중복확인을 해주세요!");
		form.strUserId.focus();
		return false;
	}
	if(!form.pwd.value){
		alert("비밀번호를 입력해 주세요!");
		form.pwd.focus();
		return false;
	}
	if (!passwdvalue.match(pattern))
	{
		alert("비밀번호는 특수문자(!,@,#등) 조합으로 입력하여 주세요.");
		form.pwd.focus();
		return false;
	}
	if(form.pwd.value.length < 6){
		alert("비밀번호는 영문, 숫자, 특수문자 조합으로 6~20자 이내로 작성해야 합니다.");
		form.pwd.focus();
		return false;
	}
	if(!form.repwd.value){
		alert("비밀번호 확인을 입력해 주세요!");
		form.repwd.focus();
		return false;
	}
	if(form.pwd.value!=form.repwd.value){
		alert("비밀번호가 일치하지 않습니다! 다시 입력해 주세요.");
		form.pwd.focus();
		return false;
	}
	if(!form.strName.value){
		alert("성명을 입력해 주세요!");
		form.strName.focus();
		return false;
	}
	if(!form.phone.value){
		alert("핸드폰번호를 입력해 주세요.");
		form.phone.focus();
		return false;
	}
	if(!form.phone.value.match(numeric)){
		alert("핸드폰번호는 숫자만 입력하여 주세요.");
		form.phone.focus();
		return false;
	}
	if(form.phone.value.length < 11){
		alert("핸드폰번호를 정확히 입력하세요!"+form.phone.value.length);
		form.phone.focus();
		return false;
	}
	if(!form.mobilechch.value || form.mobilechch.value.replace(/_/g,"") != 'checkingsuccess'){
		alert("핸드폰 중복확인을 해주세요!");
		return false;
	}
	if (!$('#strEmail1').val())
	{
		alert('이메일(앞자리)를 입력하여 주세요.');
		$('#strEmail1').focus();
		return false;
	}		
	if (!$('#strEmail2').val())
	{
		alert('이메일(뒷자리)를 입력하여 주세요.');
		$('#strEmail2').focus();
		return false;
	}		
	if (!$('#etc1').val())
	{
		alert('성별을 선택하여 주세요.');
		return false;
	}
}

function Edit_Check(form){
	var numeric = /[0-9]/gi;
	var pattern = /[~!@\#$%<>^&*\()\-=+_\']/gi;
	if(!form.sns.value){
		var passwdvalue = form.newpwd.value;
		if(!form.pwd.value){
			alert("비밀번호를 입력해 주세요!");
			form.pwd.focus();
			return false;
		}
		if(form.newpwd.value){
			if (!passwdvalue.match(pattern))
			{
				alert("새비밀번호는 특수문자(!,@,#등) 조합으로 입력하여 주세요.");
				form.newpwd.focus();
				return false;
			}
		  if(!form.re_newpwd.value){
			alert("새비밀번호 확인란를 입력해 주세요!");
			form.re_newpwd.focus();
			return false;
		  }
		  if(form.newpwd.value!=form.re_newpwd.value){
			alert("새비밀번호와 확인란번호가 일치하지 않습니다! 다시 입력해 주세요.");
			form.newpwd.focus();
			return false;
		  }
		}
	}
	if(!form.phone.value){
		alert("핸드폰번호를 입력해 주세요.");
		form.phone.focus();
		return false;
	}
	if(form.phone.value.length < 11){
		alert("핸드폰번호를 정확히 입력하세요!");
		form.phone.focus();
		return false;
	}
	if(form.mobilechch.value == "false"){
		alert("핸드폰번호를 다시 입력하세요!");
		return false;
	}

	if (!$('#strEmail1').val())
	{
		alert('이메일(앞자리)를 입력하여 주세요.');
		$('#strEmail1').focus();
		return false;
	}		
	if (!$('#strEmail2').val())
	{
		alert('이메일(뒷자리)를 입력하여 주세요.');
		$('#strEmail2').focus();
		return false;
	}		
	if (!$('#etc1').val())
	{
		alert('성별을 선택하여 주세요.');
		return false;
	}
}

function is_ID(id_pw){
	if(id_pw.length < 6 || id_pw.length > 20){
		return false;
	}
	var j = k = 0;
	for(var i=0; i<id_pw.length; i++){
		var chr = id_pw.substr(i,1);
		if((chr < '0' || chr > '9') && (chr < 'a' || chr > 'z')){
			return false;
		}
		if(chr >= '0' && chr <= '9')
			j++;
		if(chr >= 'a' && chr <= 'z')
			k++;
	}
	return true;
}

function is_IDPW(id_pw){
	if(id_pw.length < 6 || id_pw.length > 20){
		return false;
	}
}

function Loin_Check(form){
	if(!form.userid.value || form.userid.value=="아이디"){
		alert("아이디를 입력해 주세요!");
		form.userid.focus();
		return false;
	}
	if(!form.pwd.value || form.pwd.value=="패스워드"){
		alert("비밀번호를 입력해 주세요!");
		form.pwd.focus();
		return false;
	}
	return true;
}

function Form_Check_ID(form){
	if(!form.fname.value){
		alert("이름을 입력해 주세요!");
		form.fname.focus();
		return false;
	}else{
		if(!korOnly(form.fname.value)){
			alert("이름은 한글만 입력됩니다!");
			form.fname.focus();
			form.fname.select();
			return false;
		}
	}
	if(!form.femail.value){
		alert("이메일을 입력해 주세요!");
		form.femail.focus();
		return false;
	}
	if(!emailcheck(form.femail.value)){
	 form.femail.focus();
	 return false;
	}
	return true;
}

function Form_Check_PW(form){
	if(!form.fuserid.value){
		alert("아이디를 입력해 주세요!");
		form.fuserid.focus();
		return false;
	}
	else{
		if(form.fuserid.value && !is_ID(form.fuserid.value)){
			alert("아이디는 4∼10자 사이의 영문(소문자)과 숫자만을 허용합니다!");
			form.fuserid.focus();
			form.fuserid.select();
			return false;
		}
	}
	if(!form.fname2.value){
		alert("이름을 입력해 주세요!");
		form.fname2.focus();
		return false;
	}else{
		if(!korOnly(form.fname2.value)){
			alert("이름은 한글만 입력됩니다!");
			form.fname2.focus();
			form.fname2.select();
			return false;
		}
	}
	if(!form.femail2.value){
		alert("이메일을 입력해 주세요!");
		form.femail2.focus();
		return false;
	}
	if(!emailcheck(form.femail2.value)){
	 form.femail2.focus();
	 return false;
	}
	return true;
}

function Del_Check(form){
	var passwdvalue = form.pwd.value;
	var pattern = /[~!@\#$%<>^&*\()\-=+_\']/gi;
	if(!form.duserid.value){
		alert("아이디를 입력해 주세요!");
		form.duserid.focus();
		return false;
	}else{
		if(form.duserid.value && !is_ID(form.duserid.value)){
			alert("아이디는 6∼10자 사이의 영문(소문자)과 숫자만을 허용합니다!");
			form.duserid.focus();
			form.duserid.select();
			return false;
		}
	}
	if(!form.pwd.value){
		alert("비밀번호를 입력해 주세요!");
		form.pwd.focus();
		return false;
	}
	if(!form.reason.value){
		alert("탈퇴사유를 선택하여 주세요!");
		return false;
	}
	if(!form.content.value){
		alert("바라는점을 입력해 주세요!");
		form.content.focus();
		return false;
	}
	if(confirm("회원을 탈퇴하게 되시면 기존에 입력한 자료에 대한 \n수정 및 삭제에 대한 권한은 없어집니다.\n\n 그래도 탈퇴하시겠습니까?")){
      return true;
	}else{
      alert("탈퇴를 취소하셨습니다.");
	  return false;
	}	
}

function onlyNumber(e) {
	var keyValue = event.keyCode;
	if( ((keyValue >= 48) && (keyValue <= 57)) ) 
		return true;
	else
		return false;
}

function open_win(){
  window.open('/com_popup/com_popup_02.html','win_popo','height=450,width=507,top=150,left=200,scrollbars=no');
}

function win_popup(aa,bb,cc){
  window.open(aa,bb,cc);
}

function mobilecheck(){
    $('#checking_value').val($('#phone').val());
	document.form1.mode.value = "mobilecheck";
	document.form1.submit();
}

function mod_mobilecheck(){
    $('#checking_value').val($('#phone').val());
	document.form1.mode.value = "mod_mobilecheck";
	document.form1.submit();
}

function mobilechkReset(){
	$('#mobilechch').val('');
}
$(function() {
	$('.member_tab a').on('click',function(e){
		e.preventDefault();
		var id = $(this).attr('href');
		$('.idpw_box').hide();
		$('#'+id).show();

		$('.member_tab li').removeClass('on');
		$(this).parents('li').addClass('on');
	});
});