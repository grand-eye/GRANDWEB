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
			<h2 class="sub_title">고객 체험기</h2>
			<div class="wsize">
				<div class="search_box02 flex_between">
					<div class="search">
						<input type="search" placeholder="검색">
					</div>
					<button type="button" class="btn_search"></button>
				</div>

				<div class="check_box_wrap flex">
					<div class="check_box">
						<input type="checkbox" id="chk01">
						<label for="chk01">노안 &middot; 백내장</label>
					</div>
					<div class="check_box">
						<input type="checkbox" id="chk02">
						<label for="chk02">시력 교정 (라식&middot;라섹)</label>
					</div>
					<div class="check_box">
						<input type="checkbox" id="chk03">
						<label for="chk03">안구 건조</label>
					</div>
					<div class="check_box">
						<input type="checkbox" id="chk04">
						<label for="chk04">안 질환</label>
					</div>
				</div>

				<ul class="review_list">
					<li class="list_item">
						<a href="javascript:void(0)">
							<div class="item_box">
								<div class="img"><img src="/common/img/main/img_review01.png" alt="체험자 사진"></div>
								<div class="txt_box">
									<p class="title">정**님 체험기</p>
									<!-- <span class="date">2021-04-06</span> -->
								</div>
							</div>
							<div class="category"># 노안 &middot; 백내장</div>
						</a>
						<div class="mark_best">BEST</div>
					</li>
					<li class="list_item">
						<a href="javascript:void(0)">
							<div class="item_box">
								<div class="img"><img src="/common/img/main/img_review01.png" alt="체험자 사진"></div>
								<div class="txt_box">
									<p class="title">이**님 체험기</p>
									<!-- <span class="date">2021-04-06</span> -->
								</div>
							</div>
							<div class="category"># 노안 &middot; 백내장</div>
						</a>
						<div class="mark_best">BEST</div>
					</li>
					<li class="list_item">
						<a href="javascript:void(0)">
							<div class="item_box">
								<div class="img"><img src="/common/img/main/img_review01.png" alt="체험자 사진"></div>
								<div class="txt_box">
									<p class="title">이**님 체험기</p>
									<!-- <span class="date">2021-04-06</span> -->
								</div>
							</div>
							<div class="category"># 노안 &middot; 백내장</div>
						</a>
						<div class="mark_best">BEST</div>
					</li>
				</ul>

				<ul class="paging flex">
					<li><span> < </span></li>
					<li class="active">1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
					<li>6</li>
					<li>7</li>
					<li>8</li>
					<li>9</li>
					<li><span> > </span></li>
				</ul>

				<a href="javascipt:void(0)" class="btn_apply mb160">체험기 등록</a>
			</div> 
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
</body>
</html>