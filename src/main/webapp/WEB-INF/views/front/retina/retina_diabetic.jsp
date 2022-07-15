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
			<h2 class="sub_title">당뇨망막병증</h2>
			<div class="diabet_wrap page-wrap"><!-- 당뇨망막 -->
				<div class="wsize">
					<div class="drag_box">
						<div class="drag_frame_box">
							<div class="drag_frame">
								<span class="img"><img src="/common/img/sub/r_diabet_img_normal.jpg" alt="정상적인 시야"></span>
								<span class="img drag"><img src="/common/img/sub/r_diabet_img_abnormal.jpg" alt="당뇨망막병증이 진행된 시야"></span>
							</div>

							<div class="drag_control">
								<div class="flex_between">
									<span class="title">정상적인 시야</span>
									<p class="bar">
										<span class="btn_drag ui-draggable auto">버튼</span>
									</p>
									<span class="title">당뇨망막병증이 진행된 시야</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="diabet01 first-sec txt-center">
					<h4 class="top-tit">정기적인 검진이 중요한 안질환</h4>
					<h2 class="cont-tit">당뇨망막병증</h2>
					<p class="cont-desc">
						당뇨망막병증은 망막의 미세혈관이 손상되는 질환으로 <br>
						당뇨병의 합병증 중 가장 대표적인 증상입니다.
						<span class="space-sm"></span>
						발병 원인은 당뇨병으로 혈당 조절이 잘 안 된다면 발병률도 증가합니다. <br>
						망막병증을 앓고 있어도 초기에는 별다른 증상이 없어 정기적인 검진과 관찰이 가장 중요합니다.
					</p>
					<ul class="img-list compare-list">
						<li>
							<div class="img-wrap">
								<img src="/common/img/sub/r_diabet01_img01.png" alt="비교정상">
							</div>
							<h3>정상적인 눈</h3>
						</li>
						<li>
							<div class="img-wrap">
								<img src="/common/img/sub/r_diabet01_img02.png" alt="비교비정상">
							</div>
							<h3 class="color-em">당뇨망막병이 있는 눈</h3>
						</li>
					</ul>
				</div>
				<div class="diabet02 txt-center">
					<div class="wsize">
						<h4 class="top-tit">원인에 따른</h4>
						<h2 class="cont-tit">당뇨망박병증 종류</h2>
						<ul class="feature-list kind-list">
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_diabet02_pic01.png" alt="list">
								</div>
								<h4>비증식성 당뇨망막병증</h4>
								<p>
									비증식 당뇨망막병증은 초기 단계로 망막혈관 벽이약해져 <br>
									풍선 모양의 낭이 생기거나, 혈액과 체액이 새어 나와 망막에 <br>
									출혈과 부종이 생겨 삼출물이 고여 발생합니다.
									<span class="space-sm"></span>
									혈관이 좁아지고 막혀서 망막에 혈액 공급이 되지 않아 <br>
									생길 수도 있습니다. 이 경우 증식성으로 발전할 수 있어 <br>
									정기적인 관찰이 필요합니다.
								</p>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_diabet02_pic02.png" alt="list">
								</div>
								<h4>증식성 당뇨망막병증</h4>
								<p>
									증식성 당뇨망막병증은 신생혈관이 파괴되어 유리체에 출혈이 <br>
									일어나면서 망막에 빛을 전달하지 못해 갑자기 시력 저하가 발생합니다.
									<span class="space-sm"></span>
									섬유성 조직의 증식으로 망막이 끌어 당겨져 망막이 떨어지고 홍채에 <br>
									신생혈관이 생기면 신생혈녹내장이 생길 수 있어 주의해야 합니다.
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="diabet03 txt-center">
					<h4 class="top-tit">대표적인</h4>
					<h2 class="cont-tit">당뇨망막병증 시야 및 증상</h2>
					<div class="wsize">
						<ul class="img-list visual-spt-list">
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_diabet03_pic01.jpg" alt="">
								</div>
								<p class="navy-bg">비문증</p>
								<p class="spt-desc">눈앞에 벌레가 떠다니는 것처럼 느껴지는 증상</p>
								<span class="vertical-line pc_show"></span>
								<h4>시력 감소</h4>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_diabet03_pic02.jpg" alt="">
								</div>
								<p class="navy-bg">광시증</p>
								<p class="spt-desc">눈을 감거나 떴을 때 번쩍거리는 증상</p>
								<span class="vertical-line pc_show"></span>
								<h4>시야 흐림</h4>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_diabet03_pic03.jpg" alt="">
								</div>
								<p class="navy-bg">변시증</p>
								<p class="spt-desc">사물이 비뚤어져 보이는 증상</p>
								<span class="vertical-line pc_show"></span>
								<h4>야간 시력 저하</h4>
							</li>
						</ul>
					</div>
				</div>
				<div class="diabet04 care-sec txt-center">
					<div class="navy-bg">
						<h4 class="top-tit">강남그랜드안과</h4>
						<h2 class="cont-tit">당뇨망막병증 치료 방법</h2>
					</div>
					<div class="gray-bg">
						<div class="wsize">
							<div class="icon-list">
								<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
								<p class="cont-desc cont-desc01">
									강남그랜드안과는 정밀 검사 및 의료진 상담을 통해 개인에게 맞는 <br>
									안구 내 주사 치료(항체 주사/스테로이드 주사)·레이저 치료·수술을 진행합니다.
									<span class="space-sm"></span>
									초기에는 시력에 문제가 없어 혈당 조절로 관리하지만 <br>
									당뇨망막병증이 발생한 후라면 혈당 조절과 안과적 치료가 필요합니다.
								</p>
								<ul class="num-list">
									<li>
										<div class="tit-img-wrap">
											<img src="/common/img/sub/r_diabet04_img01.jpg" alt="care-img">
										</div>
										<div class="num-img-wrap">
											<img src="/common/img/sub/r_md04_num01.jpg" alt="care-num">
										</div>
										<h4>주사 치료</h4>
										<p>
											시력을 담당하는 망막 중심 부위에 부종이나 유리체 출혈이 발생한 경우 주사를 <br>
											주입해 부종을 감소시키고 신생 혈관을 억제해 증상을 호전합니다.
										</p>
									</li>
									<li>
										<div class="tit-img-wrap">
											<img src="/common/img/sub/r_diabet04_img02.jpg" alt="care-img">
										</div>
										<div class="num-img-wrap">
											<img src="/common/img/sub/r_md04_num02.jpg" alt="care-num">
										</div>
										<h4>레이저 치료</h4>
										<p>
											레이저 치료로 신생 혈관 주변을 파괴함으로써 실명 위험을 예방합니다.
										</p>
									</li>
									<li>
										<div class="tit-img-wrap">
											<img src="/common/img/sub/r_diabet04_img03.jpg" alt="care-img">
										</div>
										<div class="num-img-wrap">
											<img src="/common/img/sub/r_md04_num03.jpg" alt="care-num">
										</div>
										<h4>수술적 치료</h4>
										<p>
											이미 망막 박리가 진행되었거나 새로 생긴 혈관에서 출혈이 일어난 경우 수술을 진행합니다.
										</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="diabet05 txt-center">
					<h4 class="top-tit">강남그랜드안과</h4>
					<h2 class="cont-tit">당뇨망막병증 클리닉 시스템</h2>
					<p class="cont-desc">
						강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다. <br>
						검사 후 의료진과 일대일 맞춤 상담으로 당뇨망막병증 치료 방법을 결정합니다.
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
									치료 방법을 결정합니다.
								</p>
							</li>
							<li>
								<div class="feature-circle">
									<img src="/common/img/sub/r_md05_bg03.png" alt="클리닉3">
									<p>치료 진행</p>
								</div>
								<p class="feature-desc">
									의료진 상담 시 결정한 방법으로 <br>
									치료를 진행합니다.
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
									안구건조증 치료 방법을 결정합니다.
								</p>
							</li>
							<li>
								<div class="feature-circle">
									<img src="/common/img/sub/mo_eyecare_dry (2).png" alt="">
								</div>
								<p class="feature-desc">
									의료진 상담 시 결정한 방법으로 <br>
									치료를 진행합니다.
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="diabet06 notandum-sec txt-center">
					<h2 class="cont-tit">당뇨망막병증 예방법 및 주의사항</h2>
					<div class="col-list-wrap">
						<ul class="col-list">
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_diabet_ntd01.png" alt="">
								</div>
								<div class="txt-wrap">
									<h3>안과 정기 검진</h3>
									<p>
										당뇨망막병증은 치료받지 않으면 실명까지 초래할 수 있는 질환으로 최소 6개월에 <br>
										한 번 정기적인 안과 검진이 중요합니다.
									</p>
								</div>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_diabet_ntd02.png" alt="">
								</div>
								<div class="txt-wrap">
									<h3>혈당 관리</h3>
									<p>
										당뇨병과 마찬가지로 당뇨망막병증도 개인 몸 상태에 맞는 혈당 관리가 중요합니다.
									</p>
								</div>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_diabet_ntd03.png" alt="">
								</div>
								<div class="txt-wrap">
									<h3>규칙적인 생활</h3>
									<p>
										금주, 금연, 건강한 식습관 등 규칙적인 생활 습관 개선도 중요합니다.
									</p>
								</div>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_diabet_ntd04.png" alt="">
								</div>
								<div class="txt-wrap">
									<h3>주의사항</h3> 
									<p>
										당뇨망막병증은 별다른 초기 증상이 없음으로 당뇨병 진단 시 안과 검진도 받아야 합니다. <br>
										당뇨병 환자는 안구 이상이 없어도 6개월에서 1년 사이에 정기검진이 필요합니다.
									</p>
								</div>
							</li>
						</ul>
					</div>
					<a href="/community/review" class="anchor-arrow">고객 체험기 바로가기</a>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			dragEvent();
		});
		
		function dragEvent(){
			var dragOffset = $(".drag_frame_box").offset().top;

			$(window).scroll(function() {
				var scrollTop = $(window).scrollTop() + 300;

				if(!$(".btn_drag.ui-draggable").is(".auto")){
					if(scrollTop > dragOffset){
						autoDrag()
					}
				}
			});

			$(".btn_drag").draggable({
				axis: "x",
				containment: "parent",
				drag: function( event, ui ) {
					console.log(event);
					console.log(ui);
					var barWidth = $(this).parent().innerWidth();
					var trans = ui.position.left/barWidth;
					$(".img.drag").css("opacity", trans)
				}
			});

			// auto 작동중일때는 drag 안되게 추가
			if ($('.btn_drag.ui-draggable').is(':animated')) {
				return;
			}

		}
	</script>
</body>
</html>