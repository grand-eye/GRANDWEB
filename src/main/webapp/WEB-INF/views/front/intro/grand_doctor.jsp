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
			<h2 class="sub_title">의료진 소개</h2>
			<p class="sub_desc doctor_desc">고난도 안과 질환 &middot; 망막 전문의가 함께하는 강남그랜드안과. <br>
			풍부한 경험과 세심한 마음으로 정성을 다합니다.</p>
			<div class="doctor_box lgh_box">
				<div class="doctor_txt_bar">“품격이 다른 프리미엄 진료로 여러분의 소중한 눈을 책임지겠습니다.”</div>
				<div class="doctor_history_box">
					<div class="wsize flex">
						<div class="doctor-pic-wrap img pc_show"><img src="/common/img/sub/grand_doctor_img_doctor01_01.png" alt="이관훈 원장"></div>
						<div class="history_inr">
							<ul class="doctor_carelist flex">
								<li>망막</li>
								<li>백내장</li>
								<li>시력 교정</li>
								<li>스마일</li>
								<li>렌즈 삽입술</li>
							</ul>
							<div class="doctor_name"><span>대표 원장 </span>이관훈</div>
							<ul class="tab_menu flex">
								<li class="active" rel="lgh_tab01">학력 및 경력</li>
								<li rel="lgh_tab02">학회 활동</li>
								<!--li rel="lgh_tab03">수상</li-->
							</ul>
							<div class="tab_contents">
								<div id="lgh_tab01" class="tab">
									<ul class="history_list">
										<li>
											단국대학교 의과대학 졸업
										</li>
										<li>
											단국의대부속병원 안과 전공의
										</li>
										<li>
											단국대학교병원 망막 전임의
										</li>
										<li>
											단국대학교 외래교수
										</li>
										<li>
											전) BGN 밝은눈안과 잠실 롯데점 원장
										</li>
										<li>
											전) 국군수도통합병원 안과 과장
										</li>
										<li>
											전) 마산 김안과 망막센터장
										</li>
										<li>
											백내장 굴절수술 
										</li>
										<li>
											10,000 케이스 이상 집도 
										</li>
										<li>
											망막 시술 및 수술 
										</li>
										<li>
											15,000 케이스 이상 집도
										</li>
									</ul>
								</div>
								<div id="lgh_tab02" class="tab">
									<ul class="history_list">
										<li>
											대한 안과 학회(KOS) 정회원 
										</li>
										<li>
											미국 안과 학회(AAO) 정회원 
										</li>
										<li>
											한국 콘택트 렌즈 학회(KCLS) 정회원
										</li>
										<li>
											한국 백내장 굴절 수술 학회(KSCRS)정회원 
										</li>
										<li>
											미국 백내장 굴절 수술 학회(ASCRS)정회원 
										</li>
										<li>
											한국 신경 안과 학회(KNOS)정회원
										</li>
										<li>
											한국 포도막 학회 (KUS)정회원
										</li>
										<li>
											한국 검안 학회(KOS)정회원 
										</li>
										<li>
											한국 망막 학회 (KRS) 회원 
										</li>
										<li>
											Carl Zeiss 리사트리(LISA tri)렌즈 삽입 수술 우수 인증 
										</li>
										<li>
											PhysIOL 파인비전(Fine vision) 렌즈 삽입 수술 우수 인증
										</li>
										<li>
											Alcone 팬옵틱스(PanOPtix)렌즈 삽입 수술 우수 인증 
										</li>
										<li>
											Carl Zeiss 사 Expert ReLEx smile 닥터 인증
										</li>
									</ul>
								</div>
								<div id="lgh_tab03" class="tab">
									<ul class="history_list">
										<li>
											2020년 대한민국 굿닥터 100인 선정 
										</li>
										<li>
											2021년 의료건강 사회공헌 대상 수상
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="doctor_swiper lys_swiper">
					<!--div class="wsize03">
						<h3 class="sub_title">인증패 및 수상 내역</h3>
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_01.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_02.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_03.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_04.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_05.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_01.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_02.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_03.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_04.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_05.png" alt="인증패"></div>
								</div>
							</div>
						</div>
						<div class="swiper-pagination mo_show"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div-->
				</div>
			</div>
			<div class="doctor_box lys_box">
				<div class="doctor_txt_bar">“소중한 내 가족처럼 진심을 다해 최고의 결과를 보여드리겠습니다.”</div>
				<div class="doctor_history_box">
					<div class="wsize flex">
						<div class="doctor-pic-wrap img pc_show"><img src="/common/img/sub/grand_doctor_img_doctor02_01.png" alt="이영섭 원장"></div>
						<div class="history_inr">
							<ul class="doctor_carelist flex">
								<li>각막</li>
								<li>백내장</li>
								<li>시력 교정</li>
								<li>스마일</li>
								<li>렌즈 삽입술</li>
								<li>건조증</li>
							</ul>
							<div class="doctor_name"><span>대표 원장 </span>이영섭</div>
							<ul class="tab_menu flex">
								<li class="active" rel="lys_tab01">학력 및 경력</li>
								<li rel="lys_tab02">학회 활동</li>
								<!--li rel="lys_tab03">수상</li-->
							</ul>
							<div class="tab_contents">
								<div id="lys_tab01" class="tab">
									<ul class="history_list">
										<li>
											경희대학교 의과대학 수석 졸업
										</li>
										<li>
											경희대학교 병원 안과 전공의 수료
										</li>
										<li>
											아주대학교병원 안과 임상교수
										</li>
										<li>
											안과 전문의·안과학 석사
										</li>
										<li>
											경기 남부·경기 북부 병무청·<br class="mo_show">중앙신체검사소 안과 과장
										</li>
										<li>
											TBN경인 매거진 자문 의사
										</li>
										<li>
											전) BGN 밝은눈안과 잠실 롯데점 원장
										</li>
										<li>
											전) BGN 밝은눈안과 (교보타워) 원장
										</li>
										<li>
											백내장 및 굴절수술 
										</li>
										<li>
											(라식 &middot; 라섹 &middot; 스마일 &middot; 렌즈 삽입술) 
										</li>
										<li>
											15,000 케이스 이상 집도 
										</li>
									</ul>
								</div>
								<div id="lys_tab02" class="tab">
									<ul class="history_list">
										<li>
											대한 안과 학회(KOS) 정회원 
										</li>
										<li>
											미국 안과 학회(AAO) 정회원 
										</li>
										<li>
											한국 콘택트 렌즈 학회(KCLS) 정회원
										</li>
										<li>
											한국 백내장 굴절 수술 학회(KSCRS)정회원 
										</li>
										<li>
											미국 백내장 굴절 수술 학회(ASCRS)정회원 
										</li>
										<li>
											국제 시력 및 안과 연구 학회(ARVO) 정회원
										</li>
										<li>
											한국 외안부학회(KCS) 정회원
										</li>
										<li>
											스마일 라식 Excellent surgeon
										</li>
										<li>
											ICL , Toric-ICL Excellent surgeon 
										</li>
										<li>
											Carl Zeiss 리사트리(LISA tri) 수술 우수 인증의 
										</li>
										<li>
											PhysIOL 파인비전(Fine vision)수술 우수 인증의
										</li>
										<li>
											Alcone 팬옵틱스(PanOPtix) 수술 우수 인증의
										</li>
									</ul>
								</div>
								<div id="lys_tab03" class="tab">
									<ul class="history_list">
										<li>
											2020년 대한민국 굿닥터 100인 선정 
										</li>
										<li>
											2021년 의료건강 사회공헌 대상 수상
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="doctor_swiper lys_swiper">
					<!--div class="wsize03">
						<h3 class="sub_title">인증패 및 수상 내역</h3>
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_01.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_02.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_03.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_04.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award01_05.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_01.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_02.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_03.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_04.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award02_05.png" alt="인증패"></div>
								</div>
							</div>
						</div>
						<div class="swiper-pagination mo_show"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div-->
				</div>
			</div>
			
			<div class="doctor_box ljj_box">
				<div class="doctor_txt_bar">“함께 보는 밝은 세상을 이루기 위해 최선을 다하겠습니다.”</div>
				<div class="doctor_history_box">
					<div class="wsize flex">
						<div class="doctor-pic-wrap img pc_show"><img src="/common/img/sub/grand_doctor_img_doctor03_01.png" alt="이정진 원장"></div>
						<div class="history_inr">
							<ul class="doctor_carelist flex">
								<li>백내장</li>
								<li>시력 교정</li>
								<li>스마일</li>
								<li>렌즈 삽입술</li>
								<li>건조증</li>
							</ul>
							<div class="doctor_name"><span>원장 </span>이정진</div>
							<ul class="tab_menu flex">
								<li class="active" rel="ljj_tab01">학력 및 경력</li>
								<li rel="ljj_tab02">학회 활동</li>
								<!--li rel="ljj_tab03">수상</li-->
							</ul>
							<div class="tab_contents">
								<div id="ljj_tab01" class="tab">
									<ul class="history_list">
										<li>
											경희대학교 의과대학 졸업
										</li>
										<li>
											영등포 김안과 병원 안과 전공의 수료
										</li>
										<li>
											전) 서울대명안과 원장
										</li>
										<li>
											전) 영등포 김안과병원 각막센터 전임의
										</li>
										<li>
											각막 · 백내장 센터 임상 교수
										</li>
										<li>
											백내장 및 굴절수술 
										</li>
										<li>
											(라식·라섹·스마일· 렌즈 삽입술) 
										</li>
										<li>
											10,000 케이스 이상 집도 
										</li>
									</ul>
								</div>
								<div id="ljj_tab02" class="tab">
									<ul class="history_list">
										<li>
											한국 외안부 학회(KEEDS) 정회원
										</li>
										<li>
											한국 콘택트 렌즈 학회(KCLS) 정회원
										</li>
										<li>
											한국 백내장 굴절 수술 학회(KSCRS)정회원
										</li>
										<li>
											대한 안과 학회(KOS)정회원 
										</li>
										<li>
											유럽 안과 학회(EVER) 정회원 
										</li>
										<li>
											유럽 백내장 굴절 수술 학회(ESCRS) 정회원
										</li>
										<li>
											ICL 안내렌즈 삽입 수술 우수 인증의
										</li>
									</ul>
								</div>
								<div id="ljj_tab03" class="tab">
									<ul class="history_list">
										<li>
											2021년 의료건강 사회공헌 대상 수상 
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="doctor_swiper lys_swiper">
					<!--div class="wsize03">
						<h3 class="sub_title">인증패 및 수상 내역</h3>
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award03_01.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award03_02.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award03_03.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award03_04.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award03_05.png" alt="인증패"></div>
								</div>
								<div class="swiper-slide">
									<div class="img-wrap"><img src="/common/img/sub/grand_doctor_img_award03_06.png" alt="인증패"></div>
								</div>
							</div>
						</div>
						<div class="swiper-pagination mo_show"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div-->
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
</body>
</html>