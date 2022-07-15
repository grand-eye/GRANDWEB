<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
	<header class="header">
		<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	</header>
	<main>
		<div class="sub prebyopia__care">
			<h2 class="sub_title">수술 전 &middot; 후 주의사항</h2>
			<p class="sub_desc02 pres_care_desc">검사 전 &middot; 수술 전 &middot; 수술 후 관리가 중요합니다.</p>
			<div class="bg_brown_light care_list_wrap">
				<div class="wsize02">
					<h3 class="sub_title06"># 수술 전</h3>
					<ul class="care_list">
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_before_img01.png" alt="약 복용 가능"></div>
							<div class="txt_box">
								<h4 class="title">약 복용 가능</h4>
								<p class="desc_default">내과적 질환 (당뇨&middot;고혈압)으로 약을 복용하시는 분은 수술과 상관없이<br> 당일에도 약복용을 해야하며 본원 내원시에도 약을 가지고 오셔야 합니다.</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_before_img02.png" alt="금주"></div>
							<div class="txt_box">
								<h4 class="title">금주</h4>
								<p class="desc_default">수술은 수술 3일 전부터 금해주셔야 합니다.</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_before_img03.png" alt="깨끗한 세안 (목욕)"></div>
							<div class="txt_box">
								<h4 class="title">깨끗한 세안 (목욕)</h4>
								<p class="desc_default">수술 후 4일 동안은 세수, 머리감기를 하지 못하니 수술 전 미리 깨끗하게 세안(목욕)을 하시고 오기 바랍니다.</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_before_img04.png" alt="운전 시 보호자 동반"></div>
							<div class="txt_box">
								<h4 class="title">운전 시 보호자 동반</h4>
								<p class="desc_default">수술 당일날에는 직접 운전하지 마시고 반드시 보호자와 함께 오시기 바랍니다.</p>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div class="bg_blue_light care_list_wrap">
				<div class="wsize02">
					<h3 class="sub_title06"># 수술 후</h3>
					<ul class="care_list">
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_after_img01.png" alt="손 대지 마세요"></div>
							<div class="txt_box">
								<h4 class="title">손 대지 마세요.</h4>
								<p class="desc_default">수술 후 4주간 손으로 비비거나 누르거나 만지지 않도록 주의하셔야 합니다.</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_after_img02.png" alt="보호 안대 착용"></div>
							<div class="txt_box">
								<h4 class="title">보호 안대 착용</h4>
								<p class="desc_default">수술 후 2주 동안은 주무실 때 <span class="fc_orange">반드시 보호 안대를 착용</span>하셔야 합니다.<br>엎드려 주무시는 건 피해주시기 바랍니다.</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_after_img03.png" alt="물이 들어가지 않도록 주의"></div>
							<div class="txt_box">
								<h4 class="title">7일 동안 눈에 물이 들어가지 않도록 주의</h4>
								<p class="desc_default">
									<span class="date">수술 당일 가능</span>ㅣ 목 아래 샤워 <br>
									<span class="date">수술 4일 뒤 가능 </span>ㅣ 세안 / 머리 감기 <br>
									<span class="date">수술 4주 뒤 가능</span>ㅣ 목욕탕 / 찜질방 / 사우나 (감염될 수 있음)
								</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_after_img04.png" alt="화장 파마 염색"></div>
							<div class="txt_box">
								<h4 class="title">화장&middot;파마&middot;염색</h4>
								<p class="desc_default">
									<span class="date">수술 4일 뒤 가능</span>ㅣ 피부 화장 <br>
									<span class="date">수술 2주 뒤 가능 </span>ㅣ 눈 화장 <br>
									<span class="date">수술 4주 뒤 가능</span>ㅣ 파마 / 염색
								</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_after_img05.png" alt="흡연 음주"></div>
							<div class="txt_box">
								<h4 class="title">흡연&middot;음주</h4>
								<p class="desc_default">
									<span class="date">수술 7일 뒤 가능</span>ㅣ 흡연 <br>
									<span class="date">수술 4주 뒤 가능</span>ㅣ 음주 ( 과음은 피해주세요. )
								</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_after_img06.png" alt="야간 운전 삼가"></div>
							<div class="txt_box">
								<h4 class="title">2주간 야간 운전 삼가해주세요.</h4>
								<p class="desc_default">장시간 운전 및 초행길 등 야간 운전은 피하셔야 합니다.<br>
								수술 후 3~6개월 동안은 야간 빛 번짐 (눈부심) 현상이 나타날 수 있습니다.</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_after_img07.png" alt="가벼운 운동"></div>
							<div class="txt_box">
								<h4 class="title">가벼운 운동</h4>
								<p class="desc_default">
									<span class="date">수술 뒤 바로 가능</span>ㅣ 걷기<br>
									<span class="date">수술 4주 뒤 가능</span>ㅣ 헬스 / 요가 / 수영 등 무리한 운동
								</p>
							</div>
						</li>
						<li class="flex">
							<div class="img_box"><img src="/common/img/sub/pres_care_after_img08.png" alt="외부 충격 주의"></div>
							<div class="txt_box">
								<h4 class="title">4주 동안 외부 충격 주의</h4>
								<p class="desc_default">수술 후 4주 동안은 눈을 비비지 않도록 주의하셔야합니다.<br>
								또한 부딪히거나 다치지 않도록 주의해주세요.
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div class="care_after_info wsize02">
				<h3 class="sub_title06"># 백내장 수술 후 증상</h3>
				<ul class="list_box03">
					<li>수술 후 머리를 심하게 움직이거나 눈에 힘이 들어가는 자세(몸을 구부리거나, 무거운 물건을 드는 일 등) 또는 눈을 비비는 등의 행동은 합병증이 생길 우려가 있으므로 4주 정도는 주의해 주시기 바랍니다. </li>
					<li><span class="fc_orange">수술 후 시력 저하, 안통, 심한 충혈이 있을 때는 반드시 병원으로 내원</span>하여 주시기 바라며, 본원으로 오시기 어려울 경우<br> 가까운 안과 응급실로 가시기 바랍니다.</li>
				</ul>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
</body>
</html>