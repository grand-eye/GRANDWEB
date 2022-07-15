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
			<h2 class="sub_title">장비 소개</h2>
			<div class="equip_wrap">
				<ul class="sub_tab_menu flex wsize">
					<li class="active" rel="equip_tab01">검사 장비</li>
					<li rel="equip_tab02">수술 장비</li>
					<li rel="equip_tab03">소독 장비</li>
				</ul>
				<div class="tab_contents mt45">
					<!-- 검사 장비 -->
					<div id="equip_tab01" class="tab tab_exam">
						<div class="sub_visual"></div>
						<div class="sub_txt_bar">고객의 눈에 정확한 맞춤 진단을 위해 <br class="mo_show"><span class="ls0">16</span>단계 <span class="ls0">60</span>가지 정밀 검사를 진행합니다.</div>
						<div class="equip_swiper equip_swiper01 mt120 wsize">
							<h3 class="sub_title02">각막 검사</h3>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div>
											<p class="equip_title">고해상 각막 지형도 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_corn01.png" alt="PENTACAM HR"></div>
											<p class="equip_desc">
												고해상도 초정밀 안구 단층촬영기로<br>
												각막, 홍채 및 수정체를 촬영합니다.<br>
												전방, 후방, 각막 지형 등을 파악해<br>
												정밀하고 정확한 검사가 가능합니다.
											</p>
											<p class="equip_name">PENTACAM HR</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">각막 지형도 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_corn02.png" alt="Topolyzer VARIO"></div>
											<p class="equip_desc">
												각막의 22,000개의 포인트를 측정해<br>
												정확한 각막 분석 자료를 제공합니다.<br>
												시력교정 수술 장비인 EX500과 연동해<br>
												더 명확한 수술이 가능합니다.
											</p>
											<p class="equip_name">Topolyzer VARIO</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">자동 안구 추적 내비게이션</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_corn03.png" alt="Verion"></div>
											<p class="equip_desc">
												백내장 수술을 위한 장비입니다.<br>
												눈을 검사해 얻은 값을 이미지로 보여줘<br>
												인공 수정체를 결정하거나 난시 등에 따른<br>
												위험성을 줄여 수술을 도와줍니다.
											</p>
											<p class="equip_name">Verion</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">각막 내피 세포 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_corn04.png" alt="specular"></div>
											<p class="equip_desc">
												비 접촉으로 각막 내피 세포를 관찰해<br> 
												비교 분석하는 내피 현미경입니다. <br>
												내피 층을 자동 정렬 및 분석해<br> 
												더 신속한 측정이 가능합니다.
											</p>
											<p class="equip_name">specular</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">세극등 현미경 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_corn05.png" alt="slit lamp"></div>
											<p class="equip_desc">
												고 배율 현미경 장비를 사용합니다.<br>
												안구 내, 외부를 아주 자세히 관찰하여<br>
												백내장 등 각막, 전안부 이상을<br>
												확인합니다.
											</p>
											<p class="equip_name">slit lamp</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">초음파 각막 두께 측정기</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_corn06.png" alt="pachymeter"></div>
											<p class="equip_desc">
												점안 마취 후 각막 중심부의 두께를 <br>
												측정하는 검사 장비입니다.<br>
												시력교정 수술 전 각막 두께를 파악해<br>
												수술 방법 및 가능성을 판단합니다.
											</p>
											<p class="equip_name">pachymeter</p>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-pagination mo_show"></div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>

						<div class="equip_swiper equip_swiper02 mt120 wsize">
							<h3 class="sub_title02">망막 검사</h3>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div>
											<p class="equip_title">안구 광학 단층 촬영</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_reti01.png" alt="cirrus oct"></div>
											<p class="equip_desc">
												고해상, 고정밀 안구 광학 단층 촬영기로<br>
												망막, 시신경 등의 조직 구조를<br> 
												확인합니다.<br>
												녹내장 조기진단 등 망막 질환에<br>
												필요한 검사 정보를 제공합니다.
											</p>
											<p class="equip_name">cirrus oct</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">무산동 안저 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_reti02.png" alt="TOPCON TRC-NW400"></div>
											<p class="equip_desc">
												무산동 상태에서 비접촉으로<br>
												안저를 관찰, 촬영하는 장비입니다.<br>
												작은 동공의 결과까지 알 수 있어<br>
												매우 편리하고 정교합니다.
											</p>
											<p class="equip_name">TOPCON TRC-NW400</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">무산동 광각 안저 촬영</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_reti03.png" alt="optos"></div>
											<p class="equip_desc">
												무산동 광각 안저 촬영 장비로<br>
												짧은 시간에 망막을 검사합니다.<br>
												망막의 주변부까지 관찰할 수 있어<br>
												중증 망막질환 검사에도 좋습니다.
											</p>
											<p class="equip_name">optos</p>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-pagination mo_show"></div>
						</div>

						<div class="equip_swiper equip_swiper03 mt120 wsize">
							<h3 class="sub_title02">굴절력 검사</h3>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div>
											<p class="equip_title">자동 굴절 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_refr01.png" alt="NIDEK ARK-1"></div>
											<p class="equip_desc">
												눈의 굴절이상(근시·원시·난시)을<br> 
												검사하여 정밀한  각막의 곡률 반경을<br>
												측정하는 장비로 3D 자동 추적 및 자동<br>
												측정으로 눈동자의 움직임과 위치를<br>
												빠르고 정확하게 측정합니다.
											</p>
											<p class="equip_name">NIDEK ARK-1</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">자동 굴절 검사기</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_refr02.png" alt="CANNON RK-F2"></div>
											<p class="equip_desc">
												근시, 원시, 난시와 같은 굴절 이상 여부를<br>
												측정하는 각막 곡률 반경 측정기입니다.<br>
												동공 반경 2.0mm에 대응할 수 있어<br>
												고령자나 안질환자도 확인 가능합니다.
											</p>
											<p class="equip_name">CANNON RK-F2</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">정점 굴절력 측정 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_refr03.png" alt="Topcon CL-300"></div>
											<p class="equip_desc">
												안경 도수를 알 수 있는<br>
												렌즈 미터 확인 장비입니다.<br>
												고객이 쓰고 있는 안경의 도수가<br>
												잘 맞는지 안 맞는지를 구분합니다.
											</p>
											<p class="equip_name">Topcon CL-300</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">타각적 굴절 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_refr04.png" alt="RETINOSCOPE"></div>
											<p class="equip_desc">
												망막 검영기라고 불리는 검사 장비를<br>
												사용해서 눈의 굴절력을 검사합니다.<br>
												시력검사실에서 검안사가 직접 진행하며<br>
												굴절 정도의 값을 측정합니다.
											</p>
											<p class="equip_name">RETINOSCOPE</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">자각적 굴절 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_refr05.png" alt="mr"></div>
											<p class="equip_desc">
												환자 개개인의 최대 교정 시력 측정이<br>
												가능하며 원추 각막과 같은 각막 질환이<br>
												있을 경우 조기 별견이 가능합니다.
											</p>
											<p class="equip_name">mr</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">조절 마비 굴절 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_refr06.png" alt="cr"></div>
											<p class="equip_desc">
												눈 안의 굴절력을 조정할 수 있는 근육을<br>
												이완시켜, 환자 개개인이 가지고 있는<br>
												실제 도수를 확인할 수 있습니다.
											</p>
											<p class="equip_name">cr</p>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-pagination mo_show"></div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>

						<div class="equip_swiper equip_swiper04 mt120 wsize">
							<h3 class="sub_title02">안구 측정 &middot; 안압 &middot; 기능 검사</h3>
							<div class="swiper-container ">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div>
											<p class="equip_title">비접촉 초정밀 수술 검안</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_eyeb01.png" alt="IOL master 700"></div>
											<p class="equip_desc">
												초정밀 레이저 백내장 수술용 검안기로<br>
												비접촉으로 안구 구조를 측정합니다.<br>
												기존 초음파 검사보다 5배 이상 정확하며<br>
												수술에 필요한 신뢰도 있는 검사가 가능합니다.
											</p>
											<p class="equip_name">IOL master 700</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">시야 검사기</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_eyeb02.png" alt="Zeiss HFA 830"></div>
											<p class="equip_desc">
												물체를 볼 수 있는 범위 측정 장비로<br>
												주로 녹내장 진단에 사용합니다.<br>
												최신식 시야 검사 기기 모델로<br>
												검사 시간 단축에 도움 됩니다.
											</p>
											<p class="equip_name">Zeiss HFA 830</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">자동 안압 검사</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_ex_img_eyeb03.png" alt="TOPCON CT-80"></div>
											<p class="equip_desc">
												공기를 이용해 안압을 측정하는<br>
												자동 안압 측정 장비입니다.<br>
												압력 측정하는 데 속도가 빠르고<br>
												불편함이 작아 편리합니다.
											</p>
											<p class="equip_name">TOPCON CT-80</p>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-pagination mo_show"></div>
						</div>
					</div>
					<!--// 검사 장비 -->

					<!-- 수술 장비 -->
					<div id="equip_tab02" class="tab tab_oper">
						<div class="sub_visual"></div>
						<div class="sub_txt_bar">강남그랜드안과는 정밀하면서도 안전한 눈 수술을 위해 최첨단 장비를 보유하고 있습니다.</div>
						<div class="oper_box wsize mt120">
							<h3 class="sub_title02">고난도 수준의 의료 서비스를 제공하는<br><span class="blue">강남그랜드안과 수술 진료</span></h3>
							<div class="img ta_c"><img class="pc_show" src="/common/img/sub/grand_equip_op_img_info.png" alt="첨단 장비 1:1 맞춤 관리 시스템정밀하고 안전한 진료를 위해 세계적으로 검증된 수술 장비를 사용합니다. 개개인에게 맞는 편안한 수준을 위해 끊임없이 배우고 발전합니다."><img  class="mo_show" src="/common/img/sub/grand_equip_op_img_info_mo.png" alt="첨단 장비 1:1 맞춤 관리 시스템정밀하고 안전한 진료를 위해 세계적으로 검증된 수술 장비를 사용합니다. 개개인에게 맞는 편안한 수준을 위해 끊임없이 배우고 발전합니다."></div>
							<p class="txt-cont ta_c mo_show">
								정밀하고 안전한 진료를 위해 <br>
								세계적으로 검증된 수술 장비를 사용합니다. <br>
								개개인에게 맞는 편안한 수준을 위해 끊임없이 배우고 발전합니다.
							</p>
							<a href="/presbyopia/premium" class="btn_detail">프리미엄 노안&middot;백내장 자세히 보기</a>
							<div class="equip_swiper equip_swiper05 e_swiper0201">
								<h3 class="sub_title02">맞춤형 백내장 레이저 장비</h3>
								<div class="swiper-container ">
									<div class="swiper-wrapper">
										<div class="swiper-slide">
											<div>
												<p class="equip_title">첨단 지능형 초음파 수술</p>
												<div class="equip_img"><img src="/common/img/sub/grand_equip_op_img_cata01.png" alt="centurion"></div>
												<p class="equip_desc">
													센츄리온은 자동 안압 조절 센서를 구비한<br>
													인공 지능형 백내장 수술 장비입니다.<br>
													눈 상태 변화에 따른 맞춤형 조절이<br>
													능해 안정적이면서도 빠른 수술이 가능합니다.
												</p>
												<p class="equip_name">centurion</p>
											</div>
										</div>
										<div class="swiper-slide">
											<div>
												<p class="equip_title">펨토 레이저를 이용한 수술</p>
												<div class="equip_img"><img src="/common/img/sub/grand_equip_op_img_cata02.png" alt="FEMTO LDV Z8"></div>
												<p class="equip_desc">
													펨토레이저 Z8은 안정성을 인증받은<br>
													최신식 레이저 백내장 수술 장비입니다.<br>
													기존 레이저보다 약 100배 빠른 속도로<br>
													수술 시간 단축과 견고함을 자랑합니다.
												</p>
												<p class="equip_name">FEMTO LDV Z8</p>
											</div>
										</div>
										<div class="swiper-slide">
											<div>
												<p class="equip_title">자동 안구 추적 내비게이션</p>
												<div class="equip_img"><img src="/common/img/sub/grand_equip_op_img_cata03.png" alt="verion"></div>
												<p class="equip_desc">
													베리온은 자동 안구 추적 내비게이션으로<br>
													백내장 수술의 오차를 줄여주는 <br>
													장비입니다. 눈을 촬영해서 얻은 측정값을 <br>
													이미지화해서 인공수정체 선택 및 수술을 <br>
													돕습니다.
												</p>
												<p class="equip_name">verion</p>
											</div>
										</div>
										<div class="swiper-slide">
											<div>
												<p class="equip_title">첨단 수술 현미경</p>
												<div class="equip_img"><img src="/common/img/sub/grand_equip_op_img_cata04.png" alt="OPMI LUMERA I"></div>
												<p class="equip_desc">
													안과 전용 수술 현미경 중 상위 모델로 <br>
													탁월한 시야 확보 기능으로 안과 수술에 <br>
													적용되는 장비입니다. <br>
													수정체 경화가 심한 까다로운 백내장에<br>
													안전하고 정밀한 수술이 가능합니다.
												</p>
												<p class="equip_name">OPMI LUMERA I</p>
											</div>
										</div>
									</div>
								</div>
								<div class="swiper-pagination mo_show"></div>
								<div class="swiper-button-prev"></div>
								<div class="swiper-button-next"></div>
							</div>
						</div>

						<div class="oper_ex500_wrap">
							<div class="oper_ex500_box">
								<div class="wsize">
									<h3 class="sub_title02"><span class="yellow">강남에서 유일하게 보유한</span><br><span class="blue">2021년형 EX500 White</span></h3>
									<ul class="tag_box">
										<li># 초고도 근시 절대 강자</li>
										<li># 절삭량 최소</li>
										<li># 무 접촉 라섹</li>
										<li># 올레이저</li>
									</ul>
									<div class="img">
										<img class="pc_show" src="/common/img/sub/grand_equip_op_img_ex500.png" alt="ex500">
									</div>
									<div class="mark_new">NEW</div>
								</div>
							</div>
						</div>

						<div class="oper_list_box">
							<ul class="flex_between wsize">
								<li>
									<div class="top"><img src="/common/img/sub/grand_equip_op_img_FDA.png" alt="FDA"></div>
									<div class="txt">안정성과 효능을 인증</div>
								</li>
								<li>
									<div class="top"><span>98</span>%</div>
									<div class="txt">환자의 만족도</div>
								</li>
								<li>
									<div class="top"><span>35</span>%</div>
									<div class="txt">수술 시간 단축</div>
								</li>
								<li>
									<div class="top"><span>44</span>%</div>
									<div class="txt">수술 후 통증 감소</div>
								</li>
								<li>
									<div class="top"><span>78</span>%</div>
									<div class="txt">상피세포 상처 크기 감소</div>
								</li>
							</ul>
						</div>

						<a href="javascript:void(0)" class="btn_detail mt90">프리미엄 맞춤 교정술 자세히 보기</a>

						<div class="equip_swiper equip_swiper06 mt120 wsize">
							<h3 class="sub_title02">시력 교정&middot;시술 장비</h3>
							<div class="swiper-container ">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div>
											<p class="equip_title">개인별 맞춤 시력 교정</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_op_img_corr01.png" alt="2021 - ex 500 WHITE"></div>
											<p class="equip_desc">
												미국 FDA에서 안정성을 인증받은<br>
												최상위 시력교정용 수술 장비입니다.<br>
												빠른 레이저 조사로 수술 시간을 단축하고<br>
												고차원 안구추적 장치로 넓은 교정 범위를 제공합니다.
											</p>
											<p class="equip_name">2021 - ex 500 WHITE</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">펨토 레이저를 이용한 수술</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_op_img_corr02.png" alt="FEMTO LDV Z8"></div>
											<p class="equip_desc">
												펨토레이저 Z8은 안정성을 인증받은<br>
												최신식 레이저 백내장 수술 장비입니다.<br>
												기존 레이저보다 약 100배 빠른 속도로<br>
												수술 시간 단축과 견고함을 자랑합니다.
											</p>
											<p class="equip_name">FEMTO LDV Z8</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">후발성 백내장 치료 레이저</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_op_img_corr03.png" alt="ND/YAG "></div>
											<p class="equip_desc">
												후발성 백내장 치료에 사용하는 레이저<br>
												시술 장비입니다.<br>
												세극등 장비에 턱을 고정하고 간단한 <br>
												이저 치료를 진행합니다.
											</p>
											<p class="equip_name">ND/YAG</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">망막 치료 레이저</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_op_img_corr04.png" alt="532 green laser"></div>
											<p class="equip_desc">
												망막 질환 및 녹내장 치료 및 예방에<br>
												사용하는 레이저 시술 장비입니다.<br>
												우수한 성능을 입증받은 장비로<br>
												안정성을 보장합니다.
											</p>
											<p class="equip_name">532 green laser</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">안구 건조증 레이저 치료</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_op_img_corr05.png" alt="Aqua cel IPL"></div>
											<p class="equip_desc">
												안구건조증 치료에 사용하는 레이저 시술<br>
												장비입니다.<br>
												굳어있는 마이봄샘의 기름을 녹여 <br>
												조증을 치료하고 개선합니다.
											</p>
											<p class="equip_name">Aqua cel IPL</p>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-pagination mo_show"></div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>
					</div>
					<!--// 수술 장비 -->

					<!-- 소독 장비 -->
					<div id="equip_tab03" class="tab tab_disi">
						<div class="sub_visual"></div>
						<div class="sub_txt_bar">강남그랜드안과는 체계적인 멸균 프로세스를 갖추었으며, 개원 이래 현재까지 안내염 발생 0%를 유지하고 있습니다.</div>
						<div class="wsize mt120">
							<h3 class="sub_title02">의료 기구부터 원내 환경까지 체계적인<br><span class="blue">강남그랜드안과 멸균 소독 시스템</span></h3>
							<div class="img mt90"><img class="pc_show" src="/common/img/sub/grand_equip_di_img.png" alt="초고온/고압 멸균소독 멸균시스템으로 감염원 박멸 멸균 정수를 사용하여 의료진 손 세척"><img class="mo_show" src="/common/img/sub/grand_equip_di_img_mo.png" alt="초고온/고압 멸균소독 멸균시스템으로 감염원 박멸 멸균 정수를 사용하여 의료진 손 세척"></div>
						</div>

						<div class="equip_swiper equip_swiper00 mt170 wsize">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div>
											<p class="equip_title">고압 증기 멸균기</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_di_img_ster01.png" alt="ss65"></div>
											<p class="equip_desc">
												고열 스팀으로 의료 기구에 묻은<br>
												세균 및 미생물을 제거하는 멸균기입니다.<br>
												저온에서 멸균하는 저온 멸균법으로<br>
												수술 및 시술 도구를 관리합니다.
											</p>
											<p class="equip_name">ss65</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">플라즈마 멸균기</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_di_img_ster02.png" alt="MPS30"></div>
											<p class="equip_desc">
												의료기구의 안전한 관리를 위한<br>
												저온 멸균 시스템 멸균기입니다.<br>
												선 진공 방식으로 확실하게 공기를 <br>
												배제해 더 청결한 시술 도구를 관리합니다.
											</p>
											<p class="equip_name">MPS30</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div>
											<p class="equip_title">멸균 소독기</p>
											<div class="equip_img"><img src="/common/img/sub/grand_equip_di_img_ster03.png" alt="statim"></div>
											<p class="equip_desc">
												카세트 방식으로 미국 FDA 인증받은<br>
												고성능 진공 멸균 소독기입니다.<br>
												완벽한 소독 온도를 유지하는<br>
												최적의 살균 시스템으로 소독합니다.
											</p>
											<p class="equip_name">statim</p>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-pagination mo_show"></div>
						</div>
					</div>
					<!--// 소독 장비 -->
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
</body>
</html>