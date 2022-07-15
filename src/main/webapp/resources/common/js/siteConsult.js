function numkeyCheck(e) {
	var keyValue = event.keyCode;
	if( ((keyValue >= 48) && (keyValue <= 57)) ) 
		return true;
	else
		return false;
}

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
    }    
}

// 메인페이지와 랜딩 동일 사용
function doSubmit_main() {
	var chknum = 0;
	if (!$('#mh_name').val())
	{
		alert('이름은 필수항목입니다.');
		$('#mh_name').focus();
		return false;
	}
	if (!$('#mh_hp').val())
	{
		alert('연락처는 필수항목입니다.');
		$('#mh_hp').focus();
		return false;
	}
	if ($('#mh_hp').val().length < 12) {
		alert('휴대폰 번호는 12자 이상입력하여 주세요.');
		$('#mh_hp').focus();
		return false;
	}
	if (!$('#mh_message').val())
	{
		alert('상담내용은 필수항목입니다.');
		$('#mh_message').focus();
		return false;
	}
	if ($('#checkbox01').is(":checked") == false)
	{
		alert('개인정보취급방침 동의하셔야 합니다.');
		return false;
	}

	var url = location.pathname;
	gtag('event', 'COUNSEL_CLICK', {'event_category' : url , 'event_label' :  '' });
}


// 메인페이지와 랜딩 동일 사용
function doSubmit_main_web() {
	var chknum = 0;
	if (!$('#mh_name2').val())
	{
		alert('이름은 필수항목입니다.');
		$('#mh_name2').focus();
		return false;
	}
	if (!$('#mh_hp2').val())
	{
		alert('연락처는 필수항목입니다.');
		$('#mh_hp2').focus();
		return false;
	}
	if ($('#mh_hp2').val().length < 12) {
		alert('휴대폰 번호는 12자 이상입력하여 주세요.');
		$('#mh_hp2').focus();
		return false;
	}
	if (!$('#mh_message2').val())
	{
		alert('상담내용은 필수항목입니다.');
		$('#mh_message2').focus();
		return false;
	}
	if ($('#checkbox012').is(":checked") == false)
	{
		alert('개인정보취급방침 동의하셔야 합니다.');
		return false;
	}
	
	var url = location.pathname;
	gtag('event', 'COUNSEL_CLICK', {'event_category' : url , 'event_label' : '' });
}

var ck_telephone = function(obj) {
    str = obj.value;
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if(str.substr(0,2) == '02'){
        if( str.length < 3){
            return str;
        }else if(str.length < 6){
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2);
        }else if(str.length < 10){
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2, 3);
            tmp += '-';
            tmp += str.substr(5);
        }else{				
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2, 4);
            tmp += '-';
            tmp += str.substring(6,10);
        }

    }else{
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
        }else{				
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
        }
    }
    obj.value = tmp;
};