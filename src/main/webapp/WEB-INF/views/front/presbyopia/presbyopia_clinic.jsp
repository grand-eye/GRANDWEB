<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub presbyopia__clinic">
			<h2 class="sub_title">노안 &middot; 백내장 클리닉</h2>
			<div class="pres_wrap">
				<ul class="sub_tab_menu flex wsize mt90">
					<li class="active" rel="pres01">노안</li>
					<li rel="pres02">백내장</li>
				</ul>
				<div class="tab_contents mt45">
					<!-- 노안 -->
					<div id="pres01" class="tab tab_pres">
						<div class="sub_visual">
							<span class="txt fc_white">가까운 것이 <br class="mo_show">보기 불편해졌다.</span>
						</div>
						<div class="pres_list_box wsize02">
							<h3 class="sub_title01"><span>노화로 인한 시력 감소</span>노안</h3>
							<p class="sub_desc02">노안은 노화 현상 중 하나로 <br class="mo_show">수정체의 탄성력이 떨어져 발생합니다.<br>
							나이가 들면 자연스럽게 수정체의 조절력이 <br class="mo_show">감소해 초점 맞추기가 어려워집니다.<br>
							잘 보였던 근거리의 물체가 서서히 보이지 않는 <br class="mo_show">증상이 대표적입니다.
							</p>
							<ul class="pres_list flex_between ta_c">
								<li class="list01">
									<div><img src="/common/img/sub/pres_clinic_img_pres01.png" alt="정상시야"></div>
									<span class="title">정상 시야</span>
								</li>
								<li class="list02">
									<div><img src="/common/img/sub/pres_clinic_img_pres02.png" alt="노안시야"></div>
									<span class="title pres">노안 시야</span>
								</li>
							</ul>
						</div>
						<div class="wsize pt230">
							<h3 class="sub_title01"><span>시야에 따른</span>노안 종류</h3>
							<ul class="pres_kind_list flex_between align-item-start pc_show">
								<li class="pres_kind_list_item">
									<div><img src="/common/img/sub/pres_clinic_img_kind01.png" alt="정시형"></div>
									<p class="title">정시형</p>
									<p class="desc_default">
										먼 거리에 있는 물체는 잘 보이지만 돋보기 도움 없이는 근거리 물체가 잘 보이지 않는 증상입니다.<br>
										<span class="txt_space"></span>
										근거리 물체를 보기 위해서는 돋보기 착용이 필요합니다.
									</p>
									<div class="img"><img src="/common/img/sub/pres_clinic_img_kind01_info.png" alt="정시형 시야"></div>
								</li>
								<li class="pres_kind_list_item">
									<div><img src="/common/img/sub/pres_clinic_img_kind02.png" alt="근시형"></div>
									<p class="title">근시형</p>
									<p class="desc_default">원거리에 있는 물체를 보기 위해 안경을 착용하면 먼 거리는 잘 보이지만, 근거리 물체를 보기 위해서는 안경을 벗고 봐야 하는 증상입니다.</p>
									<div class="img"><img src="/common/img/sub/pres_clinic_img_kind02_info.png" alt="근시형 시야"></div>
									
								</li>
								<li class="pres_kind_list_item">
									<div><img src="/common/img/sub/pres_clinic_img_kind03.png" alt="원시형"></div>
									<p class="title">원시형</p>
									<p class="desc_default">
										원거리 근거리 모두 잘 보였으나 노안이 찾아오면서 전체적인 조절력이 떨어진 상태입니다.<br>
										<span class="txt_space"></span>
										평소 가깝거나 먼 거리의 물체가 잘 보이지 않아 근거리용, 원거리용 안경이 필요합니다.
									</p>
									<div class="img"><img src="/common/img/sub/pres_clinic_img_kind03_info.png" alt="원시형 시야"></div>
								</li>
							</ul>

 							<ul class="pres_kind_list flex_between mo_show">
								<li class="pres_kind_list_item">
									<p class="title">정시형</p>
									<div><img src="/common/img/sub/pres_clinic_img_kind01.png" alt="정시형"></div>
									<p class="desc_default">
										먼 거리에 있는 물체는 잘 보이지만 돋보기 도움 없이는 근거리 물체가 잘 보이지 않는 증상입니다.<br>
										<span class="txt_space"></span>
										근거리 물체를 보기 위해서는 돋보기 착용이 필요합니다.
									</p>
									<div class="img"><img src="/common/img/sub/pres_clinic_img_kind01_info.png" alt="정시형 시야"></div>
								</li>
								<li class="pres_kind_list_item">
 									<p class="title">근시형</p>
									<div><img src="/common/img/sub/pres_clinic_img_kind02.png" alt="근시형"></div>
									<p class="desc_default">원거리에 있는 물체를 보기 위해 안경을 착용하면 먼 거리는 잘 보이지만, 근거리 물체를 보기 위해서는 안경을 벗고 봐야 하는 증상입니다.</p>
									<div class="img"><img src="/common/img/sub/pres_clinic_img_kind02_info.png" alt="근시형 시야"></div>
									
								</li>
								<li class="pres_kind_list_item">
									<p class="title">원시형</p>
									<div><img src="/common/img/sub/pres_clinic_img_kind03.png" alt="원시형"></div>
									<p class="desc_default">
										원거리 근거리 모두 잘 보였으나 노안이 찾아오면서 전체적인 조절력이 떨어진 상태입니다.<br>
										<span class="txt_space"></span>
										평소 가깝거나 먼 거리의 물체가 잘 보이지 않아 근거리용, 원거리용 안경이 필요합니다.
									</p>
									<div class="img"><img src="/common/img/sub/pres_clinic_img_kind03_info.png" alt="원시형 시야"></div>
								</li>
							</ul>
						</div>
						<div class="wsize pt230 pb230">
							<h3 class="sub_title01"><span>대표적인</span>노안 증상</h3>
							<ul class="sympo_list mt115">
								<li class="flex_between">
									<div class="txt_box">
										<span class="num"><img src="/common/img/sub/pres_clinic_img_num01.png" alt="01"></span>
										<p class="target">40대 이상</p>
										<p class="desc_default">
											노안 증상은 대개 40대부터 근거리 시력이 떨어지기 시작합니다.<br>
											단, 직·간접적인 영향에 따라 나타나는 시기, 원인 등에는 차이가 있을 수 있습니다.
										</p>
									</div>
									<div class="img_box"><img src="/common/img/sub/pres_clinic_img_symptom01.png" alt="40대 이상"></div>
								</li>
								<li class="flex_between">
									<div class="img_box"><img src="/common/img/sub/pres_clinic_img_symptom02.png" alt="근거리 시야 흐림"></div>
									<div class="txt_box">
										<span class="num"><img src="/common/img/sub/pres_clinic_img_num02.png" alt="02"></span>
										<p class="target">근거리 시야 흐림</p>
										<p class="desc_default">
											근거리의 물체는 보기 힘들고 비교적 원거리의 물체는 잘 보입니다.
										</p>
									</div>
								</li>
								<li class="flex_between">
									<div class="txt_box">
										<span class="num"><img src="/common/img/sub/pres_clinic_img_num03.png" alt="03"></span>
										<p class="target">초점 전환 이상</p>
										<p class="desc_default">
											근거리와 원거리를 번갈아 볼 때 초점 전환이 늦어지는 현상이 발생합니다.
										</p>
									</div>
									<div class="img_box"><img src="/common/img/sub/pres_clinic_img_symptom03.png" alt="초점 전환 이상"></div>
								</li>
								<li class="flex_between">
									<div class="img_box"><img src="/common/img/sub/pres_clinic_img_symptom04.png" alt="눈의 피로함 두통"></div>
									<div class="txt_box">
										<span class="num"><img src="/common/img/sub/pres_clinic_img_num04.png" alt="04"></span>
										<p class="target">눈의 피로함 &middot; 두통</p>
										<p class="desc_default">
											어두운 곳에서 글자를 읽을 때 <br>눈이 쉽게 피로하며 근거리 작업 시 두통(어지럼증)이 생길 때가 있습니다.
										</p>
									</div>
								</li>
							</ul>
						</div>

						<div class="pres_treat">
							<div class="wsize">
								<h3 class="sub_title01 fc_white"><span>강남그랜드안과</span>노안 치료 방법</h3>
								<div class="pres_treat_box flex_between">
									<div class="box non">
										<div class="num ta_c"><span>비수술 교정</span></div>
										<div>
											<p class="title">돋보기 ㅣ 다초점 안경 &middot; 렌즈</p>
											<div class="img"><img src="/common/img/sub/pres_clinic_img_treat01.png" alt="돋보기"></div>
											<p class="desc_default">노안을 개선하고 싶지만 수술할 수 없는 상태 또는 수술 진행이 부담스러우신 분들을 위한 치료 방법입니다.</p>
										</div>
									</div>
									<div class="box sur">
										<div class="num"><span>노안 교정 수술</span></div>
										<div class="flex_between align-item-start">
											<div class="box_inr">
												<p class="title title01">모노 비전 ㅣ 노안 라식 &middot; 라섹</p>
												<div class="img"><img src="/common/img/sub/pres_clinic_img_treat02.png" alt="모노 비전"></div>
												<p class="desc_default">
													노안 증상은 있지만, 백내장은 없는 경우 주로 진행하는 치료 방법입니다.<br>
													<span class="txt_space"></span>
													레이저로 각막을 절삭해 시력을 교정합니다. 주시안과 비주시안에 각각 다르게 교정하는 것이 특징입니다.
												</p>
											</div>
											<div class="box_inr">
												<p class="title title02">다초점 인공 수정체 삽입술</p>
												<div class="img"><img src="/common/img/sub/pres_clinic_img_treat03.png" alt="다초점 인공 수정체 삽입술"></div>
												<p class="desc_default">
													노안으로 시력 저하가 심하거나 백내장이 있는 경우 주로 진행하는 치료 방법입니다.<br>
													<span class="txt_space"></span>
													다초점 인공 수정체 삽입 수술을 통해 노안, 백내장, 난시 등 고객의 눈 상태에 따라 렌즈를 결정해 수술합니다.
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="pres_system ta_c pt230">
							<h3 class="sub_title01"><span>강남그랜드안과</span>노안 클리닉 시스템</h3>
							<p class="sub_desc02">
								강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다.<br>
								검사 후 의료진과 일대일 맞춤 상담으로 노안 치료 방법을 결정합니다.
							</p>
							<div class="system_list_box pc_show">
								<ul class="system_list">
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg01.png" alt="">
											<p>정밀 검사</p>
										</div>
										<p class="desc_default">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg02.png" alt="">
											<p>의료진 상담</p>
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
											<img src="/common/img/sub/pres_clinic_system_bg03.png" alt="">
											<p>수술 진행</p>
										</div>
										<p class="desc_default">
											의료진 상담 시 결정한 치료 방법에<br> 
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
							<div class="system_list_box mo_show">
								 <ul class="system_list">
									<li>
										<div class="title_box">
											<img src="/common/img/sub/mo_pres_clinic_system_bg01.png" alt="">
										</div>
										<p class="desc_default">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg02 (2).png" alt="">
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
											<img src="/common/img/sub/mo_pres_clinic_system_bg03.png" alt="">
										</div>
										<p class="desc_default">
											의료진 상담 시 결정한 치료 방법에<br> 
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
   							
						</div>

						<ul class="link_box justify-cont-center flex">
							<li><a href="/presbyopia/premium" class="btn_detail">프리미엄 노안 &middot; 백내장 바로 가기</a></li>
							<li><a href="/community/review" class="btn_detail">고객 체험기 바로 가기</a></li>
						</ul>

					</div>
					<!--// 노안 -->

					<!-- 백내장 -->
					<div id="pres02" class="tab tab_cata">
							<div class="sub_visual">
								<span class="txt fc_gray">눈 앞이 흐리고 뿌옇게 보이기 시작했다.</span>
							</div>
						<div class="pres_list_box wsize02">
							<h3 class="sub_title01"><span>수정체 혼탁으로 인한 안질환</span>백내장</h3>
							<p class="sub_desc02">백내장은 투명했던 수정체가 점차 혼탁해지고 하얗게 변합니다.<br>
							혼탁해진 수정체는 빛을 제대로 통과시키지 못해 사물이 뿌옇게 보입니다.<br>
							대개 나이가 들면서 발생하지만 노안과는 다른 안질환입니다.
							</p>
							<ul class="pres_list flex_between ta_c cata_list">
								<li>
									<div><img src="/common/img/sub/pres_cata_img_cata01.jpg" alt="정상 시야"></div>
									<span class="title">정상 시야</span>
									<div><img src="/common/img/sub/pres_cata_img_cata01_e.png" alt="정상 수정체"></div>
								</li>
								<li class="list02">
									<div><img src="/common/img/sub/pres_cata_img_cata02.jpg" alt="백내장 시야"></div>
									<span class="title pres">백내장 시야</span>
									<div><img src="/common/img/sub/pres_cata_img_cata02_e.png" alt="백내장 수정체"></div>
								</li>
							</ul>
						</div>

						<div class="cata_swiper pt230 wsize">
							<h3 class="sub_title01"><span>원인에 따른</span>백내장 종류</h3>
							<div class="img"><img src="/common/img/sub/pres_cata_img_kind01.png" alt="백내장"></div>
							<div class="swiper-container">
								<div class="swiper-wrapper pres_kind_list">
									<div class="swiper-slide">
										<div class="pres_kind_list_item">
											<p class="title">노인성</p>
											<p class="desc_default">
												노화로 점차 수정체가 투명성을 잃어가는 질환입니다.<br>
												50세부터는 거의 모든 사람에게서 백내장이 시작되지만 그렇다고 모든 사람에게 시력 감소가 발생하는 것은 아닙니다.
											</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="pres_kind_list_item">
											<p class="title">외상성</p>
											<p class="desc_default">
												외상으로 수정체가 파열되거나 파열되지 않았어도
												타박으로 인해 수정체 혼탁이 온 경우입니다.<br>
												안구 내 다른 부분 특히 망막에 손상이 있는<br>
												경우가 흔하므로 수술 후 시력 회복이 좋은 편은 아닙니다.											
											</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="pres_kind_list_item">
											<p class="title">합병성</p>
											<p class="desc_default">
												포도막염, 녹내장, 망막박리, 유리체의 변성 및 출혈,
												약제의 부작용 등으로 인해 수정체에 혼탁이 온 경우입니다.<br>
												백내장 수술이 잘 되었더라도 합병된 질환 여부에 따라 시력 회복에 차이가 있을 수 있으며 수술 후 문제 발생 빈도도 다른 경우보다 높은 편입니다.
											</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="pres_kind_list_item">
											<p class="title">후발성</p>
											<p class="desc_default">
												백내장 수술 시 인공수정체를 고정하기 위해
												남겨둔 후낭의 얇은 막에 먼지 같은 혼탁이 와<br>
												시력 감소가 발생한 경우입니다. <br>
												야그레이저란 장비를 이용해 간단히 치료하면
												떨어졌던 시력이 회복됩니다.
											</p>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="pres_kind_list_item">
											<p class="title">선천성</p>
											<p class="desc_default">
												정확한 원인은 알 수 없으나 가족력이나
												전신질환을 가지고 있는 경우 동반될 수 있습니다.
												신생아의 경우 태내 감염, 염색체 이상 등으로
												발생할 수 있으며 방치 시 약시에 빠지기 쉬워<br>
												발견 즉시 빨리 수술하는 것이 좋습니다.
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>

						<div class="wsize pt230 pb230">
							<h3 class="sub_title01"><span>대표적인</span>백내장 증상</h3>
							<ul class="sympo_list mt115">
								<li class="flex_between">
									<div class="txt_box">
										<span class="num"><img src="/common/img/sub/pres_clinic_img_num01.png" alt="01"></span>
										<p class="target">시력 감소</p>
										<p class="desc_default">
											초기에는 먼 거리 시력이 <br>
											약간 떨어진 듯 느끼다 심한 <br>
											시력 저하가 진행됩니다.
										</p>
									</div>
									<div class="img_box"><img src="/common/img/sub/pres_cata_img_symptom01.png" alt="시력 감소"></div>
								</li>
								<li class="flex_between">
									<div class="img_box"><img src="/common/img/sub/pres_cata_img_symptom02.png" alt="안구 혼탁"></div>
									<div class="txt_box">
										<span class="num"><img src="/common/img/sub/pres_clinic_img_num02.png" alt="02"></span>
										<p class="target">안구 혼탁</p>
										<p class="desc_default">
											외관상으로 맑게 보이던 수정체가 점차 하얗게 보입니다.
										</p>
									</div>
								</li>
								<li class="flex_between">
									<div class="txt_box">
										<span class="num"><img src="/common/img/sub/pres_clinic_img_num03.png" alt="03"></span>
										<p class="target">단안 복시</p>
										<p class="desc_default">
											한 쪽 눈으로 물체를 볼 때<br> 두개로 겹쳐 보입니다.
										</p>
									</div>
									<div class="img_box"><img src="/common/img/sub/pres_cata_img_symptom03.png" alt="단안 복시"></div>
								</li>
								<li class="flex_between">
									<div class="img_box"><img src="/common/img/sub/pres_cata_img_symptom04.png" alt="눈부심"></div>
									<div class="txt_box">
										<span class="num"><img src="/common/img/sub/pres_clinic_img_num04.png" alt="04"></span>
										<p class="target">눈부심</p>
										<p class="desc_default">
											밝은 빛을 볼 때 눈부심이 <br>강하게 느껴집니다.
										</p>
									</div>
								</li>
							</ul>
						</div>

						<div class="care_sec ta_c">
							<div class="bg_navy">
								<h3 class="sub_title01 fc_white"><span>강남그랜드안과</span>백내장 치료 방법</h3>
							</div>
							<div class="care_sec_inr bg_gray">
								<div class="cata_treat_inr wsize">
									<div><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
									<p class="title">다초점 인공 수정체 삽입술</p>
									<div><img src="/common/img/sub/pres_cata_img_treat00.png" alt="다초점 인공 수정체 삽입술"></div>
									<p class="desc_default">백내장 치료의 핵심은 다초점 인공수정체 삽입술입니다.<br>
									안약으로 진행 속도를 늦출 수 있지만 본질적인 해결책은 아닙니다.<br>
									우리 눈의 수정체를 대체하는 다초점 인공수정체를 삽입해 시력을 개선합니다.</p>
									<ul class="cata_treat_list flex_between align-item-start">
										<li>
											<div class="img"><img src="/common/img/sub/pres_cata_img_treat01.png" alt="레이저를 이용한 각막 절개"></div>
											<div class="num"><img src="/common/img/sub/rv_lasik03_num01.png" alt="01"></div>
											<p class="list_title">레이저를 이용한 각막 절개</p>
										</li>
										<li>
											<div class="img"><img src="/common/img/sub/pres_cata_img_treat02.png" alt="레이저를 이용한 각막 절개"></div>
											<div class="num"><img src="/common/img/sub/rv_lasik03_num02.png" alt="02"></div>
											<p class="list_title">레이저로 수정체에 원형으로<br> 전낭 절개</p>
										</li>
										<li>
											<div class="img"><img src="/common/img/sub/pres_cata_img_treat03.png" alt="레이저를 이용한 각막 절개"></div>
											<div class="num"><img src="/common/img/sub/rv_lasik03_num03.png" alt="03"></div>
											<p class="list_title">레이저로 혼탁한 수정체 잘게 조각</p>
										</li>
										<li>
											<div class="img"><img src="/common/img/sub/pres_cata_img_treat04.png" alt="레이저를 이용한 각막 절개"></div>
											<div class="num"><img src="/common/img/sub/rv_lasik03_num04.png" alt="04"></div>
											<p class="list_title">조각 낸 수정체 제거</p>
										</li>
										<li>
											<div class="img"><img src="/common/img/sub/pres_cata_img_treat05.png" alt="레이저를 이용한 각막 절개"></div>
											<div class="num"><img src="/common/img/sub/rv_lasik03_num05.png" alt="05"></div>
											<p class="list_title">인공수정체 삽입</p>
										</li>
										<li>
											<div class="img"><img src="/common/img/sub/pres_cata_img_treat06.png" alt="레이저를 이용한 각막 절개"></div>
											<div class="num"><img src="/common/img/sub/rv_lasik03_num06.png" alt="06"></div>
											<p class="list_title">수술 후 초점이 망막에 맺힌<br> 상태 확인</p>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="pres_system ta_c pt230">
							<h3 class="sub_title01"><span>강남그랜드안과</span>백내장 클리닉 시스템</h3>
							<p class="sub_desc02">
								강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다.<br>
								검사 후 의료진과 일대일 맞춤 상담으로 백내장 치료 방법을 결정합니다.
							</p>
							<div class="system_list_box pc_show">
								<ul class="system_list">
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg01.png" alt="">
											<p>정밀 검사</p>
										</div>
										<p class="desc_default">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg02.png" alt="">
											<p>의료진 상담</p>
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
											<img src="/common/img/sub/pres_clinic_system_bg03.png" alt="">
											<p>수술 진행</p>
										</div>
										<p class="desc_default">
											의료진 상담 시 결정한 치료 방법에<br> 
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
							<div class="system_list_box mo_show">
								 <ul class="system_list">
									<li>
										<div class="title_box">
											<img src="/common/img/sub/mo_pres_clinic_system_bg01.png" alt="">
										</div>
										<p class="desc_default">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="title_box">
											<img src="/common/img/sub/pres_clinic_system_bg02 (2).png" alt="">
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
											<img src="/common/img/sub/mo_pres_clinic_system_bg03.png" alt="">
										</div>
										<p class="desc_default">
											의료진 상담 시 결정한 치료 방법에<br> 
											따라 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
						</div>

						<ul class="link_box justify-cont-center flex">
							<li><a href="/presbyopia/premium" class="btn_detail">프리미엄 노안 &middot; 백내장 바로 가기</a></li>
							<li><a href="/community/review" class="btn_detail">고객 체험기 바로 가기</a></li>
						</ul>

					</div>
					<!--// 백내장 -->
				</div>
			</div>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
</body>
</html>