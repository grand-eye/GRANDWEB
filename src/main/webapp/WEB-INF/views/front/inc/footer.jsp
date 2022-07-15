<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<footer class="footer sub_footer">
	<div class="wsize">
		<div class="mo_f_guide mo_show">
				<h4 class="mo_f_head">강남그랜드안과 안내</h4>
				<ul class="list-wrap">
					<li>
						<a href="/intro/info" onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '오시는 길')}} catch(e) {}">오시는 길</a>
					</li>
					<li>
						<a href="/community/counsel" onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '비용 상담 신청')}} catch(e) {}">비용 상담 신청</a>
					</li>
				</ul>
			</div>
			<div class="mo_f_sns mo_show">
				<h4 class="mo_f_head">강남그랜드안과 SNS</h4>
				<ul class="sns_item_box flex">
					<li class="sns_item youtube"><a href="https://www.youtube.com/channel/UC0xNBPgsEszoZ3QINqfcV4A" target="_blank"><img src="/common/img/common/icon_sns_youtube.png" alt="유투브">유투브</a></li>
					<li class="sns_item instargram"><a href="https://www.instagram.com/grandeye_official/" target="_blank"><img src="/common/img/common/icon_sns_instargram.png" alt="인스타그램">인스타그램</a></li>
					<li class="sns_item facebook"><a href="https://www.facebook.com/grandeye" target="_blank"><img src="/common/img/common/icon_sns_facebook.png" alt="페이스북">페이스북</a></li>
					<li class="sns_item naverblog"><a href="https://blog.naver.com/rmfosem3620" target="_blank"><img src="/common/img/common/icon_sns_blog.png" alt="네이버 블로그">네이버 블로그</a></li>
				</ul>
			</div>
			<div class="flex footer_menu_certi">
				<ul class="footer_menu flex">
					<li><a href="/terms">이용안내</a></li>
					<li><a href="/privacy">개인정보취급방침</a></li>
					<li><a href="/right">환자권리장전</a></li>
					<li><a href="/nonbenefit">비급여 공지</a></li>
					<li class="pc_show"><a href="/community/reservation" onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '온라인 예약')}} catch(e) {}">온라인 예약</a></li>
					<li class="pc_show"><a href="/community/notice">공지사항</a></li>
				</ul>
				<ul class="footer_certification flex pc_show">
					<li><a href="http://www.ophthalmology.org/" target="_blank"><img src="/common/img/main/icon_KOS.png" alt="대한안과학회"></a></li>
					<li><a href="http://www.mohw.go.kr/" target="_blank"><img src="/common/img/main/icon_MHWA.png" alt="보건복지부"></a></li>
					<li><a href="https://www.hira.or.kr/" target="_blank"><img src="/common/img/main/icon_reviewboard.png" alt="심평원"></a></li>
					<li><a href="http://www.kma.org/" target="_blank"><img src="/common/img/main/icon_KMA.png" alt="대한의사협회"></a></li>
				</ul>
			</div>
		<address>
				상호 : <span class="txt-white">강남그랜드안과의원</span> <span class="add_bar"></span> 대표 : 이관훈 외 1명 <span class="add_bar"></span> 사업자등록번호 : <span class="txt_num">401-93-19460</span> <span class="add_bar"></span> 
				주소 : 서울시 서초구 강남대로 363 강남타워 4층, 5층 <span class="add_bar"></span> 전화 : <span class="txt_num">02-3487-7582</span>
		</address>
		<p class="copyright">COPYRIGHT&copy 2021 <span class="txt_ko">강남그랜드안과</span> . ALL RIGHTS RESERVED.</p>

		
		<%-- <c:if test="${share_uri ne '/' && share_uri ne '/nonbenefit'}">
			<ul class="footer_sns flex">
				<li><a href="https://www.youtube.com/channel/UC0xNBPgsEszoZ3QINqfcV4A" target="_blank"><img src="/common/img/main/icon_youtube.png" alt="youtube"></a></li>
				<li><a href="https://www.instagram.com/grandeye_official/" target="_blank"><img src="/common/img/main/icon_sns_instargram.png" alt="instargram"></a></li>
				<li><a href="https://www.facebook.com/grandeye" target="_blank"><img src="/common/img/main/icon_sns_facebook.png" alt="facebook"></a></li>
				<li><a href="https://blog.naver.com/rmfosem3620" target="_blank"><img src="/common/img/main/icon_sns_blog.png" alt="blog"></a></li>
			</ul>
		</c:if> --%>
		
	</div>
</footer>
<%@ include file="/WEB-INF/views/front/inc/common_board_js.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$(".btn_quick_close").on('click',function(){
			$(".quick_box").hide();
			$(".btn_quick").show();
		});
		
		$(".btn_quick").on("click",function(){
			$(".btn_quick").hide();
			$(".quick_box").show();
		});
		
	});

	// 팝업 템플릿 - PU01
	commonTemplate(".popup-box", "PU01", "#popup_swiper_list", "banner_swiper01", ".banner_swiper", 'popup');
</script>
