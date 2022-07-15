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
			<h2 class="sub_title">제안 &middot; 제휴</h2>
			<div class="partner_wrap">
				<ul class="sub_tab_menu flex wsize">
					<li class="active" rel="partner_tab01">제휴 제안</li>
					<li rel="partner_tab02">제휴 예약 신청</li>
					<li rel="partner_tab03">안 종합검진 신청</li>
				</ul>
				<div class="tab_contents" id="tab_contents">
					<!-- 제휴 제안 -->

					<!--// 제휴 제안 -->

					<!-- 제휴 예약 신청 -->
					
					<!--// 제휴 예약 신청 -->

					<!-- 안 종합검진 신청 -->
					
					<!--// 안 종합검진 신청 -->
					
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript" src="/common/js/jquery.tmpl.plus.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#partner_tab01_tmpl").tmpl().appendTo(".tab_contents");
			this.title = $(".sub_tab_menu").find(".active").text();
			applyAPI("btn_apply", "agree", this.title, "BD08");
			$(".sub_tab_menu li:eq(0)").click();
		});
	</script>
	
	<script type="text/x-jquery-tmpl"  id="partner_tab01_tmpl">
		<div id="partner_tab01" class="tab tab_prop">
			<div class="sub_visual flex">
				<div class="sub_visual_txt wsize02">
					<p class="title">제휴기업 제안</p>
					<p class="desc">
						강남그랜드안과와 의료 복지 제휴를 맺은 협력 임직원 및 가족 분들에게 
						전용 혜택·예약 등 다양한 프로그램을 제공하고 있습니다.<br>
						협력을 원하신다면 제휴 협력 제안을 먼저 신청해주시기 바랍니다.
					</p>
				</div>
			</div>
			<div class="part_write_box wsize02">
				<h3 class="sub_title03">제휴 기업 정보 입력</h3>
				<div class="write_box_inr">
					<div class="select_box">
						<div class="select">제휴 및 제안을 선택하세요.</div>
						<ul class="select_ul">
							<li>기업 제휴</li>
							<li>프로모션 제안</li>
							<li>광고 &middot; 마케팅 제안</li>
						</ul>
					</div>
					
					<div class="input-wrap">
						<div class="flex_between">
							<div class="input_box flex">
								<label for="name">작성자</label>
								<input type="text" id="name">
							</div>
							<div class="input_box flex">
								<label for="company">회사명</label>
								<input type="text" id="company">
							</div>
						</div>
						<div class="flex_between">
							<div class="input_box flex">
								<label for="phone">연락처</label>
								<input type="text" id="phone">
							</div>
							<div class="input_box flex">
								<label for="email">이메일</label>
								<input type="text" id="email">
							</div>
						</div>
					
						<div class="input_box input_cont flex">
							<label for="cont">문의 내용</label>
							<input type="text" id="cont">
						</div>
					</div>

					<div class="terms-wrap">
						<h4 class="sub_title04">약관 동의</h4>
						<div class="check_box">
							<input type="checkbox" id="agree">
							<label for="agree">개인 정보 수집 및 이용 목적</label>
						</div>
						<ul class="list_box">
							<li>토요일 오후나 공휴일인 경우 다음 진료날 연락드립니다.</li>
							<li>원하시는 날짜 혹은 일정을 문의주시면 확인 후 전화로 확정 일정 잡아드리겠습니다.</li>
						</ul>
					</div>
				</div>
			</div>
			<a href="javascript:void(0)" class="btn_apply">제휴 신청하기</a>
		</div>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="partner_tab02_tmpl">
		<div id="partner_tab02" class="tab tab_appl">
			<div class="sub_visual flex">
				<div class="sub_visual_txt wsize02">
					<p class="title">제휴기업 전용 예약 ( 개인 )</p>
					<p class="desc">
						강남그랜드안과와 의료 복지 제휴를 맺은 <br class="mo_show">협력 임직원 및 가족 분들
						전용 예약 페이지 입니다. <br>
						전담 상담사를 통해 원활한 <br class="mo_show">의료 서비스를 받아보실 수 있습니다.
					</p>
				</div>
			</div>
			<div class="part_write_box wsize02">
				<h3 class="sub_title03">개인 정보 입력</h3>
				<div class="write_box_inr">
					<div>
						<div class="flex_between">
							<div class="input_box flex">
								<label for="name">작성자</label>
								<input type="text" id="name">
							</div>
							<div class="input_box flex">
								<label for="company">회사명</label>
								<input type="text" id="company">
							</div>
						</div>
						<div class="flex_between">
							<div class="input_box flex">
								<label for="phone">연락처</label>
								<input type="text" id="phone">
							</div>
							<div class="input_box flex">
								<label for="email">이메일</label>
								<input type="text" id="email">
							</div>
						</div>
					
						<div class="input_box input_cont flex">
							<label for="cont">문의 내용</label>
							<input type="text" id="cont">
						</div>
					</div>

					<div class="terms-wrap">
						<h4 class="sub_title04">약관 동의</h4>
						<div class="check_box">
							<input type="checkbox" id="agree">
							<label for="agree">개인 정보 수집 및 이용 목적</label>
						</div>
						<ul class="list_box">
							<li>토요일 오후나 공휴일인 경우 다음 진료날 연락드립니다.</li>
							<li>원하시는 날짜 혹은 일정을 문의주시면 확인 후 전화로 확정 일정 잡아드리겠습니다.</li>
						</ul>
					</div>
				</div>
			</div>
			<a href="javascript:void(0)" class="btn_apply">제휴 신청하기</a>
		</div>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="partner_tab03_tmpl">
		<div id="partner_tab03" class="tab tab_medi">
			<div class="sub_visual flex">
				<div class="sub_visual_txt wsize02">
					<p class="title">안 종합 검진 신청 ( 기업 )</p>
					<p class="desc">
						강남그랜드안과는 제휴 기업을 대상으로 안 관련 질병을 조기 예방하고
						치료를 통해 임직원 가족 분들의 시력을 지켜드리고 있습니다.
						신청서를 작성해주시면 확인 후 연락드리도록 하겠습니다.
					</p>
				</div>
			</div>
			<div class="part_write_box wsize02">
				<h3 class="sub_title03">안 종합 검진 신청 정보 입력</h3>
				<div class="write_box_inr">
					<div>
						<div class="flex_between">
							<div class="input_box flex">
								<label for="name">작성자</label>
								<input type="text" id="name">
							</div>
							<div class="input_box flex">
								<label for="company">회사명</label>
								<input type="text" id="company">
							</div>
						</div>
						<div class="flex_between">
							<div class="input_box flex">
								<label for="phone">연락처</label>
								<input type="text" id="phone">
							</div>
							<div class="input_box flex">
								<label for="email">이메일</label>
								<input type="text" id="email">
							</div>
						</div>
					
						<div class="input_box input_cont flex">
							<label for="cont">문의 내용</label>
							<input type="text" id="cont">
						</div>
					</div>

					<div class="terms-wrap">
						<h4 class="sub_title04">약관 동의</h4>
						<div class="check_box">
							<input type="checkbox" id="agree">
							<label for="agree">개인 정보 수집 및 이용 목적</label>
						</div>
						<ul class="list_box">
							<li>토요일 오후나 공휴일인 경우 다음 진료날 연락드립니다.</li>
							<li>원하시는 날짜 혹은 일정을 문의주시면 확인 후 전화로 확정 일정 잡아드리겠습니다.</li>
						</ul>
					</div>
				</div>
			</div>
			<a href="javascript:void(0)" class="btn_apply">검진 신청하기</a>
		</div>
	</script>
	
</body>
</html>