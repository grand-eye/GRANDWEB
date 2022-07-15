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
		<div class="sub revision__care">
			<h2 class="sub_title">수술 전 &middot; 후 주의사항</h2>
			<p class="sub_desc02 pres_care_desc rv-care-desc">검사 전 &middot; 수술 전 &middot; 수술 후 관리가 중요합니다.</p>
			<div class="notandum_wrap page-wrap"><!-- 수술주의사항 -->
				<ul class="sub_tab_menu flex wsize">
					<li rel="lasikTab" class="active">원데이 라식</li>
					<li rel="lasekTab">투데이 라섹</li>
					<li rel="clearSmileLasikTab" style="width:161px;">클리어뷰 스마일 라식</li>
					<li rel="implantTab">렌즈 삽입술</li>
					<li rel="dreamTab">드림렌즈</li>
				</ul>
				<div class="tab_contents mt45">
					<!-- 라식 -->
					<div id="lasikTab" class="tab" style="display:block;">
						<div class="bg_brown_light care_list_wrap">
							<div class="wsize02">
								<h3 class="sub_title06"># 수술 전</h3>
								<ul class="care_list">
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik01.png" alt="notandum1"></div>
										<div class="txt_box">
											<h4 class="title">렌즈 착용 금지</h4>
											<div class="desc_default desc-list">
												<p><span class="date">소프트렌즈</span>ㅣ 7일</p>
												<p><span class="date">하드렌즈 (RGP)</span>ㅣ 14일</p>
												<p><span class="date">난시용 소프트렌즈</span>ㅣ 14일</p>
												<p><span class="date">드림렌즈</span>ㅣ 1개월</p>
											</div>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik02.png" alt="notandum2"></div>
										<div class="txt_box">
											<h4 class="title">검사 당일 자가 운전 금지</h4>
											<p class="desc_default">
												망막검사 후 근거리 시력이 불편해지며 눈부심 때문에 자가운전이 불가합니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik03.png" alt="notandum3"></div>
										<div class="txt_box">
											<h4 class="title">임산부 검사 및 수술 불가능</h4>
											<p class="desc_default">
												임신 중에는 호르몬의 변화에 따른 영향으로 검사 및 수술을 권유드리지 않습니다. <br>
												출산 후 3개월 이후부터 가능하며 모유수유가 끝난 후 검사 및 수술 받으시는 것을 <br>
												권유드립니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik04.png" alt="notandum4"></div>
										<div class="txt_box">
											<h4 class="title">안질환 있는 경우 </h4>
											<p class="desc_default">
												안질환이 의심되거나 이미 진행된 경우에는 검사 진행이 불가합니다.
											</p>
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
										<div class="img_box">
											<img src="/common/img/sub/rv_care_lasik_after01.png" alt="after_notandum01">
										</div>
										<div class="txt_box">
											<h4 class="title">TV·컴퓨터·핸드폰</h4>
											<p class="desc_default">
												수술 후 어지러울 수 있으니 <span class="fc_orange">바로 귀가</span>하시는 것이 좋으며, 4~5시간 정도 시림, 눈물, <br>
												이물감으로 눈뜨기 불편하실 수 있습니다. 가능한 눈을 감고 쉬시고 TV, 컴퓨터, 스마트폰을 <br>
												삼가하여 주십시오. 수술 기계 압력으로 실 핏줄이 터져 <span class="fc_orange">충혈 및 피멍</span>이 드는 경우가 있으나, <br>
												시력과는 무관하며, 특별한 치료없이 1~3주 정도 지나면 <span class="fc_orange">자연 호전</span>됩니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box">
											<img src="/common/img/sub/pres_care_after_img02.png" alt="after_notandum02">
										</div>
										<div class="txt_box">
											<h4 class="title">보호 안대 착용</h4>
											<p class="desc_default">
												수술 후 2주 동안은 주무실 때 <span class="fc_orange">반드시 보호 안대를 착용</span>
												하셔야 합니다. <br>
												각막 절편의 주름이 생길 수 있으니 <span class="fc_orange">2주 정도는 눈을 세게 감거나, 
												비비지 않도록 주의</span>하여 주십시오. 
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img03.png" alt="after_notandum03"></div>
										<div class="txt_box">
											<h4 class="title">3일 동안 눈에 물이 들어가지 않도록 주의</h4>
											<p class="desc_default days">
												<span class="date">수술 당일 가능</span>ㅣ 목 아래 샤워  / 뒤로 머리 감기<br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 목욕탕 / 찜질방 / 사우나 
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img04.png" alt="after_notandum04"></div>
										<div class="txt_box">
											<h4 class="title">화장&middot;파마&middot;염색</h4>
											<p class="desc_default">
												<span class="date">수술 3일 뒤 가능 </span>ㅣ 피부 화장 <br>
												<span class="date">수술 2주 뒤 가능 </span>ㅣ 눈 화장 <br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 파마 / 염색
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik_after05.png" alt="after_notandum05"></div>
										<div class="txt_box">
											<h4 class="title">흡연&middot;음주</h4>
											<p class="desc_default days">
												<span class="date">수술 7일 뒤 가능</span>ㅣ 흡연 <br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 음주 ( 과음은 피해주세요. )
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik_after06.png" alt="after_notandum06"></div>
										<div class="txt_box">
											<h4 class="title">2주간 과도한 업무</h4>
											<p class="desc_default">
												수술 후 2주간은 과도한 독서, 밤샘 작업을 피해 주십시오. <br>
												과한 업무는 건조증이 유발될 수 있으니 인공눈물을 넣어주십시오.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img07.png" alt="after_notandum07"></div>
										<div>
											<h4 class="title">가벼운 운동</h4>
											<p class="desc_default exercise">
												<span class="date">수술 1~2주 뒤 바로 가능</span>ㅣ 걷기  / 가벼운 조깅<br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 헬스 / 요가 / 수영 등 무리한 운동
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img06.png" alt="외부 충격 주의"></div>
										<div class="txt_box">
											<h4 class="title">운전</h4>
											<p class="desc_default">
												수술 후 회복 초기인  2 ~3주는 장시간 운전 및 초행길 등 야간 운전이 <br>
												불편할 수 있습니다.
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="care_after_info wsize02">
							<h3 class="sub_title06"># 안약 사용법</h3>
							<ul class="list_box03">
								<li>
									<span class="fc_orange">수술 당일은 낮잠 주무시지 마세요.</span>
								</li>
								<li>
									모든 안약은 순서 상관없이 1~2분 간격으로 점안해주세요. 주무시는 동안은 점안하지 않으셔도 됩니다.
								</li>
								<li>
									<span class="fc_orange">인공 눈물은 수술 당일 10~20분 간격으로 자주 점안해주세요. 건조하면 주름이 생길 가능성이 높습니다.</span>
								</li>
							</ul>
						</div>
					</div>
					<!-- //라식 -->
					<!-- 라섹 -->
					<div id="lasekTab" class="tab">
						<div class="bg_brown_light care_list_wrap">
							<div class="wsize02">
								<h3 class="sub_title06"># 수술 전</h3>
								<ul class="care_list">
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik01.png" alt="notandum1"></div>
										<div class="txt_box">
											<h4 class="title">렌즈 착용 금지</h4>
											<div class="desc_default desc-list">
												<p><span class="date">소프트렌즈</span>ㅣ 7일</p>
												<p><span class="date">하드렌즈 (RGP)</span>ㅣ 14일</p>
												<p><span class="date">난시용 소프트렌즈</span>ㅣ 14일</p>
												<p><span class="date">드림렌즈</span>ㅣ 1개월</p>
											</div>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik02.png" alt="notandum2"></div>
										<div class="txt_box">
											<h4 class="title">검사 당일 자가 운전 금지</h4>
											<p class="desc_default">
												망막검사 후 근거리 시력이 불편해지며 눈부심 때문에 자가운전이 불가합니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik03.png" alt="notandum3"></div>
										<div class="txt_box">
											<h4 class="title">임산부 검사 및 수술 불가능</h4>
											<p class="desc_default">
												임신 중에는 호르몬의 변화에 따른 영향으로 검사 및 수술을 권유드리지 않습니다. <br>
												출산 후 3개월 이후부터 가능하며 모유수유가 끝난 후 검사 및 수술 받으시는 것을 <br>
												권유드립니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik04.png" alt="notandum4"></div>
										<div class="txt_box">
											<h4 class="title">안질환 있는 경우 </h4>
											<p class="desc_default">
												안질환이 의심되거나 이미 진행된 경우에는 검사 진행이 불가합니다.
											</p>
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
										<div class="img_box">
											<img src="/common/img/sub/rv_care_lasek_after01.png" alt="after_notandum01">
										</div>
										<div class="txt_box">
											<h4 class="title">보호 렌즈 착용</h4>
											<p class="desc_default">
												수술 후 어지러울 수 있으니 <span class="fc_orange">바로 귀가</span>하시는 것이 좋으며, <span class="fc_orange">1~3일 정도 시림, 눈물, 이물감</span>으로  <br>
												눈뜨기 불편하실 수 있습니다. 가능한 눈을 감고 쉬시고 TV, 컴퓨터, 스마트폰을 삼가하여 <br>
												주십시오. 사람의 체질에 따라 두통이 따르는 경우가 있으니, 심하면 두통약을 드셔도 됩니다. <br>
												<span class="fc_orange">수술 후 보호 렌즈를 착용</span>하며, 착용 동안에는 뿌옇고 선명하지 않을 수 있습니다. <br>
												렌즈가 빠졌을 경우, 본원으로 전화 후 바로 내원하시거나 근처 병원에서  새 렌즈로 <br>
												교체해 주세요.    ※ 타병원 진료 시 비보험 적용되며 진료비가 청구됩니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box">
											<img src="/common/img/sub/pres_care_after_img02.png" alt="after_notandum02">
										</div>
										<div class="txt_box">
											<h4 class="title">보호 안대 착용</h4>
											<p class="desc_default">
												수술 후 2주 동안은 주무실 때 <span class="fc_orange">반드시 보호 안대를 착용</span>
												하셔야 합니다. <br>
												<span class="fc_orange">2주 정도는 눈을 세게 감거나, 비비지 않도록 주의</span>하여 주십시오. 
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img03.png" alt="after_notandum03"></div>
										<div class="txt_box">
											<h4 class="title">보호 렌즈 착용 기간동안 주의</h4>
											<p class="desc_default days">
												<span class="date">수술 당일 가능</span>ㅣ 목 아래 샤워  / 뒤로 머리 감기<br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 목욕탕 / 찜질방 / 사우나 
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img04.png" alt="after_notandum04"></div>
										<div class="txt_box">
											<h4 class="title">화장&middot;파마&middot;염색</h4>
											<p class="desc_default">
												<span class="date">보호렌즈 제거 후 </span>ㅣ 피부 화장 <br>
												<span class="date">수술 3주 뒤 가능 </span>ㅣ 눈 화장 <br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 파마 / 염색
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik_after05.png" alt="after_notandum05"></div>
										<div class="txt_box">
											<h4 class="title">흡연&middot;음주</h4>
											<p class="desc_default days">
												<span class="date">수술 1주일간 </span>ㅣ 금연 / 금주 <br>
												<span class="list-dot"></span> 수술  4주일간 과도한 음주는 피해주십시오.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik_after06.png" alt="after_notandum06"></div>
										<div class="txt_box">
											<h4 class="title">2~3주간 과도한 업무 </h4>
											<p class="desc_default">
												일상생활이 가능한 시력 회복은 보호 렌즈 제거 후 1~2주 정도 소요되며, 시력이 안정 <br>
												되기까지는 6개월 이상 걸릴 수 있습니다.  수술 후 2~3주간은 과도한 독서, 밤샘 작업을 <br>
												피해 주십시오. 과한 업무는 건조증이 유발될 수 있으니 인공눈물을 넣어주십시오.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img07.png" alt="after_notandum07"></div>
										<div>
											<h4 class="title">가벼운 운동</h4>
											<p class="desc_default exercise">
												<span class="date">수술 1~2주 뒤 바로 가능</span>ㅣ 걷기  / 가벼운 조깅<br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 헬스 / 요가 / 수영 등 무리한 운동 <br>
												<span class="list-dot"></span>수술  후 정기 검진 기간 동안은 안약 사용과 함께 자외선 차단해주세요.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img06.png" alt="외부 충격 주의"></div>
										<div class="txt_box">
											<h4 class="title">운전</h4>
											<p class="desc_default">
												수술 후 회복 초기인  2 ~3주는 장시간 운전 및 초행길 등 야간 운전이 <br>
												불편할 수 있습니다.
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="care_after_info wsize02">
							<h3 class="sub_title06"># 안약 사용법</h3>
							<ul class="list_box03">
								<li>
									<span class="fc_orange">수술 당일은 낮잠 주무시지 마세요.</span>
								</li>
								<li>
									처방 받은 나머지 안약은 보호 렌즈 제거 후 사용 예정이니 보관해주세요.
								</li>
								<li>
									<span class="fc_orange">인공 눈물은 3~6개월 동안 꾸준히 점안</span>해주시고, 건조 상태에 따라 수시로 점안해주세요.
								</li>
							</ul>
						</div>
					</div>
					<!-- //라섹 -->
					<!-- 클리어뷰 스마일 라식 -->
					<div id="clearSmileLasikTab" class="tab">
						<div class="bg_brown_light care_list_wrap">
							<div class="wsize02">
								<h3 class="sub_title06"># 수술 전</h3>
								<ul class="care_list">
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik01.png" alt="notandum1"></div>
										<div class="txt_box">
											<h4 class="title">렌즈 착용 금지</h4>
											<div class="desc_default desc-list">
												<p><span class="date">소프트렌즈</span>ㅣ 7일</p>
												<p><span class="date">하드렌즈 (RGP)</span>ㅣ 14일</p>
												<p><span class="date">난시용 소프트렌즈</span>ㅣ 14일</p>
												<p><span class="date">드림렌즈</span>ㅣ 1개월</p>
											</div>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik02.png" alt="notandum2"></div>
										<div class="txt_box">
											<h4 class="title">검사 당일 자가 운전 금지</h4>
											<p class="desc_default">
												망막검사 후 근거리 시력이 불편해지며 눈부심 때문에 자가운전이 불가합니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik03.png" alt="notandum3"></div>
										<div class="txt_box">
											<h4 class="title">임산부 검사 및 수술 불가능</h4>
											<p class="desc_default">
												임신 중에는 호르몬의 변화에 따른 영향으로 검사 및 수술을 권유드리지 않습니다. <br>
												출산 후 3개월 이후부터 가능하며 모유수유가 끝난 후 검사 및 수술 받으시는 것을 <br>
												권유드립니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik04.png" alt="notandum4"></div>
										<div class="txt_box">
											<h4 class="title">안질환 있는 경우 </h4>
											<p class="desc_default">
												안질환이 의심되거나 이미 진행된 경우에는 검사 진행이 불가합니다.
											</p>
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
										<div class="img_box">
											<img src="/common/img/sub/rv_care_lasik_after01.png" alt="after_notandum01">
										</div>
										<div class="txt_box">
											<h4 class="title">TV·컴퓨터·핸드폰</h4>
											<p class="desc_default">
												수술 후 어지러울 수 있으니 <span class="fc_orange">바로 귀가</span>하시는 것이 좋으며, 2~3시간 정도 시림, 눈물, <br>
												이물감으로 눈뜨기 불편하실 수 있습니다. 가능한 눈을 감고 쉬시고 TV, 컴퓨터, 스마트폰을 <br>
												삼가하여 주십시오. 수술 기계 압력으로 실 핏줄이 터져 <span class="fc_orange">충혈 및 피멍</span>이 드는 경우가 있으나, <br>
												시력과는 무관하며, 특별한 치료없이 1~3주 정도 지나면 <span class="fc_orange">자연 호전</span>됩니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box">
											<img src="/common/img/sub/rv_care_dream_after06.png" alt="">
										</div>
										<div class="txt_box">
											<h4 class="title">취침</h4>
											<p class="desc_default">
												<span class="fc_orange">2주 정도는 눈을 세게 감거나, 비비지 않도록 주의</span>하여 주십시오.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img03.png" alt="after_notandum03"></div>
										<div class="txt_box">
											<h4 class="title">수술 당일에만 물이 들어가지 않도록 주의</h4>
											<p class="desc_default days">
												<span class="date">수술 당일 가능</span>ㅣ 목 아래 샤워  / 뒤로 머리 감기<br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 목욕탕 / 찜질방 / 사우나 
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img04.png" alt="after_notandum04"></div>
										<div class="txt_box">
											<h4 class="title">화장&middot;파마&middot;염색</h4>
											<p class="desc_default">
												<span class="date">수술 다음날 </span>ㅣ 피부 화장 <br>
												<span class="date">수술 1주 뒤 가능 </span>ㅣ 눈 화장 <br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 파마 / 염색
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik_after05.png" alt="after_notandum05"></div>
										<div class="txt_box">
											<h4 class="title">흡연&middot;음주</h4>
											<p class="desc_default days">
												<span class="date">수술 7일 뒤 가능</span>ㅣ 흡연 <br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 음주 ( 과음은 피해주세요. )
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik_after06.png" alt="after_notandum06"></div>
										<div class="txt_box">
											<h4 class="title">2주간 과도한 업무</h4>
											<p class="desc_default">
												수술 후 2주간은 과도한 독서, 밤샘 작업을 피해 주십시오. <br>
												과한 업무는 건조증이 유발될 수 있으니 인공눈물을 넣어주십시오.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img07.png" alt="after_notandum07"></div>
										<div>
											<h4 class="title">가벼운 운동</h4>
											<p class="desc_default exercise">
												<span class="date">수술 1~2주 뒤 가능</span>ㅣ 걷기  / 가벼운 조깅<br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 헬스 / 요가 / 수영 등 무리한 운동
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img06.png" alt="외부 충격 주의"></div>
										<div class="txt_box">
											<h4 class="title">운전</h4>
											<p class="desc_default">
												수술 후 회복 초기인  2 ~3주는 장시간 운전 및 초행길 등 야간 운전이 <br>
												불편할 수 있습니다.
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="care_after_info wsize02">
							<h3 class="sub_title06"># 안약 사용법</h3>
							<ul class="list_box03">
								<li>
									<span class="fc_orange">수술 당일은 낮잠 주무시지 마세요.</span>
								</li>
								<li>
									모든 안약은 순서 상관없이 1~2분 간격으로 점안해주세요. 주무시는 동안은 점안하지 않으셔도 됩니다.
								</li>
								<li>
									<span class="fc_orange">인공 눈물은 수술 당일 1~20분 간격으로 자주 점안해주세요. 건조하면 주름이 생길 가능성이 높습니다.</span>
								</li>
							</ul>
						</div>
					</div>
					<!-- //클리어뷰 스마일 라식 -->
					<!-- 렌즈삽입술 -->
					<div id="implantTab" class="tab">
						<div class="bg_brown_light care_list_wrap">
							<div class="wsize02">
								<h3 class="sub_title06"># 수술 전</h3>
								<ul class="care_list">
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik01.png" alt="notandum1"></div>
										<div class="txt_box">
											<h4 class="title">렌즈 착용 금지</h4>
											<div class="desc_default desc-list">
												<p><span class="date">소프트렌즈</span>ㅣ 7일</p>
												<p><span class="date">하드렌즈 (RGP)</span>ㅣ 14일</p>
												<p><span class="date">난시용 소프트렌즈</span>ㅣ 14일</p>
												<p><span class="date">드림렌즈</span>ㅣ 1개월</p>
											</div>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik02.png" alt="notandum2"></div>
										<div class="txt_box">
											<h4 class="title">검사 당일 자가 운전 금지</h4>
											<p class="desc_default">
												망막검사 후 근거리 시력이 불편해지며 눈부심 때문에 자가운전이 불가합니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik03.png" alt="notandum3"></div>
										<div class="txt_box">
											<h4 class="title">임산부 검사 및 수술 불가능</h4>
											<p class="desc_default">
												임신 중에는 호르몬의 변화에 따른 영향으로 검사 및 수술을 권유드리지 않습니다. <br>
												출산 후 3개월 이후부터 가능하며 모유수유가 끝난 후 검사 및 수술 받으시는 것을 <br>
												권유드립니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik04.png" alt="notandum4"></div>
										<div class="txt_box">
											<h4 class="title">안질환 있는 경우 </h4>
											<p class="desc_default">
												안질환이 의심되거나 이미 진행된 경우에는 검사 진행이 불가합니다.
											</p>
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
										<div class="img_box">
											<img src="/common/img/sub/rv_care_lasik_after01.png" alt="after_notandum01">
										</div>
										<div class="txt_box">
											<h4 class="title">TV·컴퓨터·핸드폰</h4>
											<p class="desc_default">
												수술 후 어지러울 수 있으니 <span class="fc_orange">바로 귀가</span>하시는 것이 좋으며, 1~3일 정도 시림, <br>
												눈물, 이물감으로 눈뜨기 불편하실 수 있습니다. <br>
												가능한 눈을 감고 쉬시고 TV, 컴퓨터, 스마트폰을 삼가하여 주십시오. <br>
												수술 후 한달 동안은 앞으로 숙이는 자세는 피해주십시오.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box">
											<img src="/common/img/sub/pres_care_after_img02.png" alt="after_notandum02">
										</div>
										<div class="txt_box">
											<h4 class="title">보호 안대 착용</h4>
											<p class="desc_default">
												<span class="fc_orange">무의식적으로 눈을 비비지 않도록 주의</span>하여 주십시오. <br>
												<span class="fc_orange">2주 정도는 눈을 세게 감거나, 비비지 않도록 주의</span>하여 주십시오. 
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img03.png" alt="after_notandum03"></div>
										<div class="txt_box">
											<h4 class="title">7일 동안 눈에 물이 들어가지 않도록 주의</h4>
											<p class="desc_default days">
												<span class="date">수술 1달 뒤 가능 </span>ㅣ 대중탕<br>
												<span class="date">수술  2달 뒤 가능 </span>ㅣ 찜질방 / 사우나 
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img04.png" alt="after_notandum04"></div>
										<div class="txt_box">
											<h4 class="title">화장&middot;파마&middot;염색</h4>
											<p class="desc_default">
												<span class="date">수술 1주 뒤 가능 </span>ㅣ 피부 화장 <br>
												<span class="date">수술 3주 뒤 가능 </span>ㅣ 눈 화장 <br>
												<span class="date">수술 4주 뒤 가능 </span>ㅣ 파마 / 염색
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik_after05.png" alt="after_notandum05"></div>
										<div class="txt_box">
											<h4 class="title">흡연&middot;음주</h4>
											<p class="desc_default days">
												<span class="date">수술 1주일간 </span>ㅣ 금연 / 금주 <br>
												<span class="list-dot"></span> 수술  4주일간 과도한 음주는 피해주십시오.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik_after06.png" alt="after_notandum06"></div>
										<div class="txt_box">
											<h4 class="title">2주간 과도한 업무</h4>
											<p class="desc_default">
												수술 후 2주간은 과도한 독서, 밤샘 작업을 피해 주십시오. <br>
												과한 업무는 건조증이 유발될 수 있으니 인공눈물을 넣어주십시오.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img07.png" alt="after_notandum07"></div>
										<div>
											<h4 class="title">가벼운 운동</h4>
											<p class="desc_default exercise">
												<span class="date">수술 1~2주 뒤 바로 가능</span>ㅣ 걷기  / 가벼운 조깅<br>
												<span class="date">수술 4주 뒤 가능</span>ㅣ 헬스 / 요가 / 수영 등 무리한 운동 
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/pres_care_after_img06.png" alt="외부 충격 주의"></div>
										<div class="txt_box">
											<h4 class="title">운전</h4>
											<p class="desc_default">
												수술 후 회복 초기인  2 ~3주는 장시간 운전 및 초행길 등 야간 운전이 <br>
												불편할 수 있습니다.
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="care_after_info wsize02">
							<h3 class="sub_title06"># 안약 사용법</h3>
							<ul class="list_box03">
								<li>
									모든 안약은 순서 상관없이 1~2분 간격으로 점안해주세요. 주무시는 동안은 점안하지 않으셔도 됩니다.
								</li>
							</ul>
						</div>
					</div>
					<!-- //렌즈삽입술 -->
					<!-- 드림렌즈 -->
					<div id="dreamTab" class="tab">
						<div class="bg_brown_light care_list_wrap">
							<div class="wsize02">
								<h3 class="sub_title06"># 검사 전</h3>
								<ul class="care_list">
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik01.png" alt="notandum1"></div>
										<div class="txt_box">
											<h4 class="title">렌즈 착용 금지</h4>
											<div class="desc_default desc-list">
												<p><span class="date">소프트렌즈</span>ㅣ 7일</p>
												<p><span class="date">하드렌즈 (RGP)</span>ㅣ 14일</p>
												<p><span class="date">난시용 소프트렌즈</span>ㅣ 14일</p>
												<p><span class="date">드림렌즈</span>ㅣ 1개월</p>
											</div>
										</div>
									</li>
								</ul>
								<h3 class="sub_title06"># 렌즈 착용 후</h3>
								<ul class="care_list">
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_lasik04.png" alt="notandum2"></div>
										<div class="txt_box">
											<h4 class="title">안질환 있는 경우 중단</h4>
											<p class="desc_default">
												각막 염증, 알러지 결막염, 충혈 등 안약으로 관리하는 경우 렌즈 착용을 중단하세요.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_dream03.png" alt="notandum3"></div>
										<div class="txt_box">
											<h4 class="title">즉시 내원이 필요한 경우</h4>
											<p class="desc_default">
												심한 통증, 충혈,  눈부심, 눈곱 등의 증상이 있을 때는 렌즈 착용을 바로 중지하시고 <br>
												바로 내원하셔서 진료를 받으셔야 합니다.
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="bg_blue_light care_list_wrap">
							<div class="wsize02">
								<h3 class="sub_title06"># 드림렌즈 착용 방법  및 주의사항</h3>
								<ul class="care_list">
									<li class="flex">
										<div class="img_box">
											<img src="/common/img/sub/rv_care_dream_after01.png" alt="after_notandum01">
										</div>
										<div class="txt_box">
											<h4 class="title">흐르는 물로 세척 후 사용</h4>
											<p class="desc_default">
												렌즈 착용 전에는 흐르는 물로 렌즈를 헹궈 사용합니다. <br>
												세척액이 남아있는 상태로 착용하게 되면 눈이 따갑거나 장 기간 보관 중 <br>
												렌즈의 변색을 유발시킬 수 있습니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box">
											<img src="/common/img/sub/rv_care_dream_after02.png" alt="after_notandum02">
										</div>
										<div class="txt_box">
											<h4 class="title">인공 눈물 사용 후 착용</h4>
											<p class="desc_default">
												렌즈의 이상 유무를 확인한 뒤 인공 눈물을 1-2방울 렌즈에 떨어뜨린 후 <br>
												착용하십시오.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_dream_after03.png" alt="after_notandum03"></div>
										<div class="txt_box">
											<h4 class="title">타월 받침 사용 후 착용 및 제거</h4>
											<p class="desc_default">
												렌즈가 분실되거나 파손 위험이 있으니 되도록 렌즈 착용 및 제거 시에는 밑에 타월을 <br>
												깔고 렌즈를 착용하시기 바랍니다. 행여 렌즈가 떨어졌을 경우 무리하게 렌즈를 잡지 <br>
												마시고 손에 물을 살짝 묻혀 렌즈에 대면 렌즈가 쉽게 손에 딸려옵니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_dream_after04.png" alt="after_notandum04"></div>
										<div class="txt_box">
											<h4 class="title">취침 시 반듯한 자세</h4>
											<p class="desc_default">
												렌즈를 끼고 잘 때는 반드시 반듯한 자세를 취합니다. 엎드린 자세는 좋지 않습니다. <br>
												<span class="fc_orange">잠잘 때 8시간 이상 착용</span>해야 효과가 좋습니다. <br>
												단, 수면 시간이 부족한 경우에는 부족한 시간만큼 미리 착용하고 주무시면 됩니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_dream_after05.png" alt="after_notandum05"></div>
										<div class="txt_box">
											<h4 class="title">보관 시 보존 용액 사용</h4>
											<p class="desc_default">
												렌즈 보관 시 렌즈 케이스에 보존 용액을 ⅔ 정도 넣고 렌즈를 넣습니다. <br>
												렌즈 케이스의 보존 용액은 매일 갈아줍니다. <br>
												<span class="fc_orange">※ 렌즈 용액은 하드 렌즈 전용으로 사용해야함</span>
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_dream_after06.png" alt="after_notandum06"></div>
										<div class="txt_box">
											<h4 class="title">절대 눈 비비지 마세요.</h4>
											<p class="desc_default">
												초기 가려운 증상에는 눈 끝 쪽만 살짝 눌러 주도록 합니다.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_dream_after07.png" alt="after_notandum07"></div>
										<div>
											<h4 class="title">1~2주 교정  전까지 사용</h4>
											<p class="desc_default">
												눈의 상태에 따라 교정이 되기까지 1-2주 정도 걸릴 수 있습니다. <br>
												이 기간 동안에는 기존에 쓰던 안경을 휴대하여 불편할 때마다 착용해주세요.
											</p>
										</div>
									</li>
									<li class="flex">
										<div class="img_box"><img src="/common/img/sub/rv_care_dream_after08.png" alt="after_notandum08"></div>
										<div class="txt_box">
											<h4 class="title">아침 렌즈 제거 시 , 인공 눈물 사용</h4>
											<p class="desc_default">
												아침에 일어나서 세안하기 위해 렌즈를 제거하기 전, 인공 눈물을 1~2방울 점안한 뒤 <br>
												렌즈의 움직임을 확인 하신 후,  3 -5분 후에 렌즈를 빼셔야 합니다. 
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="care_after_info wsize02">
							<h3 class="sub_title06"># 드림렌즈 진료</h3>
							<ul class="list_box03">
								<li>
									렌즈 착용 1주일 뒤, 혹은 정해드리는 날짜에 진료 받으러 오시고 이때 <span class="fc_orange">드림렌즈를 휴대하고 오시는 것이 좋습니다.</span>
								</li>
							</ul>
						</div>
					</div>
					<!-- //드림렌즈 -->
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script>
		// 탭 메뉴
		$(".notandum_wrap .sub_tab_menu li").click(function () {
			$(".notandum_wrap .sub_tab_menu li").removeClass("active");

			$(this).addClass("active");
			$(".notandum_wrap .tab").hide();
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn();
		});
	</script>
</body>
</html>