<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub online__counseling">
			<h2 class="sub_title">온라인 상담</h2>
			<div class="wsize pt100 pb200">
				<div class="wsize03">
					<div>
						<p class="sub_title05">상담 분야</p>
						<div class="radio_box_wrap flex_between">
							<div class="radio_box">
								<input type="radio" id="radio1" name="chk" value="rs01">
								<label for="radio1">노안 &middot; 백내장</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="radio2" name="chk" value="rs02">
								<label for="radio2">시력 교정 (라식&middot;라섹)</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="radio3" name="chk" value="rs03">
								<label for="radio3">드림렌즈</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="radio4" name="chk" value="rs04">
								<label for="radio4">안 질환</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="radio5" name="chk" value="rs05">
								<label for="radio5">아이케어</label>
							</div>
						</div>
					</div>

					<div class="mt90">
						<p class="sub_title05">희망 시간</p>
						<div class="radio_box_wrap flex">
							<div class="radio_box">
								<input type="radio" id="radio01" name="time" value="TM01">
								<label for="radio01">오전 10 - 12시</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="radio02" name="time" value="TM02">
								<label for="radio02">오후 2 - 4시</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="radio03" name="time" value="TM03">
								<label for="radio03">오후 4 - 6시</label>
							</div>
						</div>
					</div>

					<div class="mt80 counsel_detail_box">
						<div class="input_box flex mr95">
							<label for="name">고객 성함</label>
							<input type="text" id="name" placeholder="홍길동" autocomplete="new-password">
						</div>
						<div class="input_box flex mr95">
							<label for="name">글 비밀번호</label>
							<input type="password" id="pass" autocomplete="new-password">
						</div>
						<div class="input_box flex">
							<label for="birth">생년월일</label>
							<input type="text" id="birth" placeholder="예) 19820201" maxlength="8">
						</div>
						<div class="input_box flex mr95">
							<label for="tel">휴대폰 번호</label>
							<input type="text" id="tel" placeholder="휴대폰 번호를 - 없이 입력해주세요.">
						</div>
						<div class="input_box flex">
							<label for="title">제목</label>
							<input type="text" id="title" placeholder="제목을 입력하세요.">
						</div>
						<div class="input_box flex">
							<label for="cont">상담 내용</label>
							<textarea id="cont" wrap="hard" rows="3" cols="10" placeholder="내용을 입력해주세요. (500자 이내)"></textarea>
						</div>
					</div>
					
					<div class="counsel_privacy_box">
						<p class="sub_title05">개인정보 취급방침</p>
						<div class="cont">
							<div class="cont_inr">
								'강남그랜드안과'는 (이하 '본원'은) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 본원은 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br>
								본원은 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br><br>

								ο 본 방침은 : 2021 년 2 월 1일 부터 시행됩니다.<br><br>

								■ 수집하는 개인정보 항목<br><br>

								본원은 상담, 예약, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br><br>

								ο 수집항목 : 이름, 핸드폰 번호, 전화번호, 이메일, 진료과목, 비밀번호<br><br>

								■ 개인정보의 수집 및 이용목적<br><br>

								본원은 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br><br>

								ο 서비스 제공에 관한 계약 이행 콘텐츠 제공 , 물품배송 또는 청구지 등 발송 , 본인 인증, 웹매일발송, 이벤트메일 발송<br>
								ο 마케팅 및 광고에 활용 이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br><br>

								■ 개인정보의 보유 및 이용기간<br><br>

								원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 본원은 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br><br>

								보존 항목 : 이름 ,이메일<br>
								보존 근거 : 이용자의 홈페이지 이용 편의를 위해 제공<br>
								보존 기간 : 이용자의 정보 폐기 요청이 있을 때까지 제공<br><br>

								계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br>
								대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br>
								소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)<br><br>

								■ 개인정보의 파기절차 및 방법<br><br>

								본원은 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.<br><br>

								ο 파기절차<br>
								회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.
								별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.<br><br>

								ο 파기방법 <br>
								- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br><br>

								■ 개인정보 제공<br>

								본원은 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br><br>
								- 이용자들이 사전에 동의한 경우<br>
								- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br><br>

								■ 이용자 및 법정대리인의 권리와 그 행사방법<br><br>

								이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.<br>
								이용자들의 개인정보 조회,수정을 위해서는 ‘예약변경'을 가입해지(동의철회)를 위해서는 “상담내용 삭제”요청의사를 전달하시면 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.<br>
								혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.<br>
								귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.<br>
								본원은 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 “본원가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.<br><br>

								■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항<br><br>

								본원은 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 본원은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.<br><br>

								▶ 쿠키 등 사용 목적<br>
								- 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공<br><br>

								귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.<br><br>

								▶ 쿠키 설정 거부 방법<br>
								예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.<br><br>

								설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 [인터넷 옵션] 개인정보<br>

								단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.<br><br>

								■ 개인정보에 관한 민원서비스<br><br>

								본원은 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.<br><br>

								■ 개인정보관리책임자 및 담당자의 연락처<br>
								회원님 께서는 본원의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다.<br>
								본원은 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br><br>

								개인정보 관리책임자 및 개인정보 관리담당자<br>
								이름 : 전준형<br>
								직위 : 이사<br>
								전화 : 02-3487-7582<br>
								메일 : gsmost@naver.com<br><br>

								기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br><br>

								- 개인분쟁조정위원회 (www.1336.or.kr / 1336)<br>
								- 정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4)<br>
								- 대검찰청 첨단범죄수사과 (http://www.spo.go.kr / 02-3480-2000)<br>
								- 경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330)<br>

								■ 기타<br>
								본원에 링크되어 있는 웹사이트들이 개인정보를 수집하는 행위에 대해서는 본 "강남그랜드안과 개인정보취급방침"이 적용되지 않음을 알려 드립니다.<br><br>

								■ 고지의 의무<br>
								현 개인정보취급방침 내용 추가, 삭제 및 수정이 있을 시에는 홈페이지의 '공지사항'을 통해 고지할 것입니다.<br><br>

								- 공고일자 : 2021년 2월 1일<br>
								- 시행일자 : 2021년 2월 1일<br>
							</div>
						</div>
						<div class="check_box">
							<input type="checkbox" id="agreeInfo">
							<label for="agreeInfo">개인정보 수집 및 활용 동의</label>
						</div>
					</div>
						<a href="javascript:void(0)" class="btn_apply">확인</a>
				</div>
			</div> 
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	
	<script type="text/javascript">

		$(document).ready(function(){
			
			if( Number(${board_idx}) != 0 ){
				
				this.prm = {};
				this.prm.board_idx = Number(${board_idx});
				
				$.ajax({
					url			: "/community/interface/communityList/${menu_code}"
					,data		: this.prm
					,type		: "POST"
					,success	: function(data){
						
						$('input[name="chk"][value="'+data.rows[0].board_cate_L+'"]').attr("checked",true);
						$('input[name="time"][value="'+data.rows[0].board_cate_M+'"]').attr("checked",true);
						$("#name").val(data.rows[0].board_reg_name);
						$("#birth").val(data.rows[0].birthday);
						$("#tel").val(data.rows[0].board_mobile);
						$("#title").val(data.rows[0].board_title);
						$("#cont").val(data.rows[0].board_detail.replaceAll("<br>",""));
						
						$("#agreeInfo").attr("checked",true);
						
					}
				});
			}
			
		});
	
		$(".btn_apply").on('click',function(){
			
			if( $("#agreeInfo").is(":checked") == false ){
				alert("개인정보 수집 및 활용에 동의하여야 상담 신청이 가능합니다.");
				return false;
			}
			
			if( $('input[name="time"]:checked').val() == undefined ){
				alert("상담 희망 시간을 체크 해주세요.");
				return false;
			}
			
			if( $('input[name="chk"]:checked').val() == undefined ){
				alert("상담 분야를 체크 해주세요.");
				return false;
			}
			
			if( $("#tel").val() =="" || $("#tel").val() ==null ){
				alert("핸드폰 번호를 입력 해주세요.");
				return false;
			}
			
			if( $("#name").val() =="" || $("#name").val() ==null ){
				alert("성함을 입력 해주세요.");
				return false;
			}
			
			if( $("#title").val() =="" || $("#title").val() ==null ){
				alert("제목을 입력 해주세요.");
				return false;
			}
			
			if( $("#pass").val() =="" || $("#pass").val() ==null || $("#pass").val().length < 4 ){
				alert("비밀번호 4자 이상 입력 해주세요.");
				return false;
			}
			
			var label = $('input[name="time"]:checked').prop("labels");
			
			this.prm = {};
			
			this.prm.board_title = $("#title").val();
			this.prm.board_reg_pass = $("#pass").val();
			this.prm.board_menu_code = "BD04";
			this.prm.board_useyn = "Y";
			this.prm.board_show = "Y";
			this.prm.board_reg_name = $("#name").val();
			this.prm.birthday = $("#birth").val();
			this.prm.board_mobile = $("#tel").val();
			this.prm.board_cate_L = $('input[name="chk"]:checked').val();
			this.prm.board_cate_M = $('input[name="time"]:checked').val(); //$(label).text();
			this.prm.board_detail = $("#cont").val();


			try {
				if (typeof sendGoogleAnalyticsEvent !== 'undefined') {
					sendGoogleAnalyticsEvent('conversion', '온라인 상담');
				}
			} catch (e) {
			}
			
			
			if( Number(${board_idx}) != 0 ){
				
				this.prm.board_idx = Number(${board_idx});
				
				$.ajax({
					url			: "/community/interface/updateBoard"
					,data		: this.prm
					,type		: "POST"
					,success	: function(data){
						
						if( data.result == 1 ){
							alert("수정이 완료됐습니다.");
							location.href="/community/counsel";
						}else{
							alert("에러가 발생 했습니다. 관리자에게 문의 해주세요.");
						}
					}
				})
			}else{
				$.ajax({
					url			: "/community/interface/insertBoard"
					,data		: this.prm
					,type		: "POST"
					,success	: function(data){
						if( data.resultMsg == "Y" ){
							alert("신청이 완료됐습니다.");
							location.reload();
						}else{
							alert("잠시 후 다시 실행해주시기 바랍니다.");
						}
					}
				})
			}
			
		});
		
	</script>
	
</body>
</html>
