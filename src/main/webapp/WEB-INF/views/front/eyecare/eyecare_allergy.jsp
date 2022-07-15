<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
		<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub subEyecareJoinRetinaRevision eyecare__allergy">
			<h2 class="sub_title">알러지 케어</h2>
			<div class="allergy_wrap"><!-- 알러지케어 -->
				<ul class="sub_tab_menu flex wsize mt90">
					<li class="active" rel="allergyTab0101">결막염</li>
					<li rel="allergyTab0102">각막염</li>
				</ul>
				<div class="tab_contents mt45">
					<!-- 결막염 -->
					<div id="allergyTab0101" class="tab" style="display:block;">
						<div class="sub_visual gyol-hero01">
						</div>
						<div class="gyol01 txt-center">
							<h4 class="top-tit">결막에 생긴 염증</h4>
							<h2 class="cont-tit">결막염</h2>
							<p class="cont-desc">
								결막염은 눈의 흰자를 덮고 있는 얇은 막인 결막에 염증이 생겨 발생하는 증상입니다. <br>
								결막은 외부에 노출되어 있어 각종 세균, 바이러스, 진균 등에 쉽게 감염되어 발생합니다. <br>
								생활 속 여러 원인으로 발생할 수 있으며 전염성이 있다면 빠르게 치료받아야 합니다.
							</p>
							<div class="wsize">
								<div class="img-wrap">
									<img src="/common/img/sub/e_gyol01_img01.png" alt="결막">
								</div>
							</div>
						</div>
						<div class="gyol02 txt-center">
							<div class="wsize">
								<h4 class="top-tit">대표적인</h4>
								<h2 class="cont-tit">결막염 종류</h2>
								<ul class="feature-list kind-list">
									<li>
										<div class="img-wrap">
											<img class="pc_show" src="/common/img/sub/e_gyol02_pic01.png" alt="안구건조증">
											<img class="mo_show" src="/common/img/sub/mo_eyecare_allergy_eyeImg(1).png" alt="안구건조증">
										</div>
										<div>
											<h4>바이러스성 결막염</h4>
											<ul class="feature-desc">
												<li>
													<div class="left-tit">
														원인 ㅣ
													</div>
													<div class="right-desc">
														아데노바이러스, 엔테로바이러스, 단순포진바이러스 등 바이러스에 의한 감염.
													</div>
												</li>
												<li>
													<div class="left-tit">
														증상 ㅣ
													</div>
													<div class="right-desc">
														눈물, 이물감, 충혈, 약한 눈부심, 가려움
													</div>
												</li>
											</ul>
										</div>	
									</li>
									<li>
										<div class="img-wrap">
											<img class="pc_show" src="/common/img/sub/e_gyol02_pic02.png" alt="안구건조증">
											<img class="mo_show" src="/common/img/sub/mo_eyecare_allergy_eyeImg(2).png" alt="안구건조증">
										</div>
										<div>
											<h4>세균성 결막염</h4>
											<ul class="feature-desc">
												<li>
													<div class="left-tit">
														원인 ㅣ
													</div>
													<div class="right-desc">
														황색 포도상구균, 폐렴연쇄구균, 임균 등 세균에 의한 감염.
													</div>
												</li>
												<li>
													<div class="left-tit">
														증상 ㅣ
													</div>
													<div class="right-desc">
														이물감, 눈물, 충혈, 점액성 고름
													</div>
												</li>
											</ul>
										</div>
									</li>
									<li>
										<div class="img-wrap">
											<img class="pc_show" src="/common/img/sub/e_gyol02_pic03.png" alt="안구건조증">
											<img class="mo_show" src="/common/img/sub/mo_eyecare_allergy_eyeImg(3).png" alt="안구건조증">
										</div>
										<div>
											<h4>알레르기성 결막염</h4>
											<ul class="feature-desc">
												<li>
													<div class="left-tit">
														원인 ㅣ
													</div>
													<div class="right-desc">
														꽃가루, 동물 비듬, 점안액, 황사, 미세먼지, 약물, 콘택트렌즈 등 알레르기 항원이나 화학물질에 접촉 또는 노출.
													</div>
												</li>
												<li>
													<div class="left-tit">
														증상 ㅣ
													</div>
													<div class="right-desc">
														가려움, 작열감, 충혈, 눈물
													</div>
												</li>
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="gyol03 txt-center">
							<h4 class="top-tit">대표적인</h4>
							<h2 class="cont-tit">결막염 증상</h2>
							<p class="cont-desc">
								결막염 증상은 발병 원인에 따라 차이가 있지만  대개 약 1주 정도의 잠복기를 가집니다. <br>
								그 후 눈 가려움, 눈곱, 충혈 등 다양한 증상이 발생합니다. <br>
								특히 갑자기 안구 통증이 느껴지면서 충혈이 심해진다면 전염성 눈병일 수 있어 빠른 치료가 필요합니다.
							</p>
							<div class="gray-bg">
								<div class="wsize">
									<ul class="icon-list symptom-list">
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/e_gyol03_icon01.png" alt="icon">
											</div>
											<p>가려움증</p>
										</li>
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/e_gyol03_icon02.png" alt="icon">
											</div>
											<p>눈곱과 눈물</p>
										</li>
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/e_gyol03_icon03.png" alt="icon">
											</div>
											<p>충혈 및 눈꺼풀 부종</p>
										</li>
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/e_gyol03_icon04.png" alt="icon">
											</div>
											<p>심한 안구 통증</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="gyol04 care-sec txt-center">
							<div class="navy-bg">
								<h4 class="top-tit">강남그랜드안과</h4>
								<h2 class="cont-tit">결막염 치료 방법</h2>
							</div>
							<div class="gray-bg">
								<div class="wsize">
									<div class="icon-list">
										<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="다래끼"></div>
										<h4 class="box-tit">개인 맞춤 치료</h4>
										<p class="cont-desc">
											강남그랜드안과는 정밀 검사 및 의료진 상담을 통해 <br>
											개인에게 맞는 약물 치료를 진행합니다.
										</p>
										<ul class="icon-box">
											<li>
												<div class="img-wrap">
													<img src="/common/img/sub/e_gyol04_icon01.png" alt="다래끼">
												</div>
												<p>
													감염성 결막염은 환자의 눈 상태에 맞는 적절한 안약을 처방합니다. <br>
													비감염성 결막염은 특별한 치료 없이 자연적으로 치유되지만 <br>
													추가 감염을 방지하기 위해 안약 등을 처방합니다.
												</p>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="gyol05 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit">결막염 클리닉 시스템</h2>
							<p class="cont-desc">
								강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다. <br>
								검사 후 의료진과 일대일 맞춤 상담으로 안구 건조 상태를 확인하고 치료를 진행합니다.
							</p>
							<div class="feature-wrap system-list pc_show">
								<ul class="feature-list">
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg01.png" alt="">
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
											<img src="/common/img/sub/e_sty04_bg02.png" alt="">
											<p>의료진 상담</p>
										</div>
										<p class="feature-desc">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="space-sm"></span>
											이때 의료진은 고객에게 맞는 <br>
											치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg03.png" alt="">
											<p>약물 처방</p>
										</div>
										<p class="feature-desc">
											의료진 상담 시 결정한 방법에 따라 <br>
											안약 및 인공눈물을 처방합니다.
										</p>
									</li>
								</ul>
							</div>
							<div class="feature-wrap system-list mo_show">
								<ul class="feature-list">
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/mo_pres_clinic_system_bg01.png" alt="">
										</div>
										<p class="feature-desc">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/pres_clinic_system_bg02 (2).png" alt="">
										</div>
										<p class="feature-desc">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="space-sm"></span>
											이때 의료진은 고객에게 맞는 <br>
											치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/mo_eyecare_allergy_약물처방.png" alt="">
										</div>
										<p class="feature-desc">
											의료진 상담 시 결정한 방법에 따라 <br>
											안약 및 인공눈물을 처방합니다.
										</p>
									</li>
								</ul>
							</div>
						</div>
						<div class="gyol06 notandum-sec txt-center">
							<h2 class="cont-tit">결막염 예방법 및 주의사항</h2>
							<div class="col-list-wrap">
								<ul class="col-list">
									<li>
										<div class="img-wrap">
											<img src="/common/img/sub/e_gyol_ntd01.png" alt="">
										</div>
										<div class="txt-wrap">
											<h3>철저한 위생 관리</h3>
											<p>
												알레르기를 일으킬 수 있는 항원이 있다면 평소 생활이나 계정 등에 따라서 관리합니다. <br>
												외출 후 처절한 위생관리로 손을 잘 씻고, 더러운 손으로 눈을 만지지 않습니다. <br>
												집 먼지, 곰팡이 등에 예민하신 분이라면 주기적인 청소로 생활 관리합니다.
											</p>
										</div>
									</li>
									<li>
										<div class="img-wrap">
											<img src="/common/img/sub/e_gyol_ntd02.png" alt="">
										</div>
										<div class="txt-wrap">
											<h3>콘택트렌즈 관리 주의</h3>
											<p>
												평소 콘택트렌즈를 착용하시는 분이라면 사용 시 소독 및 관리에 주의해야합니다. <br>
												특히 봄철에는 미생물 활성이 증가하므로 사용을 자제합니다.
											</p>
										</div>
									</li>
									<li>
										<div class="img-wrap">
											<img src="/common/img/sub/e_gyol_ntd03.png" alt="">
										</div>
										<div class="txt-wrap">
											<h3>주의사항</h3>
											<p>
												진료를 받은 후 정기적으로 안과에서 합병증 발생 여부를 확인해야 합니다. 유아·소아· 노인·콘택트렌즈 <br>
												착용자는 합병증 여부가 있을 수 있어 증상 발생 시 검사가 필요합니다.
												<span class="space-sm"></span>
												안약 사용 시 반드시 안과 전문의의 처방을 받은 대로 사용합니다.
												<span class="space-sm"></span>
												가렵다고 눈을 비비거나 잘못된 방법으로 눈을 씻지 않아야 합니다. 눈에 지나친 자극이 갈 경우 합병증 등 <br>
												2차 감염이 생길 수 있습니다.
												<span class="space-sm"></span>
												전염성 결막염은 가족이나 주위 사람에게 전염되기 쉬우므로 진료 후에도 손을 깨끗이 씻는 등 <br>
												생활 관리가 중요합니다.
											</p>
										</div>
									</li>
								</ul>
							</div>
							<a href="/community/review" class="anchor-arrow">고객 체험기 바로가기</a>
						</div>
					</div>
					<!-- //결막염 -->
					<!-- 각막염 -->
					<div id="allergyTab0102" class="tab">
						<div class="sub_visual gak-hero01">
						</div>
						<div class="gak01 txt-center">
							<h4 class="top-tit">각막에 생긴 염증</h4>
							<h2 class="cont-tit">각막염</h2>
							<p class="cont-desc">
								각막염은 눈의 검은자를 덮고 있는 각막에 염증이 생겨 발생하는 증상입니다. <br>
								각막은 유리처럼 투명한 조직으로 콘택트렌즈 착용, 세균 등에 감염되어 발생합니다. <br>
								원인에 따라서는 시력 감소가 발생할 수 있어 예방과 치료가 중요합니다.
							</p>
							<div class="wsize">
								<div class="img-wrap">
									<img src="/common/img/sub/e_gak01_img01.png" alt="hero">
								</div>
							</div>
						</div>
						<div class="gak02 txt-center">
							<div class="wsize">
								<h4 class="top-tit">대표적인</h4>
								<h2 class="cont-tit">각막염 종류</h2>
								<ul class="feature-list kind-list">
									<li>
										<div class="img-wrap">
											<img src="/common/img/sub/e_gak02_pic01.png" alt="안구건조증">
										</div>
										<h4>감염성 각막염</h4>
										<p>
											감염성 각막염은 세균, 바이러스, 진균 등 여러 <br>
											가지 병원균에 의해서 발생합니다
											<span class="space-sm"></span>
											감염을 일으키는 세균으로는 포도상구균, <br>
											녹농균이 있으며, 바이러스로는 단순포진 <br>
											바이러스, 진균으로는 푸사리움이 대표적입니다.
										</p>
									</li>
									<li>
										<div class="img-wrap">
											<img src="/common/img/sub/e_gak02_pic02.png" alt="안구건조증">
										</div>
										<h4>비감염성 결막염</h4>
										<p>
											비감염성 각막염은 각막의 지속적인 외부 노출에 <br>
											의해서 발생합니다.
											<span class="space-sm"></span>
											노출성 각막염 외에도 독성 각막염, 신경영양 각막염, <br>
											콘택트렌즈에 의한 장애 및 외상이 대표적입니다.
										</p>
									</li>
								</ul>
							</div>
						</div>
						<div class="gak03 txt-center">
							<h4 class="top-tit">대표적인</h4>
							<h2 class="cont-tit">각막염 증상</h2>
							<p class="cont-desc">
								각막염 증상은 발병 원인에 따라 차이가 있지만 초기에는 시력 저하, 통증, 충혈, 눈부심 등 다양한 증상이 발생합니다. <br>
								다섯 개 층으로 구성된 각막은 바깥쪽 각막상피부터 결손 되어 점차 안쪽까지 염증이 생겨 시력 감소를 초래합니다. <br>
								이런 증상이 심해진다면 각막이 파괴될 수 있어 빠른 치료가 필요합니다.
							</p>
							<div class="gray-bg">
								<div class="wsize">
									<ul class="icon-list symptom-list">
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/e_gak03_icon01.png" alt="icon">
											</div>
											<p>시력저하</p>
										</li>
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/e_gak03_icon02.png" alt="icon">
											</div>
											<p>이물감</p>
										</li>
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/e_gak03_icon03.png" alt="icon">
											</div>
											<p>충혈</p>
										</li>
										<li>
											<div class="img-wrap">
												<img src="/common/img/sub/e_gak03_icon04.png" alt="icon">
											</div>
											<p>심한 안구 통증</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="gak04 care-sec txt-center">
							<div class="navy-bg">
								<h4 class="top-tit">강남그랜드안과</h4>
								<h2 class="cont-tit">각막염 치료 방법</h2>
							</div>
							<div class="gray-bg">
								<div class="wsize">
									<div class="icon-list">
										<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="label-icon"></div>
										<h4 class="box-tit">개인 맞춤 치료</h4>
										<p class="cont-desc">
											강남그랜드안과는 정밀 검사 및 의료진 상담을 통해 <br>
											개인에게 맞는 약물 치료를 진행합니다.
										</p>
										<ul class="icon-box">
											<li>
												<div class="img-wrap">
													<img src="/common/img/sub/e_gyol04_icon01.png" alt="icon">
												</div>
												<p>
													감염성 각막염은 증상에 맞는 안약을 처방합니다. <br>
													비감염성 각막염은 생활 속 예방이 가장 중요하지만 <br>
													추가 감염을 방지하기 위해 안약 등을 처방합니다.
												</p>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="gak05 txt-center">
							<h4 class="top-tit">강남그랜드안과</h4>
							<h2 class="cont-tit">각막염 클리닉 시스템</h2>
							<p class="cont-desc">
								강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다. <br>
								검사 후 의료진과 일대일 맞춤 상담으로 각막염 증상 확인 및 처방합니다.
							</p>
							<div class="feature-wrap system-list pc_show">
								<ul class="feature-list">
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg01.png" alt="">
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
											<img src="/common/img/sub/e_sty04_bg02.png" alt="">
											<p>의료진 상담</p>
										</div>
										<p class="feature-desc">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="space-sm"></span>
											이때 의료진은 고객에게 맞는 <br>
											치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/e_sty04_bg03.png" alt="">
											<p>약물 처방</p>
										</div>
										<p class="feature-desc">
											의료진 상담 시 결정한 방법에 따라 <br>
											안약 및 인공눈물을 처방합니다.
										</p>
									</li>
								</ul>
							</div>
							<div class="feature-wrap system-list mo_show">
								<ul class="feature-list">
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/mo_pres_clinic_system_bg01.png" alt="">
										</div>
										<p class="feature-desc">
											의료진과 상담 전 검안사와 일대일 <br>
											정밀 검사로 고객의 눈 상태를 <br>
											확인합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/pres_clinic_system_bg02 (2).png" alt="">
										</div>
										<p class="feature-desc">
											검사 결과를 바탕으로 의료진과 <br>
											일대일 상담을 진행합니다.
											<span class="space-sm"></span>
											이때 의료진은 고객에게 맞는 <br>
											치료 방법을 결정합니다.
										</p>
									</li>
									<li>
										<div class="feature-circle">
											<img src="/common/img/sub/mo_eyecare_allergy_약물처방.png" alt="">
										</div>
										<p class="feature-desc">
											의료진 상담 시 결정한 방법에 따라 <br>
											안약 및 인공눈물을 처방합니다.
										</p>
									</li>
								</ul>
							</div>
						</div>
						<div class="gak06 notandum-sec txt-center">
							<h2 class="cont-tit">각막염 예방법 및 주의사항</h2>
							<div class="col-list-wrap">
								<ul class="col-list">
									<li>
										<div class="img-wrap">
											<img src="/common/img/sub/e_gak_ntd01.png" alt="">
										</div>
										<div class="txt-wrap">
											<h3>콘택트렌즈 관리 주의</h3>
											<p>
												콘택트렌즈를 착용 시 소독 및 관리를 철저히 합니다. <br>
												장기간 콘택트렌즈 착용은 자제하고, 착용 중 수면은 하지 않습니다. <br>
												콘택트렌즈를 다른 사람과 공유해 사용하지 않습니다.
											</p>
										</div>
									</li>
									<li>
										<div class="img-wrap">
											<img src="/common/img/sub/e_gak_ntd02.png" alt="">
										</div>
										<div class="txt-wrap">
											<h3>주의사항</h3>
											<p>
												눈에 통증, 충혈, 눈부심, 시력 감소가 나타나는 경우 빠른 진료가 필요합니다. <br>
												전문의의 처방을 받지 않은 안약을 사용하지 않습니다. <br>
												각막염은 염증의 정도에 따라 각막 혼탁이 남을 수 있어 주의해야 합니다.
											</p>
										</div>
									</li>
								</ul>
							</div>
							<a href="/community/review" class="anchor-arrow">고객 체험기 바로가기</a>
						</div>
					</div>
					<!-- //각막염 -->
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script>
		// 탭 메뉴
		$(".allergy_wrap .sub_tab_menu li").click(function () {
			$(".allergy_wrap .sub_tab_menu li").removeClass("active");

			$(this).addClass("active");
			$(".allergy_wrap .tab").hide();
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn();
		});
	</script>
</body>
</html>