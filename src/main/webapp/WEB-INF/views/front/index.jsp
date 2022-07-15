<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/front/inc/header.jsp"%>

<meta charset="UTF-8">
<title>강남그랜드안과</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, viewport-fit=cover">
</head>
<body>

	<%@ include file="/WEB-INF/views/front/inc/gnb.jsp"%>

	<main>
		<div class="main">
			<h2 class="hidden">메인 컨텐츠</h2>
			<div class="visual_swiper wsize">
				<div class="swiper-container">
					<div class="swiper-wrapper banner-box">
						
					</div>
					<div class="swiper-pagination mo_show"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>
			<div class="wsize">
				<div class="rolling flex_between">
					<div class="rolling_box notice">
						<div class="box_wrap flex">
							<div class="title">공지사항</div>
							<div class="rolling_swiper notice_swiper">
								<div class="swiper-container">
									<div class="swiper-wrapper notice-box"></div>
								</div>
							</div>
						</div>	
						<div class="right-cont">
							<a href="/community/notice" class="btn_arrow"></a>
						</div>
					</div>
					<div class="rolling_box media">
						<div class="box_wrap flex">
							<div class="title">미디어</div>
							<div class="rolling_swiper media_swiper">
								<div class="swiper-container">
									<div class="swiper-wrapper media-box"></div>
								</div>
							</div>
						</div>
						<div class="right-cont">
							<a href="/community/media" class="btn_arrow"></a>
						</div>
					</div>
				</div>
			</div>
	
			<section class="section sec_event">
				<h3 class="sec_title">특별한 이벤트</h3>
				<div class="event_swiper wsize">
					<div class="swiper-container">
						<div class="swiper-wrapper event-box"></div>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</section>
	
			<section class="section sec_tv">
				<div class="wsize flex_between">
					<div class="left_box">
						<span class="sec_grand">강남그랜드안과</span>
						<h3 class="sec_title">안물안궁 TV</h3>
						<p class="sec_desc">안 물어보고 안 궁금해도<br>눈에 대한 유용한 정보를 알려드립니다!</p>
						<a href="https://www.youtube.com/channel/UC0xNBPgsEszoZ3QINqfcV4A" target="_blank" class="btn_more pc_show" onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '더 보러가기')}} catch(e) {}">더 보러가기</a>
					</div>
					<div class="right_box">
						<div class="video_box">
							<div class="video">
								<iframe width="560" height="315" src="https://www.youtube.com/embed/LDFltPXx_Fo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</div>
						</div>
						<!--div class="img"><img src="/common/img/main/img_videoframe_g.png" alt="G"></div-->
						<a href="https://www.youtube.com/channel/UC0xNBPgsEszoZ3QINqfcV4A" class="btn_more mo_show" target="_blank"  onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '더 보러가기')}} catch(e) {}">더 보러가기</a>
					</div>
				</div>
			</section>
	
			<section class="section sec_special">
				<div class="special_swiper wsize">
					<div class="special_txt rel">
						<h3 class="sec_title">올바른 수술을 위한<br>정직한 약속</h3>
						
						<p class="sec_desc">
							강남그랜드안과는 수술 실명제를 통해<br class="mo_show">
							믿을 수 있는 수술을 보장합니다.<br class="mo_show">
							맞춤형 장비와 정확한 진단으로<br class="mo_show">
							보다 완성도 있는 결과를 이끌어냅니다.</p>
					</div>
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="/common/img/main/img_special_interior01.png" alt="강남그랜드안과 인테리어">
							</div>
							<div class="swiper-slide">
								<img src="/common/img/main/img_special_interior02.png" alt="강남그랜드안과 인테리어">
							</div>
							<div class="swiper-slide">
								<img src="/common/img/main/img_special_interior03.png" alt="강남그랜드안과 인테리어">
							</div>
						</div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div>
				</div>
			</section>
	
			<section class="section sec_review">
				<div class="wsize">
					<h3 class="sec_title">고객 체험기</h3>
					<p class="sec_desc">
						고객 체험기 열람은 의료법 56조에 의거하여 <br class="mo_show">
						개인 인증 절차 후 보실 수 있습니다.
					</p>
					<div class="review_swiper">
						<div class="swiper-container">
							<div class="swiper-wrapper review-box"></div>
						</div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div>
					<a href="/community/review" class="btn_more">더 보러가기</a>
				</div>
			</section>
	
			<section class="section sec_doctor wsize flex_between">
				<div class="left_box">
					<h3 class="sec_title">진심으로 다가가<br>실력으로 보여드리겠습니다.</h3>
					<div class="hero-img-wrap img-wrap mo_show">
						<img src="/common/img/main/img_doctor_mo.png" alt="인물">
					</div>
					<p class="sec_desc">
						정확하고 안전한 치료를 위해서는 고객 한 분, 한 분에게 맞춰진 진료와 
						그에 맞는 치료 계획이 세워져야 합니다.<br>
						이를 위해 저희 강남그랜드안과는 의료인의 기본 자세로 원칙을 지키기 
						위해 부단히 노력하며 지속적인 발전을 위해 연구하고 공부하겠습니다.
					</p>
					<div class="img-wrap mo_show">
						<img src="/common/img/main/img_award_mo.png" alt="상">
					</div>
					<a href="/intro/doctor" class="btn_more">더 보러가기</a>
					<div class="img pc_show"><img src="/common/img/main/img_award.png" alt="대한민국 굿닥터 100인 선정 2021 의료건강 사회공헌 대상"></div>
				</div>
				<div class="right_box pc_show"><img src="/common/img/main/img_doctor.png" alt="대표원장 이영섭 대표원장 이관훈"></div>
			</section>
	
			<section class="section sec_footer pc_show">
				<div class="sec_footer_inr  wsize flex_between ">
					<div class="left_box">
						<ul class="info_box">
							<li class="flex">
								<div class="img"><img src="/common/img/main/icon_call.png" alt="전화기"></div>
								<p class="title">수술 상담</p>
								<div class="cont"><em class="phone">02. 3487. 7582</em></div>
							</li>
							<li class="flex">
								<div class="img"><img src="/common/img/main/icon_kakaotalk.png" alt="카카오톡"></div>
								<p class="title">카톡 상담</p>
								<div class="cont kakao">카톡 아이디 검색에서<br><em class="grand">강남그랜드안과</em>를 검색하세요.</div>
							</li>
							<li class="flex">
								<div class="img"><img src="/common/img/main/icon_clock.png" alt="시계"></div>
								<p class="title">진료 시간</p>
								<div class="cont time">
									<div><span class="day">월 - 금</span>9 : 30 - 6 : 30</div>
									<div><span class="day">토요일</span>9 : 00 - 3 : 00</div>
								</div>
							</li>
						</ul>
						<div class="sns_box">
							<h4 class="sec_title02">강남그랜드안과 SNS</h4>
							<ul class="sns_item_box flex">
								<li class="sns_item youtube"><a href="https://www.youtube.com/channel/UC0xNBPgsEszoZ3QINqfcV4A" target="_blank"><img
										src="/common/img/common/icon_sns_youtube.png" alt="유투브">유투브</a></li>
								<li class="sns_item instargram"><a href="https://www.instagram.com/grandeye_official/" target="_blank"><img
										src="/common/img/common/icon_sns_instargram.png" alt="인스타그램">인스타그램</a></li>
								<li class="sns_item facebook"><a href="https://www.facebook.com/grandeye" target="_blank"><img
										src="/common/img/common/icon_sns_facebook.png" alt="페이스북">페이스북</a></li>
								<li class="sns_item naverblog"><a href="https://blog.naver.com/rmfosem3620" target="_blank"><img
										src="/common/img/common/icon_sns_blog.png" alt="네이버 블로그">네이버
										블로그</a></li>
							</ul>
						</div>
					</div>
					<div class="right_box">
						<div class="video">
							<iframe
								src="https://player.vimeo.com/video/558346060?title=0&byline=0&portrait=0"
								style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
								frameborder="0" allow="autoplay; fullscreen; picture-in-picture"
								allowfullscreen>
							</iframe>
							<!-- <iframe width="1280" height="720" src="https://www.youtube.com/embed/c-hGf7YxAvU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
						</div>
	
						<div class="apply_box">
							<h4 class="sec_title02">비용 상담 신청</h4>
							<div class="counsel_box">
								<div class="flex_between">
									<div class="input_box input_name flex">
										<label for="name">이름</label> <input type="text" id="name" maxlength="8">
									</div>
									<div class="input_box input_age flex">
										<label for="age">나이</label> <input type="number" id="age" maxlength="3" oninput="maxLengthCheck(this)">
									</div>
									<div class="input_box input_phone flex">
										<label for="phone">휴대폰</label> <input type="number" id="phone" maxlength="12" oninput="maxLengthCheck(this)">
									</div>
								</div>
								<div class="selectbox">
									<select class="checkup_list_title">
										<option val="">선택</option>
										<option val="RS01">노안 · 백내장</option>
										<option val="RS02">시력 교정</option>
										<option val="RS03">드림렌즈</option>
										<option val="RS04">안 질환</option>
										<option val="RS05">안 종합 검진</option>
									</select>
								</div>
								<div class="flex_between check_apply_box">
									<div class="check_box">
										<input type="checkbox" id="agree"> <label for="agree">개인정보
											수집 사용에 동의합니다.</label>
									</div>
									<a href="javascript:void(0)" class="btn_more apply" onclick="sendGoogleAnalyticsApply()">신청 하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>	
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp"%>

	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript" src="/common/js/jquery.tmpl.plus.js"></script>
	<script type="text/javascript">

		// 숫자 길이 체크 함수 
		function maxLengthCheck(object){
		   if (object.value.length > object.maxLength){
		     object.value = object.value.slice(0, object.maxLength);
		   }    
		}

		//메인 배너 오늘 하루 보지 않기 쿠키 GET
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

		//메인 배너 오늘 하루 보지 않기 쿠키 SET
		function setCookie(ename, cvalue, exdays) {
			var today = new Date();
			today.setTime(today.getTime() + (exdays * 12 * 60 * 60 * 1000));
			var expires = "expires" + today.toUTCString();

			document.cookie = ename + "=" + cvalue + "; " + expires;
		}

		function bannerClose() {
			setCookie("close", "Y", 1);
		}

		$(document).ready(function() {

					var cookieData = document.cookie;

					if (cookieData.indexOf("close=Y") > 0) {
						$(".top_banner").hide();
					} else {
						$(".top_banner").show();
					}

					$(".btn_banner_close").on('click', function() {
						bannerClose();
					});

					// 스와이퍼 템플릿
					// param - ( box, menu_code, template_id, swiper_prm, swiper_class, banner_yn )

					// 공지사항 템플릿 - BD01
					commonTemplate(".notice-box", "BD01", "#index_swiper_list",
							"rolling_swiper01", '.notice_swiper', 'N');
					// 미디어 템플릿 - BD02
					commonTemplate(".media-box", "BD02", "#index_swiper_list",
							"rolling_swiper02", '.media_swiper', 'N');
					// 이벤트 템플릿 - BD03
					commonTemplate(".event-box", "BD03", "#thumb_swiper_list",
							"thumbnail_swiper01", '.event_swiper', 'Y');
					// 고객 체험기 템플릿 - BD06
					commonTemplate(".review-box", "BD06", "#thumb_swiper_list",
							"thumbnail_swiper02", '.review_swiper', 'Y');
					// 배너 템플릿 - BD09
					commonTemplate(".banner-box", "BD09", "#banner_swiper_list",
							"thumbnail_swiper03", '.visual_swiper', 'main');
		});

		//apply_button_name, agree_button_name, title, menu_code
		applyAPI("apply", "agree", "비용 상담 신청", "BD11");
	</script>

<script>
	function sendGoogleAnalyticsApply(){
		var apply_button_name = "apply";
		var agree_button_name = "agree";
		var title = "비용 상담 신청";
		var menu_code = "BD11";
		
		if( $("#"+agree_button_name).is(":checked") == false && agree_button_name !=null){
			return false;
		}

		this.category = $(".checkup_list_title").attr("opt");

		this.prm = {};

		this.prm.board_reg_name = $("#name").val();
		this.prm.board_email = $("#email").val();
		this.prm.board_mobile = $("#phone").val();
		this.prm.board_title = title;
		this.prm.board_cate_L = "";
		this.prm.board_useyn = "Y";
		this.prm.board_show = "Y";
		this.prm.board_menu_code = menu_code;
		this.prm.board_detail = $("#cont").val();


		if( menu_code == "BD11" ){
			this.prm.board_cate_L = $("select option:selected").attr("val");
		}


		//상담 문의 - 나이
		if( menu_code == 'BD04'){
			this.prm.board_etc1 = $("#age").val();
		}

		//제안 제휴 - 회사명
		if( menu_code == 'BD08' ){
			this.prm.board_etc2 = $("#company").val();
		}

		//검사 신청
		var regExp = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
		var hangle =   /^[가-힣]+$/;
		var numValid = /[0-9]/;

		if(menu_code == "BD11"){
			var numLimit = $(".counsel_box").find("#phone").val().length;

			if( $(".checkup_list_title option:selected").attr("val") == ''){
				return false;
			}

			if( $(".counsel_box").find("#name").val() == "" || $(".counsel_box").find("#name").val() ==null ){
				return false;
			}

			if( $(".counsel_box").find("#age").val() == "" || $(".counsel_box").find("#age").val() ==null ){
				return false;
			}

			// numValid변수로 체크하면 - 가 들어가져서 숫자만 입력하는 로직을 이걸로 바꿈
			if( $(".counsel_box").find("#phone").val() == "" || $(".counsel_box").find("#phone").val() ==null ){
				return false;
			}

			if( !hangle.test( $(".counsel_box").find("#name").val() )) {
				return false;
			}

			if( numLimit < 10 ){
				return false;
			}

			if( !regExp.test($(".counsel_box").find("#phone").val())){
				return false;
			}

		}else if(menu_code == 'BD08'){	//제안 제휴 신청 값 체크
			var selectText = $(".select_box .select").html();

			//제휴 제안 만
			if(typeof selectText != "undefined"){
				if( selectText == '제휴 및 제안을 선택하세요.'){
					return false;
				}
			}

			if( $(".input_box #name").val() == "" || $(".input_box #name").val() ==null ){
				console.log($(".input_box #name").val());
				return false;
			}

			if( !hangle.test( $(".input_box #name").val() )) {
				return false;
			}

			if( $(".input_box #company").val() == "" || $(".input_box #company").val() ==null ){
				return false;
			}

			if( $(".input_box #phone").val() == "" || $(".input_box #name").val() ==null ){
				return false;

			}else if( !numValid.test( $(".input_box #phone").val() ) ){
				return false;
			}

			if( $(".input_box #email").val() == "" || $(".input_box #email").val() ==null ){
				return false;
			}

			if( $(".input_box #cont").val() == "" || $(".input_box #cont").val() ==null ){
				return false;
			}

		}else{
			if( $(".checkup_list_title").attr("opt") == ''){
				return false;
			}

			if( $(".name_box input").val() == "" || $(".name_box input").val() ==null ){
				return false;
			}

			if( !hangle.test( $(".name_box input").val() )) {
				return false;
			}

			if( $(".years_box input").val() == "" || $(".years_box input").val() ==null ){
				return false;
			}

			if( $(".num_box input").val() == "" || $(".num_box input").val() ==null ){
				return false;

			}else if( !numValid.test( $(".num_box input").val() ) ){
				return false;
			}
		}


		try {
			if (typeof sendGoogleAnalyticsEvent !== 'undefined') {
				sendGoogleAnalyticsEvent('conversion', '메인 - 신청하기')
			}
		} catch (e) {
		}
	}

</script>
</body>
</html>