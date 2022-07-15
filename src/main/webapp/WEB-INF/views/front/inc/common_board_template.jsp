<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

	<script type="text/x-jquery-tmpl"  id="BD01_list_tmpl">
		<div class="search_box flex_between">
			<div class="search">
				<input type="search" placeholder="검색어를 입력하세요.">
			</div>
			<button type="button" class="btn_search">검색</button>
		</div>
	
		<div class="table_notice_wrap">
			<table class="table_notice pc_show BD01_list">
				<colgroup>
                	<col width="130px"/>
                	<col width="700px"/>
                    <col width="150px"/>
                    <col width="200px"/>
                </colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th class="title">제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<div class="mo_show">
				<ul class="mo_notice BD01_list_mo">
					
				</ul>
			</div>	
		</div>
	
		<ul class="paging flex">
			
		</ul>
	</script>
	
	

	<script type="text/x-jquery-tmpl"  id="BD04_list_tmpl">
		<div class="search_box flex_between">
			<div class="search">
				<input type="search" placeholder="검색어를 입력하세요.">
			</div>
			<button type="button" class="btn_search">검색</button>
		</div>
	
		<div class="table_notice_wrap">
			<table class="table_notice pc_show BD04_list">
				<colgroup>
                   <col width="130px"/>
                   <col width="300px"/>
                   <col width="550px"/>
                   <col width="180px"/>
                   <col width="170px"/>
                </colgroup>
				<thead>
					<tr>
						<th>답변 상태</th>
						<th>상담 내용</th>
						<th class="title">제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>	
		</div>

		<div class="mo_show">
			<ul class="mo_counsel BD04_list_mo">
				
			</ul>
		</div>
	
		<ul class="paging flex">
			
		</ul>
		
		<div id="counsel_btn">
			
		</div>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD07_list_tmpl">
		<div class="search_box flex_between">
			<div class="search">
				<input type="search" placeholder="검색어를 입력하세요.">
			</div>
			<button type="button" class="btn_search">검색</button>
		</div>

		<div class="qna_wrap">
			<ul class="sub_tab_menu flex wsize mt70">
				<li class="active" rel="all">전체</li>
				<li rel="QA01">노안&middot;백내장</li>
				<li rel="QA02">시력교정</li>
				<li rel="QA03">안질환&middot;종합검진</li>
				<li rel="QA04">기타</li>
			</ul>

			<div class="tab_contents mt100">
				<!-- 전체 -->
				<div id="all" class="tab tab_qna">
					<ul class="BD07_list qna_list">

					</ul>
				</div>
				<!--// 전체 -->

				<!-- 노안 백내장 -->
				<div id="QA01" class="tab tab_qna">
					<ul class="BD07_list qna_list">

					</ul>
				</div>
				<!--// 노안 백내장 -->

				<!-- 시력 교정 -->
				<div id="QA02" class="tab tab_qna">
					<ul class="BD07_list qna_list">

					</ul>
				</div>
				<!--// 시력 교정 -->

				<!-- 안질환 종합검진 -->
				<div id="QA03" class="tab tab_qna">
					<ul class="BD07_list qna_list">

					</ul>
				</div>
				<!--// 안질환 종합검진 -->

				<!-- 기타 -->
				<div id="QA04" class="tab tab_qna">
					<ul class="BD07_list qna_list">

					</ul>
				</div>
				<!--// 기타 -->

			</div>
		</div>

		<ul class="paging flex">
		
		</ul>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD02_list_tmpl">
		<div class="search_box flex_between">
			<div class="search">
				<input type="search" placeholder="검색어를 입력하세요.">
			</div>
			<button type="button" class="btn_search">검색</button>
		</div>
		
		<div class="wsize03 pt100">
			<div class="news_wrap">
				<h3 class="sub_title05">뉴스 &middot; 언론 보도</h3>
				<div class="media_news_list mt40">
					<ul class="flex_between BD02_list">
						
					</ul>
				</div>
			</div>

			<ul class="paging flex">
				
			</ul>

			<div class="tv_wrap mt200">
				<h3 class="sub_title05">안물 안궁 TV</h3>
				<div class="media_tv_list mt40">
					<ul class="flex_between BD10_list">

					</ul>
				</div>
				<a href="https://www.youtube.com/channel/UC0xNBPgsEszoZ3QINqfcV4A" target="_blank" class="btn_tv">안물안궁 TV 보러가기</a>
			</div>
		</div>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD03_list_tmpl">
		<div class="search_box flex_between">
			<div class="search">
				<input type="search" placeholder="검색어를 입력하세요.">
			</div>
			<button type="button" class="btn_search">검색</button>
		</div>
		
		<div class="wsize03 pt100">
			<div class="news_wrap">
				<h3 class="sub_title05">이벤트</h3>
				<div class="media_news_list mt40">
					<ul class="flex_between BD03_list">
						
					</ul>
				</div>
			</div>

			<ul class="paging flex">
				
			</ul>
		</div>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD06_list_tmpl">
		<div class="search_box02 flex_between">
			<div class="search">
				<input type="search" placeholder="검색">
			</div>
			<button type="button" class="btn_search"></button>
		</div>

		<div class="check_box_wrap_r flex">
			<div class="check_box">
				<input type="checkbox" id="chk01" name="chk" val="RV01">
				<label for="chk01">노안 &middot; 백내장</label>
			</div>
			<div class="check_box">
				<input type="checkbox" id="chk02" name="chk" val="RV02">
				<label for="chk02">시력 교정 (라식&middot;라섹)</label>
			</div>
			<div class="check_box">
				<input type="checkbox" id="chk03" name="chk" val="RV03">
				<label for="chk03">안구 건조</label>
			</div>
			<div class="check_box">
				<input type="checkbox" id="chk04" name="chk" val="RV04">
				<label for="chk04">안 질환</label>
			</div>
		</div>

		<ul class="BD06_list flex review_list">
			
		</ul>

		<ul class="paging flex">

		</ul>
	</script>