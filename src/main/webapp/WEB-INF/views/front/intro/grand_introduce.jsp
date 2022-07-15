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
			<h2 class="sub_title">병원 소개</h2>
			<div class="intro_sec01">
				<div class="sub_visual flex">
					<div class="sub_visual_txt">
						<span class="txt01">진심과 실력으로 다가가는</span>
						<p class="txt02">강남그랜드안과</p>
						<p class="txt03">눈으로 보는 <br class="mo_show">모든 세상이 편안하도록.<br>
							당신을 처음 만나는 순간부터 마지막까지<br>
							진심으로 다가가 실력으로 보여드리겠습니다.
						</p>
					</div>
				</div>
			</div>

			<div class="intro_sec02 sub_sec wsize">
				<h3 class="sub_title">핵심 가치</h3>
				<p class="sub_desc">강남그랜드안과는 고객의 눈과 마음에 최상의 의료 서비스를 제공하고자 두 가지 영역에 핵심 가치를 부여합니다. <br>
					고객을 위한 <span class="fw700">배려</span>(<span class="ls0">Care</span>)와 
					<span class="fw700">치료</span>(<span class="ls0">Solution</span>)에 최선을 다합니다.
				</p>
				<div class="img mt70 ta_c">
					<img class="pc_show" src="/common/img/sub/grand_intro_img_value.png" alt="care solution">
					<img class="mo_show" src="/common/img/sub/grand_intro_img_value_mo.png" alt="care solution">
				</div>
				<div class="flex txt_box">
					<ul class="txt_item left_item">
						<li>
							<span class="num">01</span>
							<p class="tit">고객 맞춤 안과 진료</p>
							<p class="desc">단지 눈이 나쁘다고 해서 다 똑같은 시력을 가지고<br class="pc_show">
							있지 않은 것처럼, 고객 개인의 눈 상태에 맞는<br class="pc_show">
							1 : 1 맞춤 진료를 진행합니다.</p>
						</li>
						<li>
							<span class="num">02</span>
							<p class="tit">편안한 원내 환경</p>
							<p class="desc">강남역 5번 출구 바로 앞, 당신과 가장 가까운 <br>
							강남그랜드안과는 상담 및 검진을 받는 <span class="fw700">4층 아이케어실</span>, <br class="pc_show">
							<span class="fw700">5층 수술실</span>로 이어져 편안한 진료를 받으실 수 있습니다.</p>
						</li>
					</ul>
					<ul class="txt_item right_item">
						<li>
							<span class="num">01</span>
							<p class="tit">질환 중심 전문의</p>
							<p class="desc">안과 진료의 핵심은 의료진의 경험입니다. <br>
							고난도 안과 수술 전문 &middot; 망막 전문의로 이뤄진 <br>
							강남그랜드안과는 개인별 안질환에 집중합니다.</p>
						</li>
						<li>
							<span class="num">02</span>
							<p class="tit">최첨단 안과 장비</p>
							<p class="desc">장비의 차이가 결과의 차이를 만듭니다. <br>
							검진부터 수술 장비까지 지속적인 업그레이드로 <br class="pc_show">
							최상의 의료 서비스를 제공합니다.</p>
						</li>
					</ul>
				</div>
			</div>

			<div class="intro_sec03 sub_sec">
				<h3 class="sub_title ls0">CI</h3>
				<div class="sub_visual"></div>
				<div class="wsize">
					<div class="ci_box logomark_box flex_between">
						<div class="img pc_show"><img src="/common/img/sub/grand_intro_img_logo01.png" alt="로고"></div>
						<div class="txt">
							<h4>로고 마크</h4>
							<div class="txt-cont">
								<div class="left-cont">
									<div class="img mo_show"><img src="/common/img/sub/grand_intro_img_logo01_mo.png" alt="로고"></div>
								</div>
								<div class="right-cont">
									
									<p>강남그랜드안과의 CI는 고객을 향한 마음이 담겨 있습니다.<br> 
									안구의 모양에서 따온 ‘G’로고는 언제나 고객을 위해 노력하겠다는 지향적인(GRAND) 자세를 의미하며, <br class="pc_show">
									짙은 파란 색상은 방문하신 모든 분들에게 선명한 세상을 선물하겠단 다짐이자 마음입니다.</p>
									<div class="img pc_show mt30"><img src="/common/img/sub/grand_intro_img_logo02.png" alt="로고"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="ci_box character_box flex_between">
						<div class="img pc_show"><img src="/common/img/sub/grand_intro_img_character01.png" alt="RANY"><span>RANY</span></div>
						<div class="txt">
							<h4>캐릭터</h4>
							<div class="txt-cont">
								<div class="left-cont">
									<div class="img mo_show"><img src="/common/img/sub/grand_intro_img_character01_mo.png" alt="RANY"></div>
								</div>
								<div class="right-cont">
									<p>래니(RANY)는 강남그랜드안과의 공식 캐릭터입니다.<br> 
									크고 동그란 눈을 가진 래니는 항상 밝은 마음으로 세상을 바라봅니다. <br> 
									공식 마스코트답게 여기저기 다양한 모습으로 나타날지 모릅니다.</p>
									<ul class="rany_box pc_show flex mt30">
										<li>
											<div><img src="/common/img/sub/grand_intro_img_character02.png" alt="노안"></div>
											<span>노안</span>
										</li>	
										<li>
											<div><img src="/common/img/sub/grand_intro_img_character03.png" alt="백내장"></div>
											<span>백내장</span>
										</li>
										<li>
											<div><img src="/common/img/sub/grand_intro_img_character04.png" alt="시력 교정"></div>
											<span>시력 교정</span>
										</li>
										<li>
											<div><img src="/common/img/sub/grand_intro_img_character05.png" alt="드림 렌즈"></div>
											<span>드림 렌즈</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
</body>
</html>