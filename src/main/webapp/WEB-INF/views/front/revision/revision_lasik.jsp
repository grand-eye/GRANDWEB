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
		<div class="sub subEyecareJoinRetinaRevision">
			<h2 class="sub_title">시력 교정 클리닉</h2>
			<div class="lasik_wrap page-wrap"><!-- 원데이라식 -->
				<ul class="sub_tab_menu flex wsize mt90">
					<li class="active" rel="lasikTab">원데이 라식</li>
					<li rel="lasekTab">투데이 라섹</li>
					<li rel="clasikTab">클리어뷰 스마일 라식</li>
				</ul>
				<div class="tab_contents mt45">
					<!-- 원데이라식 -->
					<div id="lasikTab" class="tab" style="display:block;">
						<div class="sub_visual lasik-hero01 pc_show"></div>
						<div class="mo_lasik-hero01 mo_show"><img src="/common/img/sub/mo_rv_lasik_bg01.jpg" alt=""></div>
						<div class="sub_txt_bar">
							강남그랜드안과는 정밀하면서도 안전한 눈 수술을 위해 레이저 시력교정을 진행하고 있습니다.
						</div>
						<div class="lasiklasek01 first-sec txt-center">
							<h2 class="cont-tit">원데이 라식</h2>
							<div class="img-wrap">
								<img src="/common/img/sub/rv_o_lasik01_img01.jpg" alt="hero">
							</div>
							<p class="cont-desc">
								원데이 라식은 검사부터 수술까지 하루에 진행하는 라식 수술 프로그램입니다.<br>
								수술 후 빠른 회복을 위해서 모든 과정을 올 레이저로 진행합니다.<br>
								올 레이저 라식은 각막 절편 생성 시 펨토 세컨 레이저를 사용하여 일반 라식보다<br>
								더 안전하고 정교한 수술이 가능합니다.
							</p>
						</div>
						<div class="lasiklasek02 gray-bg">
							<div class="wsize">
								<h2>
									원데이 라식 <br>
									이런 분들에게 추천합니다.
								</h2>
								<ul class="check-list check-icon-list">
									<li>검사 후 라식 수술이 가능한 만  18세 이상 성인</li>
									<li>안경 및 콘택트렌즈 착용이 불편한 분</li>
									<li>직업상 바쁜 생활로 빠른 회복을 원하는 분 </li>
									<li>시력교정 후 빠른 회복을 원하는 분</li>
									<li>최근 1년간 안경 도수 변화가 없는 분</li>
									<li>각막 지형, 두께 등 맞춤형 라식 수술을 원하는 분 </li>
								</ul>
							</div>
						</div>
						<!--진료과정-->
						<div class="txt-center mo_show">						
							<div class="mo_o_lasik05 mo_show" style="text-align: center;">
								<img src="/common/img/sub/rv_o_lasik05_img01_m.jpg" alt="process" style="padding: 50px 15px;">
							</div>
						</div>
						<div class="lasiklasek05 first-sec txt-center pc_show">
							<div class="img-wrap">
								<img src="/common/img/sub/rv_o_lasik05_img01.jpg" alt="process"  style="padding-bottom: 180px;">
							</div>						
						</div>
						<!--진료과정-->
						<div class="lasiklasek03 care-sec txt-center">
							<div class="navy-bg">
								<h4 class="top-tit">강남그랜드안과</h4>
								<h2 class="cont-tit">올 레이저 라식 수술 방법</h2>
							</div>
							<div class="gray-bg">
								<div class="wsize">
									<div class="icon-list">
										<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
										<h4 class="box-tit">개인의 눈에 최적화된 맞춤형 레이저 시스템</h4>
										<p class="cont-desc cont-desc01">
											강남그랜드안과 라식은 10,000케이스 이상 집도한 원장님이 <br>
											개인 맞춤형 레이저 장비를 사용해 수술합니다. <br>
											평균 수술 시간은 약 5-10분 정도이며 수술 후 바로 다음날부터 일상 생활이 가능합니다.
										</p>
										<ul class="num-list">
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_lasik03_img01.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num01.png" alt="care-num">
												</div>
												<h4>
													점안 마취 후 레이저를 이용한 <br>
													각막 절편 형성
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_lasik03_img02.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num02.png" alt="care-num">
												</div>
												<h4>
													만든 각막 절편을 벗겨 <br>
													수술 부위 확보
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_lasik03_img03.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num03.png" alt="care-num">
												</div>
												<h4>
													레이저를 조사해 시력 교정
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_lasik03_img04.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num04.png" alt="care-num">
												</div>
												<h4>
													벗겨진 각막 절편을 다시 덮음
												</h4>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--수술장비-->
						<div class="lasiklasek04 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit" style="color: #1e3250;">올 레이저 라식 수술 장비</h2>
						</div>
						<div class="rv_o_lasik07_z8_wrap">
							<div class="rv_o_lasik07_z8_box">
								<div class="wsize">
									<h3 class="sub_title02"><span class="yellow">정밀한 각막 절편 생성이 가능한</span><br><span class="blue">FEMTO LDV Z8</span></h3>
									<ul class="tag_box">
										<li># 빠른 조사 속도</li>
										<li># 견고한 각막 절편 생성</li>
										<li># 수술 시간 단축</li>
										<li># 수술 후 적은 통증</li>
									</ul>
									<div class="img">
										<img class="pc_show" src="/common/img/sub/rv_o_lasik07_z8.png" alt="z8">
									</div>
									<div class="mark_newred">NEW</div>
								</div>
							</div>
						</div>
						<div class="rv_o_lasik07_ex500_wrap">
							<div class="rv_o_lasik07_ex500_box">
								<div class="wsize">
									<h3 class="sub_title02"><span class="yellow">빠르고 정교한 수술이 가능한</span><br><span class="blue">2021년형 EX500 White</span></h3>
									<ul class="tag_box">
										<li># 초고도 근시 절대 강자</li>
										<li># 절삭량 최소</li>
										<li># 무 접촉 라섹</li>
										<li># 올 레이저</li>
									</ul>
									<div class="img">
										<img class="pc_show" src="/common/img/sub/rv_o_lasik07_ex500.png" alt="ex500">
									</div>
									<div class="mark_bestblue">BEST</div>
								</div>
							</div>
						</div>
						<!--수술장비-->
						<div class="lasiklasek04 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit">시력 교정 클리닉 시스템</h2>
							<p class="cont-desc">
								강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다. <br class="br_none_450">
								검사 후 의료진과 일대일 맞춤 상담으로 시력교정 치료 방법을 결정합니다.
							</p>
							<div class="feature-wrap system-list pc_show">
								<ul class="feature-list">
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg01.png" alt="클리닉1">
											<p>정밀 검사</p>
										</div>
										<p class="feature-desc">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg02.png" alt="클리닉2">
											<p>의료진 상담</p>
										</div>
										<p class="feature-desc">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="space-sm"></span>
											이때 의료진은 고객에게 맞는 <br>
											시력 교정 치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/rv_lasik04_bg03.png" alt="클리닉3">
											<p>수술 진행</p>
										</div>
										<p class="feature-desc">
											의료진 상담 시 결정한 치료 방법에 <br>
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
							<div class="system_list_box mo_show">
								 <ul class="system_list">
									<li>
										<div class="title_box">
											<img src="/common/img/sub/mo_pres_clinic_system_bg01.png" alt="클리닉1">
										</div>
										<p class="desc_default">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg02 (2).png" alt="클리닉2">
										</div>
										<p class="desc_default">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="txt_space"></span>
											이때 의료진은 고객에게 맞는 <br>
											치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/mo_pres_clinic_system_bg03.png" alt="클리닉3">
										</div>
										<p class="desc_default">
											의료진 상담 시 결정한 치료 방법에<br> 
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
							<!--원데이라식 주의사항-->
							<div class="t_lasek_diabet01 notandum-sec txt-center">
								<h2 class="cont-tit">원데이 라식 수술 주의사항</h2>
								<div class="col-list-wrap">
									<ul class="col-list">
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/rv_care_t_lasek01.png" alt="">
											</div>
											<div class="txt-wrap">
												<h3>주의사항</h3>
												<p>
													당일 정밀검사 결과 이상소견이 없는 분에 한해 당일 수술을 진행합니다.<br>
													원데이 라식 검사 시 필요에 따라 아벨리노 DNA 검사를 진행합니다.<br>
													안전한 당일 수술을 위해 안과 방문 전 렌즈 착용 중지 기간을 꼭 지켜야 합니다.<br>
													· 소프트렌즈ㅣ 7일<br>
													· 하드렌즈 (RGP)ㅣ 14일<br>
													· 난시용 소프트렌즈ㅣ 14일<br>
													· 드림렌즈ㅣ 1개<br>
													방문 당일 날 가급적 대중 교통 귀가를 권유합니다.<br>
													병원 방문 당일 향수 및 헤어스프레이 지양, 모자 또는 선글라스 지참을 권유합니다.<br> 
													안 질환이 의심되거나 이미 진행된 경우에는 검사 및 수술 진행이 불가합니다.
												</p>
											</div>
										</li>
									</ul>
								</div>
							</div><!--원데이라식 주의사항-->
							<div class="link-wrap pc_show">
								<a href="/revision/premium" class="anchor-arrow">프리미엄 맞춤 교정술 바로 가기</a>
								<a href="/community/review" class="anchor-arrow" style="margin-left: 120px;">고객 체험기 바로 가기</a>
							</div>
 							<ul class="link_box justify-cont-center flex mo_show">
								<li><a href="/revision/premium" class="btn_detail">프리미엄 맞춤 교정술 바로 가기</a></li>
								<li><a href="/community/review" class="btn_detail">고객 체험기 바로 가기</a></li>
							</ul>
						</div>
					</div>
					<!-- //원데이 라식 -->
					<!-- 투데이 라섹 -->
					<div id="lasekTab" class="tab">
						<div class="sub_visual lasek-hero01 pc_show"></div>
						<div class="mo_lasek-hero01 mo_show"><img src="/common/img/sub/mo_rv_lasek_bg01.jpg" alt=""></div>
						<div class="sub_txt_bar">
							강남그랜드안과는 정밀하면서도 안전한 눈 수술을 위해 레이저 시력교정을 진행하고 있습니다.
						</div>
						<div class="lasiklasek01 first-sec txt-center">
							<h2 class="cont-tit">투데이 라섹</h2>
							<div class="img-wrap">
								<img src="/common/img/sub/rv_t_lasek01_img01.jpg" alt="hero">
							</div>
							<p class="cont-desc">
								투데이 라섹은 모든 과정을 올 레이저로 진행하는 라섹 수술 프로그램입니다.
								<br>
								일반 라섹 수술보다 각막 손상 및 수술 범위를 최소화하여 통증은 줄이고 회복은 더 빠르게 도와줍니다. <br>
								각막 상피 회복 기간을 평균 5일에서 2일로 단축하여 수술 진행 후 48시간 후부터 일상생활이 가능합니다.
							</p>
						</div>
						<div class="lasiklasek02 lasek02 gray-bg">
							<div class="wsize">
								<h2>
									투데이 라섹 <br>
									이런 분들에게 추천합니다.
								</h2>
								<ul class="check-list check-icon-list">
									<li>검사 후 라섹 수술이 가능한 만 18세 이상 성인</li>
									<li>평소 눈이 예민하고 충혈이 잘되는 분</li>
									<li>심한 안구 건조증으로 힘들어하는 분</li>
									<li>각막이 얇아 라식 수술이 어려운 분</li>
									<li>선명하고 높은 시력의 질을 원하는 분</li>
									<li>라섹 수술 후 빠른 회복을 원하는 분</li>
								</ul>
							</div>
						</div>
						<!--진료과정-->
						<div class="txt-center mo_show">						
							<div class="mo_t_lasek05 mo_show" style="text-align: center;">
								<img src="/common/img/sub/rv_t_lasek05_img01_m.jpg" alt="process" style="padding: 50px 15px;">
							</div>
						</div>
						<div class="lasiklasek05 first-sec txt-center pc_show">
							<div class="img-wrap">
								<img src="/common/img/sub/rv_t_lasek05_img01.jpg" alt="process">
							</div>						
						</div>
						<!--진료과정-->
						<!--특징 및 장점-->
						<div class="lasiklasek06 care-sec txt-center">
							<div class="navy-bg">
								<h4 class="top-tit">강남그랜드안과</h4>
								<h2 class="cont-tit">투데이 라섹 특징 및 장점</h2>
							</div>
							<div class="gray-bg">
								<div class="wsize">
									<div class="icon-list">
										<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
										<h4 class="box-tit">얇은 각막도 48시간이면 회복 가능한 투데이 라섹</h4>
										<p class="cont-desc cont-desc01">
											투데이 라섹 수술은 각막 상피 회복 기간을 평균 5일에서 2일로 단축하여<br class="br_none_450">
											수술 후 48시간이 지나면 일상생활이 가능하단 장점이 있습니다. 
										</p>
										<div class="tit-img-wrap">
											<img src="/common/img/sub/rv_t_lasek06_img01.jpg" alt="character" style="padding: 40px 10px 96px;">
										</div>	
										<h4 class="box-tit">미국 FDA 승인을 받은 개인 맞춤형 레이저</h4>
										<p class="cont-desc cont-desc01">
											EX500 WHITE 장비를 사용하여 올 레이저 라섹 수술을 진행합니다.<br class="br_none_450">
											적은 각막 절삭량으로 높은 안정성과 수술 후 부작용을 예방합니다.
										</p>
										<div class="tit-img-wrap">
											<img src="/common/img/sub/rv_t_lasek06_img02.jpg" alt="character" style="padding: 40px 10px 96px;">
										</div>
										<h4 class="box-tit">수술 후 단단한 각막을 위한 각막 강화 시스템</h4>
										<p class="cont-desc cont-desc01">
											투데이 라섹 수술 후 원추각막, 근시 퇴행, 각막확장증과 같은 <br class="br_none_450">
											부작용 발생 위험을 줄이기 위해서 양막, 자가 혈청 안약 등 각막 강화를 진행합니다.
										</p>
										<div class="tit-img-wrap">
											<img src="/common/img/sub/rv_t_lasek06_img03.jpg" alt="character" style="padding: 40px 0px 96px;">
										</div>
									</div>
								</div>
							</div>
						</div><!--특징 및 장점-->
						<!--수술방법-->
						<div class="lasiklasek03 care-sec txt-center">
							<div class="navy-bg">
								<h4 class="top-tit">강남그랜드안과</h4>
								<h2 class="cont-tit">올 레이저 라섹 수술 방법</h2>
							</div>
							<div class="gray-bg">
								<div class="wsize">
									<div class="icon-list">
										<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
										<h4 class="box-tit">개인의 눈에 최적화된 맞춤형 레이저 시스템</h4>
										<p class="cont-desc cont-desc01">
											강남그랜드안과 라섹은 10,000케이스 이상 집도한 원장님이 <br class="br_none_450">
											개인 맞춤형 레이저 장비를 사용해 수술합니다. <br class="br_none_450">
											평균 수술 시간은 약 5-10분 정도이며 수술 후 3일차부터 일상 생활이 가능합니다. 
										</p>
										<ul class="num-list">
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_lasek03_img01.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num01.png" alt="care-num">
												</div>
												<h4>
													수술을 위해 점안 마취
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_lasek03_img02.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num02.png" alt="care-num">
												</div>
												<h4>
													레이저를 이용해 <br>
													각막 상피 제거
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_lasek03_img03.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num03.png" alt="care-num">
												</div>
												<h4>
													레이저를 조사해 시력 교정
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_lasek03_img04.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num04.png" alt="care-num">
												</div>
												<h4>
													통증 완화 및 상피 재생을 위해 <br>
													치료용 콘텍트 렌즈를 덮어줌
												</h4>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div><!--수술방법-->
						<div class="lasiklasek04 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit">시력 교정 클리닉 시스템</h2>
							<p class="cont-desc">
								강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다. <br class="br_none_450">
								검사 후 의료진과 일대일 맞춤 상담으로 시력교정 치료 방법을 결정합니다.
							</p>
							<div class="feature-wrap system-list pc_show">
								<ul class="feature-list">
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg01.png" alt="클리닉1">
											<p>정밀 검사</p>
										</div>
										<p class="feature-desc">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg02.png" alt="클리닉2">
											<p>의료진 상담</p>
										</div>
										<p class="feature-desc">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="space-sm"></span>
											이때 의료진은 고객에게 맞는 <br>
											시력 교정 치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/rv_lasik04_bg03.png" alt="클리닉3">
											<p>수술 진행</p>
										</div>
										<p class="feature-desc">
											의료진 상담 시 결정한 치료 방법에 <br>
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
							<div class="system_list_box mo_show">
								 <ul class="system_list">
									<li>
										<div class="title_box">
											<img src="/common/img/sub/mo_pres_clinic_system_bg01.png" alt="클리닉1">
										</div>
										<p class="desc_default">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg02 (2).png" alt="클리닉2">
										</div>
										<p class="desc_default">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="txt_space"></span>
											이때 의료진은 고객에게 맞는 <br>
											치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/mo_pres_clinic_system_bg03.png" alt="클리닉3">
										</div>
										<p class="desc_default">
											의료진 상담 시 결정한 치료 방법에<br> 
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
							<!--투데이라섹 주의사항-->
							<div class="t_lasek_diabet01 notandum-sec txt-center">
								<h2 class="cont-tit">투데이 라섹 수술 주의사항</h2>
								<div class="col-list-wrap">
									<ul class="col-list">
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/rv_care_t_lasek01.png" alt="">
											</div>
											<div class="txt-wrap">
												<h3>주의사항</h3>
												<p>
													개인별 안구 상태에 따라 치료용 렌즈 제거 기간이 달라질 수 있습니다. <br>
													안전한 당일 수술을 위해 안과 방문 전 렌즈 착용 중지 기간을 꼭 지켜야 합니다.<br>
													· 소프트렌즈ㅣ 7일 <br>
													· 하드렌즈 (RGP)ㅣ 14일 <br>
													· 난시용 소프트렌즈ㅣ 14일 <br>
													· 드림렌즈ㅣ 1개<br>
													안 질환이 의심되거나 이미 진행된 경우에는 검사 및 수술 진행이 불가합니다. 
												</p>
											</div>
										</li>
									</ul>
								</div>
							</div><!--투데이라섹 주의사항-->
							<div class="link-wrap pc_show">
								<a href="/revision/premium" class="anchor-arrow">프리미엄 맞춤 교정술 바로 가기</a>
								<a href="/community/review" class="anchor-arrow" style="margin-left: 120px;">고객 체험기 바로 가기</a>
							</div>
 							<ul class="link_box justify-cont-center flex mo_show">
								<li><a href="/revision/premium" class="btn_detail">프리미엄 맞춤 교정술 바로 가기</a></li>
								<li><a href="/community/review" class="btn_detail">고객 체험기 바로 가기</a></li>
							</ul>
						</div>

					</div>
					<!-- //투데이 라섹 -->
					<!-- 클리어뷰스마일 라식 -->
					<div id="clasikTab" class="tab">
						<div class="sub_visual lasek-hero01 pc_show" style="background: url('/common/img/sub/rv_c_lasik_bg01.jpg') center no-repeat;"></div>
						<div class="mo_lasek-hero01 mo_show"><img src="/common/img/sub/mo_rv_clasik_bg01.jpg" alt=""></div>
						<div class="sub_txt_bar">
							강남그랜드안과는 정밀하면서도 안전한 눈 수술을 위해 레이저 시력교정을 진행하고 있습니다.
						</div>
						<div class="lasiklasek01 first-sec txt-center">
							<h2 class="cont-tit">클리어뷰 스마일 라식</h2>
							<div class="img-wrap">
								<img src="/common/img/sub/rv_c_lasik01_img01.jpg" alt="hero">
							</div>
							<p class="cont-desc">
								클리어뷰 스마일 라식은 각막 절편을 만들지 않아<br>
								각막 상층부 손상을 줄이는 최소 절개 시력교정 수술입니다.<br>
								수술 방법은 기존 스마일 라식과 같지만<br>
								클리어뷰 스마일 라식은 스위스 짐머 사의 펨토 세컨드 레이저인 FEMTO Z8을 사용합니다.<br>
								일반 라식 수술의 1/10 (2mm) 정도 되는 미세한 절개창으로<br>
								각막 실질을 분리해 수술 후 각막 손상과 안구건조증 발생 위험을 줄입니다.
							</p>
						</div>
						<div class="lasiklasek02 lasik02 gray-bg pc_show" style="background: #e3e3e5 url(/common/img/sub/rv_c_lasik02_bg.jpg) center bottom no-repeat;">
							<div class="wsize">
								<h2>
									클리어뷰 스마일 라식 <br>
									이런 분들에게 추천합니다.
								</h2>
								<ul class="check-list check-icon-list">
									<li>만  18세 이상 성인</li>
									<li>안경 및 콘택트렌즈 착용이 불편한 분</li>
									<li>직업상 바쁜 생활로 빠른 회복을 원하는 분 </li>
									<li>시력 교정 수술 후 안구건조증 발생이 걱정되는 분</li>
									<li>고도 근시나 고도 난시로 시력교정 수술이 힘들었던 분</li>
								</ul>
							</div>
						</div>
						<div class="lasiklasek02 lasek02 gray-bg mo_show">
							<div class="wsize">
								<h2>
									클리어뷰 스마일 라식 <br>
									이런 분들에게 추천합니다.
								</h2>
								<ul class="check-list check-icon-list">
									<li>만  18세 이상 성인</li>
									<li>안경 및 콘택트렌즈 착용이 불편한 분</li>
									<li>직업상 바쁜 생활로 빠른 회복을 원하는 분 </li>
									<li>시력 교정 수술 후 안구건조증 발생이 걱정되는 분</li>
									<li>고도 근시나 고도 난시로 시력교정 수술이 힘들었던 분</li>
								</ul>
							</div>
						</div>
						<div class="lasiklasek01 first-sec txt-center">
							<h2 class="cont-tit">기존 스마일 라식의 한계를 보완한 클리어뷰 스마일 라식</h2>
							<div class="img-wrap pc_show">
								<img src="/common/img/sub/rv_c_lasik02_img01.jpg" alt="hero">
							</div>
							<div class="img-wrap mo_show">
								<img src="/common/img/sub/rv_c_lasik02_img01_m.jpg" alt="hero">
							</div>
							<p class="cont-desc">
								클리어뷰 스마일 라식은 각막 중심을 기준으로 절삭이 되어<br>
								완전한 교정이 어려웠던 기존 스마일 라식의 한계점을 보완했습니다.<br>
								정확한 안구 회전(C축)과 난시축 교정에 집중하여 수술합니다. 
							</p>
							<div class="img-wrap pc_show">
								<img src="/common/img/sub/rv_c_lasik02_img02.jpg" alt="hero" style="padding-top: 90px;">
							</div>
							<div class="img-wrap mo_show">
								<img src="/common/img/sub/rv_c_lasik02_img02_m.jpg" alt="hero" style="padding-top: 35px;">
							</div>
						</div>
						<!--특징 및 장점-->
						<div class="lasiklasek06 care-sec txt-center"  style="padding-top: 30px;">
							<div class="navy-bg">
								<h4 class="top-tit">강남그랜드안과</h4>
								<h2 class="cont-tit">클리어뷰 스마일 라식 특징 및 장점</h2>
							</div>
							<div class="gray-bg">
								<div class="wsize">
									<div class="icon-list">
										<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
										<h4 class="box-tit">빠르고 부드러운 로우 에너지</h4>
										<p class="cont-desc cont-desc01">
											나노 단위의 낮은 펄스 에너지를 사용한 부드러운 최소 절개 수술로<br class="br_none_450">
											눈에 매우 가깝게 작동하여 수술 후 각막이 안정화하는 데 도움이 됩니다.
										</p>
										<div class="tit-img-wrap pc_show">
											<img src="/common/img/sub/rv_c_lasik03_img01.jpg" alt="character" style="padding: 40px 10px 96px;">
										</div>
										<div class="tit-img-wrap mo_show">
											<img src="/common/img/sub/rv_c_lasik03_img01_m.jpg" alt="character" style="padding: 40px 6px 96px;">
										</div>
										<h4 class="box-tit">정밀한 교정을 위한 OCT 시스템</h4>
										<p class="cont-desc cont-desc01">
											수술 중 고해상도  OCT 이미지를 통해 각막 실질층 까지 실시간으로 확인하여<br class="br_none_450">
											시축과 난시축을 더 정밀하게 시력 교정할 수 있습니다.
										</p>
										<div class="tit-img-wrap pc_show">
											<img src="/common/img/sub/rv_c_lasik03_img02.jpg" alt="character" style="padding: 40px 10px 96px;">
										</div>
										<div class="tit-img-wrap mo_show">
											<img src="/common/img/sub/rv_c_lasik03_img02.jpg" alt="character" style="padding: 40px 24px 96px;">
										</div>
										<h4 class="box-tit">각막 중심을 잡아주는 도킹 시스템</h4>
										<p class="cont-desc cont-desc01">
											절개창의 위치를 조절할 수 있어 렌티큘의 위치를 잡아주고,<br class="br_none_450">
											안구 회축을 교정할 수 있어 더욱더 정확한 난시 교정이 가능합니다.
										</p>
										<div class="tit-img-wrap pc_show">
											<img src="/common/img/sub/rv_c_lasik03_img03.jpg" alt="character" style="padding: 40px 0px 96px;">
										</div>
										<div class="tit-img-wrap mo_show">
											<img src="/common/img/sub/rv_c_lasik03_img03.jpg" alt="character" style="padding: 40px 10px 96px;">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--//특징 및 장점-->
						<div class="lasiklasek03 care-sec txt-center">
							<div class="navy-bg">
								<h4 class="top-tit">강남그랜드안과</h4>
								<h2 class="cont-tit">클리어뷰 스마일 라식 수술 방법</h2>
							</div>
							<div class="gray-bg">
								<div class="wsize">
									<div class="icon-list">
										<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
										<h4 class="box-tit">미세 절개로 각막 손상을 줄이는 레이저 시스템</h4>
										<p class="cont-desc cont-desc01">
											강남그랜드안과 클리어뷰 스마일 라식은 레이저가 각막 표면을 투과해서<br class="br_none_450">
											시력 교정량 만큼 각막 실질에 조각(렌티큘)을 만들어<br class="br_none_450">
											미세한 절개창을 통해 추출하는 수술입니다.<br class="br_none_450">
											평균 수술 시간은 약 15분 정도이며 수술 후 다음 날부터 일상생활이 가능합니다.
										</p>
										<ul class="num-list">
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_c_lasik04_img01.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num01.png" alt="care-num">
												</div>
												<h4>
													수술을 위해 점안 마취
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_c_lasik04_img02.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num02.png" alt="care-num">
												</div>
												<h4>
													작은 원반 형태의 각막 조직 <br>
													조각인 렌티큘을 만들고 <br>
													각막의 일부를 절개
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_c_lasik04_img03.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num03.png" alt="care-num">
												</div>
												<h4>
													절개된 부분을 통해 <br>
													각막의 자극을 최소화하여 <br>
													렌티큘을 제거
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_c_lasik04_img04.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num04.png" alt="care-num">
												</div>
												<h4>
													렌티큘을 제거함으로써 <br>
													각막의 형태에 변화를 <br> 
													주어 굴절 이상을 교정
												</h4>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--수술장비-->
						<div class="lasiklasek04 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit">클리어뷰 스마일 라식 수술 장비</h2>
						</div>
						<div class="rv_c_lasik05_z8_wrap">
							<div class="rv_c_lasik05_z8_box">
								<div class="wsize">
									<h3 class="sub_title02"><span class="grey">차세대 시력교정 클리어뷰 스마일 라식</span><br><span class="red">ZIMMER FEMTO LDV Z8</span></h3>
									<ul class="tag_box">
										<li># 라섹과 라식의 한계를 넘은 차세대 시력 교정술</li>
										<li># 맞춤형 근시 및 난시 교정</li>
										<li># 5000Khz 이상의 빠른 속도</li>
										<li># 안구 계측이 가능한 시스템 탑재</li>
									</ul>
									<div class="img">
										<img class="pc_show" src="/common/img/sub/rv_c_lasik05_z8.png" alt="z8">
									</div>
								</div>
							</div>
						</div>
						<!--//수술장비-->
						<div class="lasiklasek04 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit">시력 교정 클리닉 시스템</h2>
							<p class="cont-desc">
								강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다. <br class="br_none_450">
								검사 후 의료진과 일대일 맞춤 상담으로 시력교정 치료 방법을 결정합니다.
							</p>
							<div class="feature-wrap system-list pc_show">
								<ul class="feature-list">
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg01.png" alt="클리닉1">
											<p>정밀 검사</p>
										</div>
										<p class="feature-desc">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg02.png" alt="클리닉2">
											<p>의료진 상담</p>
										</div>
										<p class="feature-desc">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="space-sm"></span>
											이때 의료진은 고객에게 맞는 <br>
											시력 교정 치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/rv_lasik04_bg03.png" alt="클리닉3">
											<p>수술 진행</p>
										</div>
										<p class="feature-desc">
											의료진 상담 시 결정한 치료 방법에 <br>
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
							<div class="system_list_box mo_show">
								 <ul class="system_list">
									<li>
										<div class="title_box">
											<img src="/common/img/sub/mo_pres_clinic_system_bg01.png" alt="클리닉1">
										</div>
										<p class="desc_default">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg02 (2).png" alt="클리닉2">
										</div>
										<p class="desc_default">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="txt_space"></span>
											이때 의료진은 고객에게 맞는 <br>
											치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/mo_pres_clinic_system_bg03.png" alt="클리닉3">
										</div>
										<p class="desc_default">
											의료진 상담 시 결정한 치료 방법에<br> 
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
							<!--주의사항-->
							<div class="t_lasek_diabet01 notandum-sec txt-center">
								<h2 class="cont-tit">클리어뷰 스마일 라식 수술 주의사항</h2>
								<div class="col-list-wrap">
									<ul class="col-list">
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/rv_care_t_lasek01.png" alt="">
											</div>
											<div class="txt-wrap">
												<h3>주의사항</h3>
												<p>
													안전한 당일 수술을 위해 안과 방문 전 렌즈 착용 중지 기간을 꼭 지켜야 합니다.<br>
													· 소프트렌즈ㅣ 7일<br> 
													· 하드렌즈 (RGP)ㅣ 14일<br> 
													· 난시용 소프트렌즈ㅣ 14일<br> 
													· 드림렌즈ㅣ 1개<br>
													방문 당일 날 가급적 대중 교통 귀가를 권유합니다.<br>
													병원 방문 당일 향수 및 헤어 스프레이 지양, 모자 또는 선글라스 지참을 권유합니다.<br>
													안 질환이 의심되거나 이미 진행된 경우에는 검사 및 수술 진행이 불가합니다.
												</p>
											</div>
										</li>
									</ul>
								</div>
							</div><!--주의사항-->
							<div class="link-wrap pc_show">
								<a href="/revision/premium" class="anchor-arrow">프리미엄 맞춤 교정술 바로 가기</a>
								<a href="/community/review" class="anchor-arrow" style="margin-left: 120px;">고객 체험기 바로 가기</a>
							</div>
 							<ul class="link_box justify-cont-center flex mo_show">
								<li><a href="/revision/premium" class="btn_detail">프리미엄 맞춤 교정술 바로 가기</a></li>
								<li><a href="/community/review" class="btn_detail">고객 체험기 바로 가기</a></li>
							</ul>
						</div>
					</div>
					<!-- //클리어뷰스마일 라식 -->
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript">
		// 탭 메뉴
		$(".lasik_wrap .sub_tab_menu li").click(function () {
			$(".lasik_wrap .sub_tab_menu li").removeClass("active");

			$(this).addClass("active");
			$(".lasik_wrap .tab").hide();
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn();
		});
	</script>
</body>
</html>