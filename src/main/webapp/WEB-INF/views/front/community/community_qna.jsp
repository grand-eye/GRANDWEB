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
			<h2 class="sub_title">자주 묻는 질문</h2>
			<div class="wsize pt100 pb100">
				<div class="search_box flex_between">
					<div class="search">
						<input type="search" placeholder="검색어를 입력하세요.">
					</div>
					<button type="button" class="btn_search">검색</button>
				</div>

				<div class="qna_wrap">
					<ul class="sub_tab_menu flex wsize mt70">
						<li class="active" rel="all">검사 장비</li>
						<li rel="qna01">수술 장비</li>
						<li rel="qna02">소독 장비</li>
						<li rel="qna03">소독 장비</li>
						<li rel="qna04">소독 장비</li>
					</ul>

					<div class="tab_contents mt100">
						<!-- 전체 -->
						<div id="all" class="tab tab_qna">
							<ul class="qna_list">
								<li>
									<div class="qna_box q_box flex_between align-item-base">
										<div class="qna_inr flex align-item-base">
											<span class="f_gm qa fc_brown">Q.</span>
											<p class="cont">녹내장은 수술이 가능한가요?</p>
										</div>
										<button type="button"><img src="/common/img/common/icon_accordion_arrow.png" alt="화살표"></button>
									</div>
									<div class="qna_box n_box">
										<div class="flex align-item-base">
											<span class="f_gm qa fc_blue03">A.</span>
											<div class="qna_inr">
												<p class="cont">
													녹내장은 가족력이 작용하는 안 질환입니다. 따라서 주변 친척 중에 녹내장 환자가 있었다면 35세 이후부터는 매해 정기 안과 검진을 받으시는 것이 좋습니다.
												</p>
												<div class="info">
													원하시는 정보를 찾지 못하셨나요? 질문 남겨주시면 친절히 안내해드리겠습니다.	
													<a href="javascript:void(0)">상담하기</a>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!--// 전체 -->

						<!-- 노안 백내장 -->
						<div id="qna01" class="tab tab_qna">
							<ul class="qna_list">
								<li>
									<div class="qna_box q_box flex_between align-item-base">
										<div class="qna_inr flex align-item-base">
											<span class="f_gm qa fc_brown">Q.</span>
											<p class="cont">녹내장은 수술이 가능한가요?</p>
										</div>
										<button type="button"><img src="/common/img/common/icon_accordion_arrow.png" alt="화살표"></button>
									</div>
									<div class="qna_box n_box">
										<div class="flex align-item-base">
											<span class="f_gm qa fc_blue03">A.</span>
											<div class="qna_inr">
												<p class="cont">
													녹내장은 가족력이 작용하는 안 질환입니다. 따라서 주변 친척 중에 녹내장 환자가 있었다면 35세 이후부터는 매해 정기 안과 검진을 받으시는 것이 좋습니다.
												</p>
												<div class="info">
													원하시는 정보를 찾지 못하셨나요? 질문 남겨주시면 친절히 안내해드리겠습니다.	
													<a href="javascript:void(0)">상담하기</a>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!--// 노안 백내장 -->

						<!-- 시력 교정 -->
						<div id="qna02" class="tab tab_qna">
							<ul class="qna_list">
								<li>
									<div class="qna_box q_box flex_between align-item-base">
										<div class="qna_inr flex align-item-base">
											<span class="f_gm qa fc_brown">Q.</span>
											<p class="cont">녹내장은 수술이 가능한가요?</p>
										</div>
										<button type="button"><img src="/common/img/common/icon_accordion_arrow.png" alt="화살표"></button>
									</div>
									<div class="qna_box n_box">
										<div class="flex align-item-base">
											<span class="f_gm qa fc_blue03">A.</span>
											<div class="qna_inr">
												<p class="cont">
													녹내장은 가족력이 작용하는 안 질환입니다. 따라서 주변 친척 중에 녹내장 환자가 있었다면 35세 이후부터는 매해 정기 안과 검진을 받으시는 것이 좋습니다.
												</p>
												<div class="info">
													원하시는 정보를 찾지 못하셨나요? 질문 남겨주시면 친절히 안내해드리겠습니다.	
													<a href="javascript:void(0)">상담하기</a>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!--// 시력 교정 -->

						<!-- 안질환 종합검진 -->
						<div id="qna03" class="tab tab_qna">
							<ul class="qna_list">
								<li>
									<div class="qna_box q_box flex_between align-item-base">
										<div class="qna_inr flex align-item-base">
											<span class="f_gm qa fc_brown">Q.</span>
											<p class="cont">녹내장은 수술이 가능한가요?</p>
										</div>
										<button type="button"><img src="/common/img/common/icon_accordion_arrow.png" alt="화살표"></button>
									</div>
									<div class="qna_box n_box">
										<div class="flex align-item-base">
											<span class="f_gm qa fc_blue03">A.</span>
											<div class="qna_inr">
												<p class="cont">
													녹내장은 가족력이 작용하는 안 질환입니다. 따라서 주변 친척 중에 녹내장 환자가 있었다면 35세 이후부터는 매해 정기 안과 검진을 받으시는 것이 좋습니다.
												</p>
												<div class="info">
													원하시는 정보를 찾지 못하셨나요? 질문 남겨주시면 친절히 안내해드리겠습니다.	
													<a href="javascript:void(0)">상담하기</a>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!--// 안질환 종합검진 -->

						<!-- 기타 -->
						<div id="qna04" class="tab tab_qna">
							<ul class="qna_list">
								<li>
									<div class="qna_box q_box flex_between align-item-base">
										<div class="qna_inr flex align-item-base">
											<span class="f_gm qa fc_brown">Q.</span>
											<p class="cont">녹내장은 수술이 가능한가요?</p>
										</div>
										<button type="button"><img src="/common/img/common/icon_accordion_arrow.png" alt="화살표"></button>
									</div>
									<div class="qna_box n_box">
										<div class="flex align-item-base">
											<span class="f_gm qa fc_blue03">A.</span>
											<div class="qna_inr">
												<p class="cont">
													녹내장은 가족력이 작용하는 안 질환입니다. 따라서 주변 친척 중에 녹내장 환자가 있었다면 35세 이후부터는 매해 정기 안과 검진을 받으시는 것이 좋습니다.
												</p>
												<div class="info">
													원하시는 정보를 찾지 못하셨나요? 질문 남겨주시면 친절히 안내해드리겠습니다.	
													<a href="javascript:void(0)">상담하기</a>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!--// 기타 -->

					</div>
				</div>

				<ul class="paging flex">
				
				</ul>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript">
		
	</script>
</body>
</html>