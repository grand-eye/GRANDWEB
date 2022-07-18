<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>

	<style type="text/css">
		.myopia_wrap .myopia-hero01{background:url('/common/img/new/revision_myopia_bg.jpg') center no-repeat;}
		.mo_myopia-hero01 img{width:100%;max-height:423px;}

		.myopia_wrap .myopia04 .gray-bg .wsize{top:-126px;}
		.myopia04 .navy-bg{padding-top:107px;}
		.myopia05{padding-top:267px;}
		.myopia05 .cont-desc{padding-bottom:253px;}
		.myopia05 .anchor-arrow{display:inline-block; margin:60px 0 190px;}

		/* jbnoh */
		.pres_kind_list{padding: 20px;}
		.desc_default{height: 260px;}
		.equip_title {height:70px; line-height:70px; text-align:center; font-size:30px; font-weight:700; color:#fff; border:1px solid #b7b7b7;}
		.equip_title.et_one {background-color: #60bae1}
		.equip_title.et_two {background-color: #0b455a}
		.equip_title.et_three {background-color: #6f297b}
		.pres_kind_list .pres_kind_list_item .title_one:after {display:block; content:''; width:100%; height:2px; margin-top:12px; background-color:#60bae1;}
		.pres_kind_list .pres_kind_list_item .title_two:after {display:block; content:''; width:100%; height:2px; margin-top:12px; background-color:#0b455a;}
		.pres_kind_list .pres_kind_list_item .title_three:after {display:block; content:''; width:100%; height:2px; margin-top:12px; background-color:#6f297b;}
		.pres_kind_list .pres_kind_list_item .title.clr {color: #ccc;}
		.title.clr img {max-height: 40px; vertical-align: middle;}
		.pres_kind_list .pres_kind_list_item .desc-sheet {text-align: left; padding-left: 30px;}
		.desc-sheet .desc-sheet-sub {padding-top: 30px;}
		.desc-sheet .desc-sheet-sub.last {padding-bottom: 30px;}
		.desc-sheet-sub .mini {color: #707070; font-size: medium; padding-top: 15px;}

		.pres_kind_list.mo_show .pres_kind_list_item {width: 100%; padding-bottom: 20px;}
		.pres_kind_list.mo_show .desc_default {height: 100%;}
		.pres_kind_list.mo_show .desc-sheet {background: #ebebeb;}
	</style>
</head>
<body>
	<header class="header">
		<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	</header>
	<main>
		<div class="sub subEyecareJoinRetinaRevision revision__dream">
			<h2 class="sub_title">근시 클리닉</h2>

			<div class="page-wrap" style="padding-top: 0;">
				<ul class="sub_tab_menu flex wsize">
					<li rel="myopiaTab" class="active">근시 치료</li>
					<li rel="dreamTab">드림 렌즈</li>
				</ul>

				<div class="tab_contents mt45">
					<%-- 근시 치료 --%>
					<div id="myopiaTab" class="myopia_wrap main-tab tab" style="display:block;">
						<div class="sub_visual myopia-hero01 pc_show"></div>
						<div class="mo_myopia-hero01 mo_show"><img src="" alt=""></div>
						<div class="sub_txt_bar">
							강남그랜드안과는 우리 아이 평생 근시 주치의로 아이들의 시력을 성인이 되어서도 관리합니다.
						</div>

						<div class="myopia01 first-sec txt-center">
							<h4 class="top-tit">시력저하의 원인</h4>
							<h2 class="cont-tit">근시</h2>
							<div class="img-wrap">
								<img src="/common/img/new/01.jpg" alt="">
							</div>
							<p class="cont-desc">
								근시는 물체의 상이 망막의 앞쪽에 맺히는 굴절이상으로
								<br class="br_none_450">
								가까운 물체는 잘 보이지만 먼 곳의 물체는 잘 보이지 않는 상태입니다.
								<span class="space-sm"></span>
								우리나라를 비롯한 아시아계 대부분 아이들이
								<br class="br_none_450">
								근시인 경우가 많으며 소아 근시는 성인 근시와 다르게
								<br class="br_none_450">
								계속 진행되는 경우가 많아 관리 및 치료가 필요합니다.
							</p>
						</div>
						<div class="myopia02 first-sec txt-center">
							<h4 class="top-tit">대표적인</h4>
							<h2 class="cont-tit">근시 발생 원인</h2>
							<div class="img-wrap">
								<img src="/common/img/new/02.jpg" alt="">
							</div>
						</div>
						<div class="myopia03 first-sec txt-center">
							<h4 class="top-tit">성장기 어린이</h4>
							<h2 class="cont-tit">근시 위험성</h2>
							<p class="cont-desc">
								어린이 근시가 위험한 이유는 안축장이 길어짐에 따라
								<br class="br_none_450">
								추후에 발생할 수 있는 합병증 발생 때문입니다.
								<span class="space-sm"></span>
								안구가 길어지고 신장됨에 따라 신경 조직이 얇아지고
								<br class="br_none_450">
								혈류량에 영향을 미쳐 망막박리, 황반변성, 녹내장 등의
								<br class="br_none_450">
								질병이 발생할 수 있습니다.
								<span class="space-sm"></span>
								한번 늘어난 길이는 되돌릴 수 없으므로
								<br class="br_none_450">
								고도 근시로 진행하지 않도록 예방이 중요합니다.
							</p>
							<div class="img-wrap">
								<img src="/common/img/new/03.jpg" alt="">
							</div>
						</div>
						<div class="myopia04 care-sec txt-center">
							<div class="navy-bg">
								<h4 class="top-tit">강남그랜드안과</h4>
								<h2 style="padding-bottom: 222px;">근시 치료 방법</h2>
							</div>
							<div class="gray-bg">
								<div class="wsize">
									<div class="icon-list">
										<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
										<!-- 작업중 jbnoh -->
										<!-- PC -->
										<ul class="pres_kind_list flex_between align-item-start pc_show">
											<li class="pres_kind_list_item">
												<p class="equip_title et_one">드림 렌즈</p>
												<div><img src="/common/img/new/04.jpg" alt="image"></div>
												<p class="title title_one clr"><img src="/common/img/new/07.jpg" alt="image">밤 착용 (수면)</p>
												<p class="desc_default">
													드림 렌즈는 수면 시 착용하는 굴절이상 교정용 특수 콘택트렌즈입니다.
													<span class="txt_space"></span>
													일반 렌즈와 다르게 가운데 부분이 주변부보다 편평해서 자는 동안 편평한 부분이 각막의 볼록한 부분을 변화시켜 근시를 교정합니다.
												</p>
												<p class="title title_one"></p>
												<div class="desc-sheet" style="background: #ebebeb;">
													<div class="desc-sheet-sub">
														<p>치료 효과</p>
														<p class="mini">근시 교정&#183;근시 진행 완화</p>
													</div>
													<div class="desc-sheet-sub">
														<p>난시 교정 완화</p>
														<p class="mini">O</p>
													</div>
													<div class="desc-sheet-sub">
														<p>관리의 난이도</p>
														<p class="mini">++</p>
													</div>
													<div class="desc-sheet-sub">
														<p>사용 시기</p>
														<p class="mini">8시간 이상(수면중)</p>
													</div>
													<div class="desc-sheet-sub">
														<p>가능한 나이</p>
														<p class="mini">협조 가능한 나이부터</p>
													</div>
													<div class="desc-sheet-sub">
														<p>맞춤 처방 주기</p>
														<p class="mini">평균 2년 이상</p>
													</div>
													<div class="desc-sheet-sub last">
														<p>우려되는 점</p>
														<p class="mini">건조증&#183;각막염&#183;결막염</p>
													</div>
												</div>
											</li>
											<li class="pres_kind_list_item">
												<p class="equip_title et_two">마이오가드</p>
												<div><img src="/common/img/new/05.jpg" alt="image"></div>
												<p class="title title_two clr"><img src="/common/img/new/08.jpg" alt="image">잠들기 전</p>
												<p class="desc_default">
													마이오가드는 0.125% 의 저농도 아트로핀 점안액으로 근시 진행 억제를 도와줍니다.
													<span class="txt_space"></span>
													근시 억제 40~70% 효과 인증받았으며, 드림 렌즈와 함께 사용할 수 있는 식품의약품안전처에서 정식으로 허가받은 점안액입니다.
												</p>
												<p class="title title_two"></p>
												<div class="desc-sheet">
													<div class="desc-sheet-sub">
														<p>치료 효과</p>
														<p class="mini">근시 교정&#183;근시 진행 완화</p>
													</div>
													<div class="desc-sheet-sub">
														<p>난시 교정 완화</p>
														<p class="mini">X</p>
													</div>
													<div class="desc-sheet-sub">
														<p>관리의 난이도</p>
														<p class="mini">-</p>
													</div>
													<div class="desc-sheet-sub">
														<p>사용 시기</p>
														<p class="mini">잠들기 전 점안</p>
													</div>
													<div class="desc-sheet-sub">
														<p>가능한 나이</p>
														<p class="mini">만 4세 이상</p>
													</div>
													<div class="desc-sheet-sub">
														<p>맞춤 처방 주기</p>
														<p class="mini">월별 처방 가능</p>
													</div>
													<div class="desc-sheet-sub last">
														<p>우려되는 점</p>
														<p class="mini">빛 번짐&#183;근거리 저하&#183;통증</p>
													</div>
												</div>
											</li>
											<li class="pres_kind_list_item">
												<p class="equip_title et_three">마이사이트 렌즈</p>
												<div><img src="/common/img/new/06.jpg" alt="image"></div>
												<p class="title title_three clr"><img src="/common/img/new/09.jpg" alt="image">낮 착용 (생활)</p>
												<p class="desc_default">
													마이사이트 렌즈는 하루 10시간 착용으로 시력 교정 및 근시 완화를 도와주는 렌즈입니다.
													<span class="txt_space"></span>
													드림 렌즈 착용에 실패한 경우, 수면 시간이 짧아 드림 렌즈로 충분한 효과를 내지 못한 경우, 안경 착용을 싫어하며 아트로핀 치료가 불가능할 때 사용합니다.
												</p>
												<p class="title title_three"></p>
												<div class="desc-sheet" style="background: #ebebeb;">
													<div class="desc-sheet-sub">
														<p>치료 효과</p>
														<p class="mini">근시 교정&#183;근시 진행 완화</p>
													</div>
													<div class="desc-sheet-sub">
														<p>난시 교정 완화</p>
														<p class="mini">X</p>
													</div>
													<div class="desc-sheet-sub">
														<p>관리의 난이도</p>
														<p class="mini">+/-</p>
													</div>
													<div class="desc-sheet-sub">
														<p>사용 시기</p>
														<p class="mini">10시간 이상(생활할 때)</p>
													</div>
													<div class="desc-sheet-sub">
														<p>가능한 나이</p>
														<p class="mini">협조 가능한 나이부터</p>
													</div>
													<div class="desc-sheet-sub">
														<p>맞춤 처방 주기</p>
														<p class="mini">월별 처방 가능</p>
													</div>
													<div class="desc-sheet-sub last">
														<p>우려되는 점</p>
														<p class="mini">건조증&#183;각막염&#183;결막염</p>
													</div>
												</div>
											</li>
										</ul>
										<!-- MO -->
										<ul class="pres_kind_list mo_show">
											<li class="pres_kind_list_item">
												<p class="equip_title et_one">드림 렌즈</p>
												<div><img src="/common/img/new/04.jpg" alt="image"></div>
												<p class="title title_one clr"><img src="/common/img/new/07.jpg" alt="image">밤 착용 (수면)</p>
												<p class="desc_default">
													드림 렌즈는 수면 시 착용하는 굴절이상 교정용 특수 콘택트렌즈입니다.
													<span class="txt_space"></span>
													일반 렌즈와 다르게 가운데 부분이 주변부보다 편평해서 자는 동안 편평한 부분이 각막의 볼록한 부분을 변화시켜 근시를 교정합니다.
												</p>
												<p class="title title_one"></p>
												<div class="desc-sheet" style="background: #ebebeb;">
													<div class="desc-sheet-sub">
														<p>치료 효과</p>
														<p class="mini">근시 교정&#183;근시 진행 완화</p>
													</div>
													<div class="desc-sheet-sub">
														<p>난시 교정 완화</p>
														<p class="mini">O</p>
													</div>
													<div class="desc-sheet-sub">
														<p>관리의 난이도</p>
														<p class="mini">++</p>
													</div>
													<div class="desc-sheet-sub">
														<p>사용 시기</p>
														<p class="mini">8시간 이상(수면중)</p>
													</div>
													<div class="desc-sheet-sub">
														<p>가능한 나이</p>
														<p class="mini">협조 가능한 나이부터</p>
													</div>
													<div class="desc-sheet-sub">
														<p>맞춤 처방 주기</p>
														<p class="mini">평균 2년 이상</p>
													</div>
													<div class="desc-sheet-sub last">
														<p>우려되는 점</p>
														<p class="mini">건조증&#183;각막염&#183;결막염</p>
													</div>
												</div>
											</li>
											<li class="pres_kind_list_item">
												<p class="equip_title et_two">마이오가드</p>
												<div><img src="/common/img/new/05.jpg" alt="image"></div>
												<p class="title title_two clr"><img src="/common/img/new/08.jpg" alt="image">잠들기 전</p>
												<p class="desc_default">
													마이오가드는 0.125% 의 저농도 아트로핀 점안액으로 근시 진행 억제를 도와줍니다.
													<span class="txt_space"></span>
													근시 억제 40~70% 효과 인증받았으며, 드림 렌즈와 함께 사용할 수 있는 식품의약품안전처에서 정식으로 허가받은 점안액입니다.
												</p>
												<p class="title title_two"></p>
												<div class="desc-sheet">
													<div class="desc-sheet-sub">
														<p>치료 효과</p>
														<p class="mini">근시 교정&#183;근시 진행 완화</p>
													</div>
													<div class="desc-sheet-sub">
														<p>난시 교정 완화</p>
														<p class="mini">X</p>
													</div>
													<div class="desc-sheet-sub">
														<p>관리의 난이도</p>
														<p class="mini">-</p>
													</div>
													<div class="desc-sheet-sub">
														<p>사용 시기</p>
														<p class="mini">잠들기 전 점안</p>
													</div>
													<div class="desc-sheet-sub">
														<p>가능한 나이</p>
														<p class="mini">만 4세 이상</p>
													</div>
													<div class="desc-sheet-sub">
														<p>맞춤 처방 주기</p>
														<p class="mini">월별 처방 가능</p>
													</div>
													<div class="desc-sheet-sub last">
														<p>우려되는 점</p>
														<p class="mini">빛 번짐&#183;근거리 저하&#183;통증</p>
													</div>
												</div>
											</li>
											<li class="pres_kind_list_item">
												<p class="equip_title et_three">마이사이트 렌즈</p>
												<div><img src="/common/img/new/06.jpg" alt="image"></div>
												<p class="title title_three clr"><img src="/common/img/new/09.jpg" alt="image">낮 착용 (생활)</p>
												<p class="desc_default">
													마이사이트 렌즈는 하루 10시간 착용으로 시력 교정 및 근시 완화를 도와주는 렌즈입니다.
													<span class="txt_space"></span>
													드림 렌즈 착용에 실패한 경우, 수면 시간이 짧아 드림 렌즈로 충분한 효과를 내지 못한 경우, 안경 착용을 싫어하며 아트로핀 치료가 불가능할 때 사용합니다.
												</p>
												<p class="title title_three"></p>
												<div class="desc-sheet" style="background: #ebebeb;">
													<div class="desc-sheet-sub">
														<p>치료 효과</p>
														<p class="mini">근시 교정&#183;근시 진행 완화</p>
													</div>
													<div class="desc-sheet-sub">
														<p>난시 교정 완화</p>
														<p class="mini">X</p>
													</div>
													<div class="desc-sheet-sub">
														<p>관리의 난이도</p>
														<p class="mini">+/-</p>
													</div>
													<div class="desc-sheet-sub">
														<p>사용 시기</p>
														<p class="mini">10시간 이상(생활할 때)</p>
													</div>
													<div class="desc-sheet-sub">
														<p>가능한 나이</p>
														<p class="mini">협조 가능한 나이부터</p>
													</div>
													<div class="desc-sheet-sub">
														<p>맞춤 처방 주기</p>
														<p class="mini">월별 처방 가능</p>
													</div>
													<div class="desc-sheet-sub last">
														<p>우려되는 점</p>
														<p class="mini">건조증&#183;각막염&#183;결막염</p>
													</div>
												</div>
											</li>
										</ul>
										<!-- 작업중 jbnoh -->
									</div>
								</div>
							</div>
						</div>
						<div class="myopia05 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit">근시 클리닉</h2>
							<p class="cont-desc">
								강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다.
								<br class="br_none_450">
								검사 후 의료진과 일대일 맞춤 상담으로 근시 치료 방법을 결정합니다.
							</p>

							<div class="feature-wrap system-list pc_show">
								<ul class="feature-list">
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg01.png" alt="클리닉1">
											<p>정밀 검사</p>
										</div>
										<p class="feature-desc">
											의료진과 상담 전 검안사와 일대일
											<br class="br_none_450">
											정밀 검사로 고객의 눈 상태를
											<br class="br_none_450">
											확인합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg02.png" alt="클리닉2">
											<p>의료진 상담</p>
										</div>
										<p class="feature-desc">
											검사 결과를 바탕으로 의료진과
											<br class="br_none_450">
											일대일 상담을 진행합니다.
											<span class="space-sm"></span>
											이때 의료진은 고객에게 맞는
											<br class="br_none_450">
											근시 치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/rv_lasik04_bg03.png" alt="클리닉3">
											<p>치료 진행</p>
										</div>
										<p class="feature-desc">
											의료진 상담 시 결정한 방법으로
											<br class="br_none_450">
											치료를 진행합니다.
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
											의료진과 상담 전 검안사와 일대일
											<br class="br_none_450">
											정밀 검사로 고객의 눈 상태를
											<br class="br_none_450">
											확인합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg02 (2).png" alt="클리닉2">
										</div>
										<p class="desc_default">
											검사 결과를 바탕으로 의료진과
											<br class="br_none_450">
											일대일 상담을 진행합니다.
											<span class="txt_space"></span>
											이때 의료진은 고객에게 맞는
											<br class="br_none_450">
											근시 치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/mo_pres_clinic_system_bg03.png" alt="클리닉3">
										</div>
										<p class="desc_default">
											의료진 상담 시 결정한 방법으로
											<br class="br_none_450">
											치료를 진행합니다.
										</p>
									</li>
								</ul>
							</div>

							<div class="link-wrap pc_show">
								<a href="/community/review" class="anchor-arrow">고객 체험기 바로 가기</a>
							</div>
								<ul class="link_box justify-cont-center flex mo_show">
								<li><a href="/community/review" class="btn_detail">고객 체험기 바로 가기</a></li>
							</ul>
						</div>
					</div>
					<%-- /// 근시 치료 --%>

					<%-- 드림 렌즈 --%>
					<div id="dreamTab" class="dream_wrap main-tab tab">
						<div class="sub_visual dream-hero01 pc_show"></div>
						<div class="mo_dream-hero01 mo_show"><img src="/common/img/sub/mo_revision_dream_bg.png" alt=""></div>
						<div class="dream01 first-sec txt-center">
							<ul class="img-list compare-list">
								<li>
									<div class="img-wrap">
										<img src="/common/img/sub/rv_dream01_img01.png" alt="일반">
									</div>
									<h3>일반 렌즈</h3>
								</li>
								<li>
									<div class="img-wrap">
										<img src="/common/img/sub/rv_dream01_img02.png" alt="드림">
									</div>
									<h3 class="color-em">드림 렌즈</h3>
								</li>
							</ul>
							<p class="cont-desc">
								드림 렌즈는 수면 시 착용하는 난시 및 근시 교정용 특수 콘택트렌즈입니다. <br>
								착용한 렌즈가 자는 동안 각막의 중심부를 눌러 굴절력을 낮춰줘 시력을 교정합니다. <br>
								다음 날 아침 일어나 렌즈를 빼면 교정된 시력으로 생활할 수 있습니다.
							</p>
						</div>
						<div class="dream02 gray-bg">
							<div class="wsize">
								<h2>
									드림 렌즈 <br>
									이런 분들에게 추천합니다.
								</h2>
								<ul class="check-list check-icon-list">
									<li>시력 교정 수술이 두려우신 분</li>
									<li>근시가 진행 중인 어린이 및 청소년</li>
									<li>직업상 안경 착용이 힘드신 분</li>
									<li>중증도 이하의 근시와 난시가 있는 분</li>
									<li>기존 콘택트렌즈 착용이 불편한 분</li>
									<li>시력 교정 수술 후 다시 시력이 떨어진 분</li>
								</ul>
							</div>
						</div>
						<div class="dream03 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit">드림 렌즈 종류</h2>
							<p class="cont-desc">
								강남그랜드안과에서는 비수술적인 시력 교정 방법으로 <br>
								어린이, 청소년은 물론 성인까지 안전하게 시력 교정이 가능합니다.
							</p>
							<div class="wsize">
								<div class="tab-menu">
									<ul class="tab-rec-sub">
										<li><a href="#dreamtab0101" class="active">파라곤 CRT</a></li>
										<li><a href="#dreamtab0102">LK CHⅡ</a></li>
										<li><a href="#dreamtab0103">LK Premeir Toric</a></li>
									</ul>
								</div>
								<div class="tab-content">
									<div id="dreamtab0101" class="tab" style="display:block;">
										<div class="tab-cont-wrap">
											<div class="left-cont">
												<img src="/common/img/sub/rv_dream03_tab01.png" alt="">
											</div>
											<ul class="tab-list">
												<li>·  FDA  승인 받은 야간 착용 각막 굴절 교정 렌즈</li>
												<li>· 우수한 산소 투과성으로 착용감 향상</li>
												<li>· 각막 맞춤 시력 교정 가능</li>
												<li>· 근시 및 난시 교정 가능</li>
											</ul>
										</div>
									</div>
									<div id="dreamtab0102" class="tab">
										<div class="tab-cont-wrap">
											<div class="left-cont">
												<img src="/common/img/sub/rv_dream03_tab02.png" alt="">
											</div>
											<ul class="tab-list">
												<li>· 각막 맞춤형으로 착용감 향상 </li>
												<li>· 우수한 산소 투과성 재질 사용</li>
												<li>· 눈물과 융화가 잘되는 탁월한 친수성</li>
												<li>· 뛰어난 내구성으로 장기간 사용 가능 (평균 2~3년)</li>
											</ul>
										</div>
									</div>
									<div id="dreamtab0103" class="tab">
										<div class="tab-cont-wrap">
											<div class="left-cont">
												<img src="/common/img/sub/rv_dream03_tab03.png" alt="">
											</div>
											<ul class="tab-list">
												<li>· 난시 환자용 드림 렌즈</li>
												<li>· 근시 및 중 고도 난시 사용 가능</li>
												<li>· Wide Optical Zone 설계</li>
												<li>· Wide Reverse Zone 설계</li>
											</ul>
										</div>
									</div>
								</div>
								<p class="cont-desc dream03_desc"> ※ 드림 렌즈는 의료기기로 반드시 사용 방법 및 주의사항 안내에 따라 착용해야 합니다. </p>
							</div>
						</div>
						<div class="dream04 care-sec txt-center">
							<div class="navy-bg">
								<h4 class="top-tit">강남그랜드안과</h4>
								<h2 class="cont-tit">드림 렌즈 치료 방법</h2>
							</div>
							<div class="gray-bg">
								<div class="wsize">
									<div class="icon-list">
										<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
										<h4 class="box-tit">수면 중 각막 형태를 변화 시켜 시력 교정</h4>
										<p class="cont-desc cont-desc01">
											강남그랜드안과 드림 렌즈는 전문의 진료 및 안내에 따라 처방합니다. <br>
											드림 렌즈로 각막 형태를 변화해 근시 및 난시를 교정하므로 <br>
											환자는 사용 방법 및 주의사항을 충분히 숙지한 후 사용합니다.
										</p>
										<ul class="num-list care-method">
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_dream_cmethod01.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num01.png" alt="care-num">
												</div>
												<h4>
													시력이 저하된 안구
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_dream_cmethod02.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num02.png" alt="care-num">
												</div>
												<h4>
													취침 전 드림 렌즈 착용
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_dream_cmethod03.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num03.png" alt="care-num">
												</div>
												<h4>
													수면 중 각막 형태가 <br>
													렌즈에 맞게  변형
												</h4>
											</li>
											<li>
												<div class="tit-img-wrap">
													<img src="/common/img/sub/rv_dream_cmethod04.jpg" alt="care-img">
												</div>
												<div class="num-img-wrap">
													<img src="/common/img/sub/rv_lasik03_num04.png" alt="care-num">
												</div>
												<h4>
													기상 후 드림 렌즈 제거로 <br>
													시력 교정 효과
												</h4>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="dream05 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit">드림 렌즈 시스템</h2>
							<p class="cont-desc">
								강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다. <br>
								검사 후 의료진과 일대일 맞춤 상담으로 드림 렌즈를 결정합니다.
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
											이때 의료진은 고객에게 맞는 삽입 <br>
											렌즈를 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/rv_dream05_bg03.png" alt="클리닉3">
											<p>렌즈 착용 및 교육</p>
										</div>
										<p class="feature-desc">
											의료진과 상담 후 검안사의 안내에 따라 <br>
											주의사항 교육 및 렌즈 착용을 <br>
											진행합니다. <br>
											착용 후 다시 한번 렌즈 교육을 받습니다.
										</p>
										<p class="feature-caution">
											※ 렌즈 재고 사항에 따라 당일 착용 <br>
											 불가 시 자택 배송이 <br>
											이뤄질 수 있습니다.
										</p>
									</li>
								</ul>
							</div>
		 					<div class="feature-wrap system-list mo_show">
								<ul class="feature-list">
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/mo_pres_clinic_system_bg01.png" alt="클리닉1">
										</div>
										<p class="feature-desc">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/pres_clinic_system_bg02 (2).png" alt="클리닉2">
										</div>
										<p class="feature-desc">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="space-sm"></span>
											이때 의료진은 고객에게 맞는 삽입 <br>
											렌즈를 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img class="mo_dream_img" src="/common/img/sub/mo_revision_dream.png" alt="클리닉3">
										</div>
										<p class="feature-desc">
											의료진과 상담 후 검안사의 안내에 따라 <br>
											주의사항 교육 및 렌즈 착용을 <br>
											진행합니다. <br>
											착용 후 다시 한번 렌즈 교육을 받습니다.
										</p>
										<p class="feature-caution">
											※ 렌즈 재고 사항에 따라 당일 착용 <br>
											 불가 시 자택 배송이 <br>
											이뤄질 수 있습니다.
										</p>
									</li>
								</ul>
							</div>
							<a href="/community/review" class="anchor-arrow">고객 체험기 바로가기</a>
						</div>

						<%-- 드림 렌즈 주의사항 --%>
						<div class="txt-center"><h2 class="cont-tit">드림 렌즈 주의사항</h2></div>
						<div class="notandum_wrap">
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
						<%-- /// 드림 렌즈 주의사항 --%>
					</div>
					<%-- /// 드림 렌즈 --%>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript">
		// 상단 탭 메뉴
		$(".page-wrap .sub_tab_menu li").click(function () {
			$(".page-wrap .sub_tab_menu li").removeClass("active");
			$(this).addClass("active");
			$(".page-wrap .main-tab.tab").hide();
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn();
		});

		// 드림렌즈 내용 탭 메뉴
		$('.tab-rec-sub li a').on('click', function(e){
			e.preventDefault();
			var tabCont = $(this).attr('href');
			$('.tab-rec-sub li a').removeClass('active');
			$(this).addClass('active');
			$('.tab-content .tab').css('display','none');
			$(tabCont).css('display','block');
		});
	</script>
</body>
</html>