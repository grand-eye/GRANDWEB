<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<header class="header">
		<div class="top_banner">
			<div class="banner_swiper">
				<div class="swiper-container">
					<div class="swiper-wrapper popup-box">
						
					</div>
				</div>
				<div class="swiper-pagination mo_show"></div>
				<div class="swiper-btn-wrap">
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				<div class="close-wrap wsize">
					<button type="button" class="btn_banner_close pc_show">오늘 하루 보지 않기</button>
					<a class="btn_banner_close_mo mo_show" href="javascript:void(0)"><img src="/common/img/main/btn_banner_close_mo.png" alt="mo_banner_x"></a>
				</div>
			</div>
		</div>
		<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />

		<!-- <div class="pc_menu wsize navQuick"> -->
		<div class="pc_menu wsize">
			<div class="top flex_between">
				<div class="flex">
					<h1 class="logo"><a href="/"></a></h1>
					<div class="img"><img src="/common/img/main/img_main_ex500.png" alt="강남 유일 2021년형 최신형 레이저! NEW EX500 WHITE"></div>
				</div>
				<ul class="user_box flex">
				<c:choose>
					<c:when test="${sessionScope.GRAND_USER_ID == '' || sessionScope.GRAND_USER_ID == NULL}">
						<li class="user_join"><a href="/user/join_terms">회원가입</a></li>
						<li class="user_login"><a href="/user/login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<!-- <li class="user_join"><a href="/user/mypage">마이페이지</a></li> -->
						<li class="user_login"><a href="/user/interface/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				</ul>
			</div>
				
			<nav>
				<ul class="gnb flex_between">
					<c:if test="${fn:length(gnbData) > 0}">
						<c:forEach var="item" items="${gnbData}" varStatus="status">
							<li class="gnb_depth01_box">
								<a href="${item.tm_url}" class="gnb_depth01"><span>${item.tm_name}</span></a>
								<ul class="gnb_depth02_box">
									<c:if test="${fn:length(item.children) > 0}">
										<c:forEach var="subMnu" items="${item.children}" varStatus="subIndex">
											<li><a class="gnb_depth02" href="${subMnu.tm_url}"
													<c:if test="${subMnu.tm_name == '온라인 상담'}">
														onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '온라인 상담')}} catch(e) {}"
													</c:if>
											>${subMnu.tm_name}</a></li>
										</c:forEach>
									</c:if>
								</ul>
							</li>
						</c:forEach>                     
					</c:if>
				</ul>
			</nav>
		</div>
		
		<!--  = 모바일 메뉴 = -->
		<div class="mo_menu">
			<div class="mo_menu_wrap mpadl">
				<h1 class="logo_mo">
					<a href="/"><img src="/common/img/main/h_logo_m.png" alt="logo_m"></a>
				</h1>
				<button class="mo_menu_btn" type="button"></button>
			</div>
			<div class="mo_gnb_wrap">
				<div class="mo_gnb">
				
					<ul class="gnb_list">
						<c:if test="${fn:length(gnbData) > 0}">
							<c:forEach var="item" items="${gnbData}" varStatus="status">
								<li>
									<a href="javascript:void(0)" class="gnb_depth01"><span>${item.tm_name}</span></a>
									<ul class="gnb-depth02">
										<c:if test="${fn:length(item.children) > 0}">
											<c:forEach var="subMnu" items="${item.children}" varStatus="subIndex">
												<li><a href="${subMnu.tm_url}"
														<c:if test="${subMnu.tm_name == '온라인 상담'}">
															onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '온라인 상담')}} catch(e) {}"
														</c:if>
												>${subMnu.tm_name}</a></li>
											</c:forEach>
										</c:if>
									</ul>
								</li>
							</c:forEach>                     
						</c:if>
					</ul>
					
					<ul class="extra_menu">
						<c:choose>
							<c:when test="${sessionScope.GRAND_USER_ID == '' || sessionScope.GRAND_USER_ID == NULL}">
								<li class="user_join"><a href="/user/join_terms">회원가입</a></li>
								<li class="user_login"><a href="/user/login">로그인</a></li>
							</c:when>
							<c:otherwise>
								<!-- <li class="user_login"><a href="/user/mypage">마이페이지</a></li> -->
								<li class="user_login"><a href="/user/interface/logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="/nonbenefit">비급여 진료비 안내</a></li>
					</ul>
					
				</div>
			</div>
		</div>
		
		<div class="mo_quick_wrap">
			<ul class="mo_quick">
				<li>
					<a class="img-wrap" href="https://pf.kakao.com/_xouxkNK">
						<img src="/common/img/common/icon_quick_c.png" alt="">
					</a>
					<a href="https://pf.kakao.com/_xouxkNK" target="_blank"  onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '실시간 상담')}} catch(e) {}">실시간 상담</a>
				</li>
				<li>
					<a class="img-wrap" href="/community/reservation">
						<img src="/common/img/common/icon_quick_r.png" alt="">
					</a>
					<a href="/community/reservation">예약</a>
				</li>
				<li>
					<a class="img-wrap" href="tel:0234877582">
						<img src="/common/img/common/icon_quick_call.png" alt="">
					</a>
					<a href="tel:0234877582" onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '전화하기')}} catch(e) {}">전화하기</a>
				</li>
			</ul>
		</div>
		<a class="top_btn" href="#"><img src="/common/img/common/icon_top_btn.png" alt="탑버튼"></a>

		<c:if test="${path !='/' && path.indexOf('user') < 1}"> 
			<div class="snb wsize">
				<div class="flex">
					<div class="snb_item"><a href="javascript:void(0)">${share_title}</a></div>
					<div class="snb_arrow">&gt;</div>
					<div class="snb_item"><a href="javascript:void(0)">${share_desc}</a></div>
				</div>
			</div>
		</c:if>


		<div class="quick_wrap">
			<div class="quick_box open">
				<ul class="quick_box_inr">
					<li>
						<a href="/community/reservation">
							<div><img src="/common/img/common/btn_quick_reservation.png" alt="달력"></div>
							<p class="txt">검사 예약</p>
						</a>
					</li>
					<li>
						<a href="/community/event"  onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '이벤트')}} catch(e) {}">
							<div><img src="/common/img/common/btn_quick_event.png" alt="별"></div>
							<p class="txt">이벤트</p>
						</a>
					</li>
					<li>
						<a href="https://pf.kakao.com/_xouxkNK" target="_blank" onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '실시간 상담')}} catch(e) {}">
							<div><img src="/common/img/common/btn_quick_counsel.png" alt="카카오톡"></div>
							<p class="txt">실시간 상담</p>
						</a>
					</li>
					<li>
						<a href="/intro/info"  onclick="try {if(typeof sendGoogleAnalyticsEvent !== 'undefined') { sendGoogleAnalyticsEvent('click', '오시는 길')}} catch(e) {}">
							<div><img src="/common/img/common/btn_quick_location.png" alt="위치 표시"></div>
							<p class="txt">오시는 길</p>
						</a>
					</li>
					<li>
						<a href="javascript:void(0)" class="btn_top">
							<img src="/common/img/common/btn_top.png" alt="top 버튼">
						</a>
					</li>
				</ul>
				<button type="button" class="btn_quick_close"><img src="/common/img/common/btn_quick_close.png" alt="닫기 버튼"></button>
			</div>
			<button type="button" class="btn_quick active"></button>
		</div>
		
		<!--  = 모바일 메뉴 끝 = -->
	</header>