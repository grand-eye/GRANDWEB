<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
		<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub">
			<h2 class="hidden">위치 및 진료 안내</h2> 

			<!-- 진료 시간 안내 -->
			<div class="info_hours">
				<h3 class="sub_title">진료 시간 안내</h3>
				<div class="sub_visual flex mt45">본원의 진료 시스템은 <br>100% 사전 예약제로 운영됩니다.</div>
				<div class="sub_txt_bar_brown">전화나 인터넷을 통해 반드시 예약 후 내원해 주시기 바랍니다.</div>
				<div class="wsize">
					<ul class="hours_reservation_box flex">
						<li class="reser_box">
							<a href="/community/reservation">
								<div class="item_top"></div>
								<p>온라인 예약하기</p>
								<div class="btn_link"></div>
							</a>
						</li>
						<li class="couns_box">
							<a href="/community/counsel">
								<div class="item_top"></div>
								<p>온라인 상담하기</p>
								<div class="btn_link"></div>
							</a>
						</li>
					</ul>

					<div class="hours_wrap flex_between">
						<div class="hours_box">
							<h4 class="sub_title03">진료 시간 안내</h4>
							<table class="table_info mt25">
								<thead>
									<tr>
										<th>요일</th>
										<th>진료 시간</th>
										<th>점심 시간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>월 <span class="bar"></span> 금</td>
										<td><span class="ls0">09 : 30</span> <span class="bar"></span> <span class="ls0">18 : 30</span></td>
										<td><span class="ls0">13 : 00</span> <span class="bar"></span> <span class="ls0">14 : 00</span></td>
									</tr>
									<tr>
										<td class="fc_blue">토요일</td>
										<td><span class="ls0">09 : 00</span> <span class="bar"></span> <span class="ls0">15 : 00</span></td>
										<td>없음</td>
									</tr>
									<tr>
										<td class="fc_orange">수요일 &middot; 일요일</td>
										<td colspan="2">휴진</td>
									</tr>
								</tbody>
							</table>	 
						</div>
						<div class="hours_box">
							<h4 class="sub_title03">고객 상담 안내</h4>
							<table class="table_info sc_table_info mt25">
								<thead>
									<tr>
										<th>요일</th>
										<th>진료 시간</th>
										<th>점심 시간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>월 <span class="bar"></span> 금</td>
										<td><span class="ls0">09 : 30</span> <span class="bar"></span> <span class="ls0">18 : 30</span></td>
										<td><span class="ls0">13 : 00</span> <span class="bar"></span> <span class="ls0">14 : 00</span></td>
									</tr>
									<tr>
										<td class="fc_blue">토요일</td>
										<td><span class="ls0">09 : 00</span> <span class="bar"></span> 15 : 00</span></td>
										<td>없음</td>
									</tr>
								</tbody>
							</table>	
							<div class="info_tel">문의 전화&nbsp;&nbsp;&nbsp;&nbsp;ㅣ<span>&nbsp;&nbsp;02. 3487. 7582</span></div>
						</div>
					</div>
					<div class="notice-wrap">
						<h4 class="sub_title03">대기 시간 지연에 따른 안내</h4>
						<ul class="list_box mt25">
							<li>개인의 진료내용에 따라 추가적인 검사가 필요할 수 있으며, 검사 시간이 길어질 수 있습니다.</li>
							<li>또한 진료 중에도 다른 고객들의 추가적인 검사들을 시행하기도 하여 이로 인해 본인의 검사 및 진료와는 상관 없이 대기하는 시간이 길어질 수 있으므로 예약을 하고 오셨다 하더라도 깊은 양해를 부탁 드립니다.</li>
							<li>특히, 보통 산동은 30분 정도의 시간이 필요하며, 산동 후에는 잘 보이지 않게 되므로 자가운전을 하실 수 없사오니 가급적 보호자를 동반하여 주시기 바랍니다.</li>
						</ul>
					</div>
				</div>
			</div>
			<!--// 진료 시간 안내 -->

			<!-- 찾아 오시는 길 -->
			<div class="info_loca mt200 wsize">
				<h3 class="sub_title">찾아 오시는 길</h3>
				<p class="sub_desc mpads">강남역 5번 출구 바로 앞에 위치하여 어느 지역에서든 쉽고 빠르게 찾아오실 수 있습니다.</p>
				<div class="info_loca_inr flex_between">
					<div class="loca_txt_box">
						<h4 class="sub_title03">서울 서초구 강남대로 <br>363 강남타워 4 &middot; 5층</h4>
						<p class="mt25">2호선 &middot; 분당선 ㅣ 강남역 5번 출구 바로 앞</p>
						<ul class="map_btn_box mt25">
							<li class="naver_map"><a href="https://map.naver.com/v5/search/%EA%B0%95%EB%82%A8%EA%B7%B8%EB%9E%9C%EB%93%9C%EC%95%88%EA%B3%BC/place/1792262440?c=14140278.7691074,4508346.0882465,15,0,0,0,dh">네이버 길 찾기</a></li>
							<li class="kakao_map"><a href="https://map.kakao.com/">카카오 길 찾기</a></li>
							<!-- <li class="mobile_map"><a href="javascript:void(0)">모바일 약도 전송</a></li> -->
						</ul>
						<div class="loca_parking_info pc_show">
							<h4 class="sub_title03">주차 안내</h4>
							<ul class="list_box mt25">
								<li>병원 주차장(제 1 주차장)은 기계식 주차장으로 차량에 제한이 있습니다.</li>
								<li>차체가 높거나 긴 차량은 병원 인근 제 2 주차장을 이용 바랍니다.</li>
							</ul>
						</div>
					</div>
					<div class="loca_map_box">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.5445492068266!2d127.02625121558695!3d37.49507283597469!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca1bb4aba4493%3A0xe29f1c099149bfcc!2z6rCV64Ko6re4656c65Oc7JWI6rO8!5e0!3m2!1sko!2skr!4v1620800454139!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
					</div>
				</div>
			</div>

			<div class="info_parking flex_between wsize">
				<div class="park_info">
					<h4 class="sub_title03">주차 제한 차량 안내</h4>
					<ul class="list_box mt25">
						<li>
							<div><span class="title">제 1 주차장 (본원)</span> ㅣ <span class="fc_orange02">일반 승용차</span></div>
						</li>
						<li>
							<div><span class="title">제 2 주차장</span> ㅣ <span class="fc_blue02">SUV 및 대형 승합차</span></div>
							<div class="addr">주소 ㅣ 서울시 서초구 서초대로 78길 28</div>	
						</li>
					</ul>
				</div>
				<ul class="park_table">
					<li class="flex">
						<div class="title">경차</div>
						<div class="cont">레이</div>
					</li>
					<li class="flex">
						<div class="title">승용차</div>
						<div class="cont">에쿠스, 체어맨 등</div>
					</li>
					<li class="flex">
						<div class="title">RV&middot;SUV</div>
						<div class="cont">카니발, 베라크루즈, 갤로퍼, 무쏘, 테라칸, 렉스턴, 엑티온, 모하비, QM-5, 코란도, 싼타페, 스포티지, 올란도, 윈스톰, 쏘렌토, 투싼, 레조, 카렌스,캡티바, 카스타, 라비타</div>
					</li>
					<li class="flex">
						<div class="title">승합차</div>
						<div class="cont">스타렉스, 로디우스, 그레이스, 다마스, 봉고, X-TREX, 트라제XG, 화물차</div>
					</li>
				</ul>
			</div>
	
			<div class="info_subway wsize flex">
				<h4 class="sub_title03">지하철 이용 시</h4>
				<div class="txt01 flex">
					<span class="txt">신분당</span> <span class="num">2</span> 강남역
					<span class="icon_person"></span>5번 출구 <span class="fc_orange"> 도보 1분</span>
				</div>
			</div>
			<!--// 찾아 오시는 길 -->
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
</body>
</html>