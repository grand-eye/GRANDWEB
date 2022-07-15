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
		<div class="sub subEyecareJoinRetinaRevision retina__bimun">
			<h2 class="sub_title">비문증</h2>
			<div class="bimun_wrap page-wrap"><!-- 비문증 -->
				<div class="wsize">
					<div class="drag_box">
						<div class="drag_frame_box">
							<div class="drag_frame">
								<span class="img"><img src="/common/img/sub/r_bm_img_normal.jpg" alt="정상적인 시야"></span>
								<span class="img drag"><img src="/common/img/sub/r_bm_img_abnormal.jpg" alt="비문증이 진행된 시야"></span>
							</div>

							<div class="drag_control">
								<div class="flex_between">
									<span class="title">정상적인 시야</span>
									<p class="bar">
										<span class="btn_drag ui-draggable auto">버튼</span>
									</p>
									<span class="title">비문증이 진행된 시야</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="bm01 first-sec txt-center">
					<h4 class="top-tit">눈앞에 떠다니는 이물질</h4>
					<h2 class="cont-tit">비문증</h2>
					<p class="cont-desc">
						비문증은 노화 등 여러 원인으로 유리체 내에 혼탁이 생기면 <br>
						망막에 그림자가 져 마치 눈앞에 이물질이 떠다니는 것처럼 느껴집니다. <br>
						날파리 같은 벌레가 떠다닌다고 해서 날파리증이라고도 합니다.
					</p>
					<ul class="img-list compare-list">
						<li>
							<div class="img-wrap">
								<img src="/common/img/sub/r_bm01_img01.png" alt="비교정상">
							</div>
							<h3>정상적인 눈</h3>
						</li>
						<li>
							<div class="img-wrap">
								<img src="/common/img/sub/r_bm01_img02.png" alt="비교비정상">
							</div>
							<h3 class="color-em">비문증이 있는 눈</h3>
						</li>
					</ul>
				</div>
				<div class="bm02 txt-center">
					<div class="wsize">
						<h4 class="top-tit">원인에 따른</h4>
						<h2 class="cont-tit">비문증 종류</h2>
						<ul class="feature-list kind-list">
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_bm02_pic01.png" alt="list">
								</div>
								<h4>생리적 비문증</h4>
								<p>
									생리적 비문증은 일종의 노화 현상으로 나이가 들면서 유리체의 점도가 떨어져 <br>
									액화 현상이 생겨 발생합니다. 고도 근시를 가지고 있는 분들은 유리체 액화 <br>
									현상이 더 빨리 진행될 수 있어 젊은 분들에게도 발생할 수 있습니다.
									<span class="space-sm"></span>
									이 경우는 대개 별다른 치료 없이 생활 습관 개선 및 정기적인 <br>
									검진이 필요합니다.
								</p>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_bm02_pic02.png" alt="list">
								</div>
								<h4>병적 비문증</h4>
								<p>
									병적 비문증은 개인의 질환과 관련해 발생합니다. <br>
									특히 망막 이상으로 발생할 수 있는데 유리체 출혈, 포도막염, 당뇨망막병증, <br>
									망막박리 등과 관련해서 생길 수 있습니다.
									<span class="space-sm"></span>
									이 경우는 생리적 비문증과 다르게 특정 원인으로 발생했으므로 <br>
									발견 즉시 치료가 필요합니다.
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="bm03 txt-center">
					<h4 class="top-tit">대표적인</h4>
					<h2 class="cont-tit">비문증 시야 및 증상</h2>
					<div class="wsize">
						<ul class="img-list">
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_bm03_pic01.png" alt="정상시야">
								</div>
								<h4>정상 시야</h4>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_bm03_pic02.png" alt="이상시야">
								</div>
								<h4>비문증 시야</h4>
							</li>
						</ul>
					</div>
					<div class="gray-bg txt-center">
						<h3>비문증 환자의 대표 증상</h3>
						<div class="check-list-wrap">
							<ul class="check-list check-icon-list">
								<li>점 혹은 날파리와 같은 물체가 눈앞에 보입니다.</li>
								<li>눈앞에 거미줄 또는 물방울 모양이 보입니다.</li>
								<li>시야 앞에 떠다니는 줄 모양의 음영이 나타납니다.</li>
								<li>눈을 감거나 떴을 때 번쩍거리는 증세가 있습니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="bm04 care-sec txt-center">
					<div class="navy-bg">
						<h4 class="top-tit">강남그랜드안과</h4>
						<h2 class="cont-tit">비문증 치료 방법</h2>
					</div>
					<div class="gray-bg">
						<div class="wsize">
							<div class="icon-list">
								<div class="img-wrap"><img src="/common/img/sub/e_sty03_icon.png" alt="labelicon"></div>
								<h4 class="box-tit">개인 맞춤 정밀 검사</h4>
								<p class="cont-desc cont-desc01">
									강남그랜드안과는 정밀 검사 및 의료진 상담을 통해 <br>
									개인에게 맞는 비문증 치료 방법을 안내합니다.
								</p>
								<p class="cont-desc cont-desc02">
									비문증은 특별한 원인 없이 갑자기 발생하는 경우가 많아 <br>
									일반적으로 시력에 영향을 미치지 않습니다. <br>
									그래서 별다른 이상이 없으면 정기적인 검진으로 진행 상태를 확인합니다.
									<span class="space-sm"></span>
									단, 비문증의 발병 원인이 망막과 관련 있다면 <br>
									레이저 치료나 수술적 치료를 진행합니다.
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="bm05 txt-center">
					<h4 class="top-tit">강남그랜드안과</h4>
					<h2 class="cont-tit">비문증 클리닉 시스템</h2>
					<p class="cont-desc">
						강남그랜드안과는 정밀 검사를 통해 고객의 눈 상태를 확인합니다. <br>
						검사 후 의료진과 일대일 맞춤 상담으로 비문증 증상 확인 및 치료 방법을 결정합니다.
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
									<img src="/common/img/sub/e_sty04_bg03.png" alt="클리닉3">
									<p>치료 진행</p>
								</div>
								<p class="feature-desc">
									치료가 필요할 시 의료진 상담 시 <br>
									결정한 방법에 따라 치료를 <br>
									진행합니다.
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
									치료가 필요할 시 의료진 상담 시 <br>
									결정한 방법에 따라 치료를 <br>
									진행합니다.
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="bm06 notandum-sec txt-center">
					<h2 class="cont-tit">비문증 예방법 및 주의사항</h2>
					<div class="col-list-wrap">
						<ul class="col-list">
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_bm_ntd01.png" alt="">
								</div>
								<div class="txt-wrap">
									<h3>심리적인 안정</h3>
									<p>
										노화로 인한 비문증은 특별한 치료법이 없어 자연스럽게 현상을 받아들이고 <br>
										평소 심리적인 안정과 규칙적인 생활 습관을 갖는 것이 좋습니다.
									</p>
								</div>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_bm_ntd02.png" alt="">
								</div>
								<div class="txt-wrap">
									<h3>무거운 물건 들지 않기</h3>
									<p>
										노화로 인한 경우 특별한 치료법은 없지만 무거운 물체를 들거나 힘든 일을 자주 하면 <br>
										증상이 악화될 수 있습니다. 평소 무리한 무리하지 않는 것이 중요합니다.
									</p>
								</div>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_bm_ntd03.png" alt="">
								</div>
								<div class="txt-wrap">
									<h3>안과 정기 검진</h3>
									<p>
										1년에 한 번 정도 정기적인 안과 검진을 통해 눈 상태를 확인하는 것이 좋습니다. <br>
										검사 결과가 정상일지라도 시야에 떠다니는 물체가 많아지거나 번쩍거리는 증상, <br>
										커튼이 가려진 것 같은 증상이 나타나면 바로 안과 검진을 받아야합니다.
									</p>
								</div>
							</li>
							<li>
								<div class="img-wrap">
									<img src="/common/img/sub/r_bm_ntd04.png" alt="">
								</div>
								<div class="txt-wrap">
									<h3>주의사항</h3>
									<p>
										비문증은 심각한 안구 질환은 아니지만 망막 열공, 망막 박리로 이어질 확률이 높습니다. <br>
										비문증이 있으신 분은 증상이 전보다 심해지거나 광시증이 생겼다면 바로 안과 검진을 받아야 합니다.
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