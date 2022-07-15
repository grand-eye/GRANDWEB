<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n");%>

<!-- 썸네일 스와이퍼 리스트 -->
<script type="text/x-jquery-tmpl"  id="thumb_swiper_list">
	<div class="swiper-slide">
		{{if board_menu_code == "BD03"}}
		<a href="/community/event_detail/\${board_idx}" class="item_box_m">
		{{else}}
		<a href="/community/review_detail/\${board_idx}" class="item_box_m">
		{{/if}}
			<div class="img" style="background:url('{{html $item.replaceImg()}}') no-repeat center center; background-size:cover;"></div>
			<div class="txt_box">
				<p class="title">\${board_title}</p>
				{{if board_menu_code == "BD03"}}
				<span class="date">\${board_show_str_date} ~ \${board_show_end_date}</span>
				{{/if}}
				{{if board_menu_code == "BD03"}}
				<div class="btn_link"></div>
				{{/if}}
			</div>
		</a>
	</div>
</script>

<!-- 인덱스 스와이퍼 리스트  -->
<script type="text/x-jquery-tmpl"  id="index_swiper_list">
	<div class="swiper-slide">
		{{if board_menu_code == "BD01"}}
		<a href="/community/notice_detail/\${board_idx}">\${board_title}</a>
		{{else}}
		<a href="/community/media_detail/\${board_idx}">\${board_title}</a>
		{{/if}}
	</div>	
</script>

<script type="text/x-jquery-tmpl"  id="banner_swiper_list">
	<div class="swiper-slide">
		<a href="javascript:movePage('\${board_url}');">
			<div class="img-wrap pc_show">
				<img src="{{html $item.replaceImg()}}" alt="메인 비주얼">
			</div>
			<div class="img-wrap mo_show">
				<img src="{{html $item.replaceImg("mo")}}" alt="메인 비주얼">
			</div>
		</a>
	</div>
</script>

<!-- 팝업 스와이퍼  <991px 기준> -->
<script type="text/x-jquery-tmpl"  id="popup_swiper_list">
	<div class="swiper-slide popup_slide" data-opt="\${board_etc1}" style="" pcImg="{{html $item.replaceImg()}}" moImg="{{html $item.replaceImg('mo')}}" >
		<a href="javascript:movePage('\${board_url}');">
			<p class="txt01">
				\${board_title}
			</p>
			<p class="txt02">{{html $item.replacePopup()}}</p>
		</a>
	</div>
</script>

<!-- 온라인 상담 리스트 (BD04)  -->
<script type="text/x-jquery-tmpl"  id="BD04_list">

	<tr>
		<td>
			{{if board_etc1 == "Y"}}
			<span class="class answer">
			{{else}}
			<span class="class wait">
			{{/if}}			
				{{html $item.replyYn()}}
			</span>
		</td>

		<td>\${tcd_title}</td>
		<td class="title" onclick="secret_tmpl(\${board_idx});"><span class="icon_lock"></span>\${board_title}</td>
		<td class="name">\${board_reg_name}</td>
		<td class="ls0">\${board_reg_date}</td>
	</tr>
</script>

<script type="text/x-jquery-tmpl"  id="BD04_list_mo">
	<li>
		<div onclick="secret_tmpl(\${board_idx});">
			<h3>\${board_title}</h3>
			<div class="icon_wrap"><span class="icon_lock"></span><span>\${board_reg_name} 님의 온라인 상담글이 등록되었습니다.</span></div>
			<span>\${board_reg_name}</span>
			<span class="icon_devide">|</span>
			<span>\${board_reg_date}</span>
		</div>	
		<td>
			{{if board_etc1 == "Y"}}
			<span class="class answer">
			{{else}}
			<span class="class wait">
			{{/if}}			
				{{html $item.replyYn()}}
			</span>
		</td>
	</li>
</script>
<!-- 온라인 상담 리스트 (BD04)  -->

<!-- 비밀글 암호처리  -->
<script type="text/x-jquery-tmpl"  id="secret_tmpl">
	<div class="pt45 media__detail counsel__confirm passwd_box">
		<div class="wsize pb200 pt60">
			<div class="counsel_confirm_box">
				<p class="title">작성자 확인</p>
				<p class="desc">온라인 상담 신청은 본인만 조회하실 수 있습니다.</p>
				<input type="password" class="btn_password passwd" autocomplete="new-password" placeholder="비밀번호를 입력하세요.">
				<a href="javascript:void(0)" class="btn_confirm btn_counsel_detail">확인</a>
			</div>
		</div> 
	</div>
</script>



<!-- 공지사항 리스트 (BD01) -->

<!-- PC버전 -->
<script type="text/x-jquery-tmpl"  id="BD01_list">
	{{if board_notice == 'Y' }}
	<tr class="bg" onclick="location.href='/community/notice_detail/\${board_idx}';">
		<td><span class="class notice">공지</span></td>
	{{else}}
	<tr onclick="location.href='/community/notice_detail/\${board_idx}';">
		<td>\${rnum}</td>
	{{/if}}		
		<td class="title">\${board_title}</td>
		<td>\${board_reg_name}</td>
		<td class="ls0">\${board_reg_date}</td>
	</tr>
</script>

<!-- 모바일 버전  -->
<script type="text/x-jquery-tmpl"  id="BD01_list_mo">
	<li>
		<div onclick="location.href='/community/notice_detail/\${board_idx}';">
			<h3>강남그랜드안과</h3>
			<p>\${board_title}</p>
			<span>\${board_reg_name}</span>
			<span class="icon_devide">|</span>
			<span>\${board_reg_date}</span>
		</div>
		{{if board_notice == 'Y' }}	
			<span class="class answer">공지</span>
		{{else}}

		{{/if}}
	</li>
</script>
<!-- 공지사항 리스트 (BD01) -->

<!-- 공지사항 상세 -->


<script type="text/x-jquery-tmpl"  id="BD01_detail">
	<div class="detail_title flex_between">
		<p class="title">[\${board_reg_name}]</p>
		<span class="date">\${board_reg_date}</span>
	</div>
	<div class="detail_write">
		<p class="txt">{{html $item.replaceTag()}}</p>
	</div>
</script>

<!-- 공지사항 상세 -->

<!-- 안물 안궁 TV 상세 -->


<script type="text/x-jquery-tmpl"  id="BD10_detail">
	<div class="detail_title flex_between">
		<p class="title">[\${board_reg_name}]</p>
		<span class="date">\${board_reg_date}</span>
	</div>
	<div class="detail_write">
		<p class="txt">{{html $item.replaceTag()}}</p>
	</div>
</script>

<!-- 안물 안궁 TV 상세 -->

<!-- QNA 리스트 -->
<script type="text/x-jquery-tmpl"  id="BD07_list">
	<li>
		<div class="qna_box q_box flex_between align-item-base">
			<div class="qna_inr flex align-item-base">
				<span class="f_gm qa fc_brown">Q.</span>
				<p class="cont">\${board_title}</p>
			</div>
			<button type="button"><img src="/common/img/common/icon_accordion_arrow.png" alt="화살표"></button>
		</div>
		<div class="qna_box n_box">
			<div class="flex align-item-base">
				<span class="f_gm qa fc_blue03">A.</span>
				<div class="qna_inr">
					<p class="cont">
						{{html $item.replaceTag()}}
					</p>
					<div class="info">
						원하시는 정보를 찾지 못하셨나요? 질문 남겨주시면 친절히 안내해드리겠습니다.	
						<a href="/community/counsel_write">상담하기</a>
					</div>
				</div>
			</div>
		</div>
	</li>
</script>

<!-- 미디어 리스트 -->
<script type="text/x-jquery-tmpl"  id="BD02_list">
	<li>
		<a href="/community/media_detail/\${board_idx}">
			<div class="news_box">        
				<div class="img_box">
					<span><img src="{{html $item.replaceImg()}}" alt="미디어"></span>
				</div>        
				<div class="txt_box">                 
					<p class="title">\${board_title}</p>           
					<p class="date">\${board_reg_date}</p>         
					<!-- <p class="cont">{{html $item.replaceTag()}}</p>        -->
				</div>       
			</div>  
		</a>
	</li>
</script>

<!-- 미디어 리스트에 들어가는 안물 안궁TV -->
<script type="text/x-jquery-tmpl"  id="BD10_list">
	<li>
		<a href="/community/link_detail/\${board_idx}">
			<div class="tv_box">        
				<div class="img_box">
					<span><img src="{{html $item.replaceImg()}}" alt="미디어"></span>
				</div>        
				<div class="txt_box">                 
					<p class="title">\${board_title}</p>           
				</div>       
			</div>  
		</a>
	</li>
</script>

<!-- 미디어 디테일 -->
	<script type="text/x-jquery-tmpl"  id="BD02_detail_tmpl">
		<div class="detail_box">
			<div class="detail_title flex_between">
				<p class="title">\${board_title}</p>
				<span class="date">\${board_reg_date}</span>
			</div>
			<div class="detail_write flex">
				<div class="detail_write_inr">
					{{html $item.replaceTag()}}
				</div>
			</div>
		</div>
		
		<a href="/community/media" class="btn_apply">목록 보기</a>
		
		<ul class="detail_page_control">

		</ul>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD02_detail_prev_tmpl">
			<li class="control_box prev">
				<a href="/community/media_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[이전글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD02_detail_next_tmpl">
			<li class="control_box next">
				<a href="/community/media_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[다음글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>	
<!-- 미디어 디테일 -->

<!-- 이벤트 리스트 -->
<script type="text/x-jquery-tmpl"  id="BD03_list">
	<li>
		<a href="/community/event_detail/\${board_idx}">
			<div class="news_box">        
				<div class="img_box">
					<span><img src="{{html $item.replaceImg()}}" alt="이벤트"></span>
				</div>        
				<div class="txt_box">                 
					<p class="title">\${board_title}</p>           
					<p class="date">\${board_show_str_date} ~ \${board_show_end_date}</p>   
				<!--	<p class="cont">{{html $item.replaceTag()}}</p>        -->
				</div>       
			</div>  
		</a>
	</li>
</script>

<!-- 공지사항 디테일 -->
	<script type="text/x-jquery-tmpl"  id="BD01_detail_tmpl">
		<div class="detail_box">
			<div class="detail_title flex_between">
				<p class="title">\${board_title}</p>
				<span class="date">\${board_reg_date}</span>
			</div>
			<div class="detail_write flex">
				<div class="detail_write_inr">
					{{html $item.replaceTag()}}
				</div>
			</div>
		</div>
		
		<a href="/community/notice" class="btn_apply">목록 보기</a>
		
		<ul class="detail_page_control">

		</ul>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD01_detail_prev_tmpl">
			<li class="control_box prev">
				<a href="/community/notice_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[이전글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD01_detail_next_tmpl">
			<li class="control_box next">
				<a href="/community/notice_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[다음글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>	
<!-- 공지사항 디테일 -->

<!-- 안물 안궁 TV 디테일 -->
	<script type="text/x-jquery-tmpl"  id="BD10_detail_tmpl">
		<div class="detail_box">
			<div class="detail_title flex_between">
				<p class="title">\${board_title}</p>
				<span class="date">\${board_reg_date}</span>
			</div>
			<div class="detail_write flex">
				<div class="detail_write_inr">
					{{html $item.replaceTag()}}
				</div>
			</div>
		</div>
		
		<a href="/community/media" class="btn_apply">목록 보기</a>
		
		<ul class="detail_page_control">

		</ul>
	</script>
<!-- 안물 안궁 TV 디테일 -->	

<!-- 온라인 상담 디테일 -->
	<script type="text/x-jquery-tmpl"  id="BD04_detail_tmpl">
		<div class="detail_box">
			<div class="detail_title flex_between">
				<p class="title">\${board_title}</p>
				<span class="date">\${board_reg_date}</span>
			</div>
			<div class="detail_write flex">
				<div class="detail_write_inr">
					<ul class="counsel_detail_info">
						<li class="counsel_detail_list flex">
							<span class="title">고객 성함</span>
							<p class="cont">\${board_reg_name}</p>
						</li>
						<li class="counsel_detail_list flex">
							<span class="title">상담 내용</span>
							<p class="cont">\${tcd_title}</p>
						</li>
						<li class="counsel_detail_list flex">
							<span class="title">희망 시간</span>
							<p class="cont">\${tcds_title}</p>
						</li>
						<li class="counsel_detail_list flex">
							<span class="title">연락처</span>
							<p class="cont">\${board_mobile}</p>
						</li>
					</ul>
					<p class="txt">{{html $item.replaceTag()}}</p>
				</div>
			</div>
		</div>
		<div class="counsel_detail_answer">
			<p class="title">문의주신 상담에 대한 답변</p>
			{{if board_reply != null }}
			<div class="answer_box">
				<span>\${board_reply}</span>
			</div>
			{{else}}
			<div class="answer_box">
				<span>아직 등록된 답변이 없습니다.</span>
			</div>
			{{/if}}
			
			<div class="flex_between btn_box">
				<a href="/community/counsel" class="btn_apply">목록으로</a>
				<button type="button" class="btn_counsel ml__auto btn_update">수정</button>
				<button type="button" class="btn_counsel btn_delete">삭제</button>
			</div>
		</div>
		
		<ul class="detail_page_control">

		</ul>
	</script>
	
	<!-- 모바일 버전  -->
	
	
	
	<script type="text/x-jquery-tmpl"  id="BD04_detail_prev_tmpl">
			<li class="control_box prev">
				<a href="/community/notice_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[이전글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD04_detail_next_tmpl">
			<li class="control_box next">
				<a href="/community/notice_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[다음글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>	

<!-- 이벤트 디테일 -->
	<script type="text/x-jquery-tmpl"  id="BD03_detail_tmpl">
		<div class="detail_box">
			<div class="detail_title flex_between">
				<p class="title">\${board_title}</p>
				<span class="date">\${board_reg_date}</span>
			</div>
			<div class="detail_write flex">
				<div class="detail_write_inr">
					{{html $item.replaceTag()}}
				</div>
			</div>
		</div>

		<div class="sub event_db">
			<div class="wsize">
				<h3>검사 신청 선택</h3>
				<div class="select_container">
					<div class="checkup_list">
						<div class="checkup_list_title" opt="">검사 항목을 선택하세요.</div>
						<div class="info_box name_box"><input type="text" placeholder="성함을 입력하세요."></div>
						<ul class="checkup_list_ul">
							<li opt="RS01">노안&middot;백내장</li>
							<li opt="RS02">시력 교정</li>
							<li opt="RS03">드림 렌즈</li>
							<li opt="RS04">아이케어</li>
							<li opt="RS05">안 종합 검진</li>
						</ul>
						<div class="check_box_container">
							<input type="checkbox" id="info_agree" class="check_agree" name="개인 정보 수집에 동의합니다.">
							<label for="info_agree">개인 정보 수집에 동의합니다.</label>
						</div>
					</div>
					<div class="info_container">
						<div class="info_box age years_box"><input type="text" placeholder="나이를 입력하세요."></div>
						<div class="phone_num_list">
							<div class="phone_num_title">010</div>
							<ul class="phone_num_ul">
								<li>011</li>
								<li>016</li>
								<li>017</li>
								<li>019</li>
							</ul>
							<div class="num_box info_box"><input type="text" maxlength="8" placeholder="-없이 번호 8자리를 입력해주세요."></div>
						</div>
						<div class="btn_apply_box"><a href="javascript:void(0)" class="btn_apply btn_apply_block">검사 신청하기</a></div>
					</div>
				</div>
			</div>

		</div>
		<div class="personal_info">
			<div>
				<ul>
					<li>&middot; 개인정보 수집자 : 강남그랜드안과</li>
					<li>&middot; 개인정보 수집 및 이용 목적 : 강남그랜드안과에서 상담 활용(전화,SMS)</li>
					<li>&middot; 개인정보 보유 및 이용 기간 : 개인정보는 수집 및 이용 목적 달성 시까지 보유하며, 이용목적 달성되면 파기하는 것을 원칙으로 함</li>
				</ul>
				<div class="anchor-arrow_box"><a href="/home/privacy" class="anchor-arrow">개인정보 취급방침 자세히보기</a></div>
			</div>
		</div>
		
		<a href="/community/event" class="btn_apply">목록 보기</a>
		
		<ul class="detail_page_control">

		</ul>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD03_detail_prev_tmpl">
			<li class="control_box prev">
				<a href="/community/event_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[이전글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>
	<script type="text/x-jquery-tmpl"  id="BD03_detail_next_tmpl">
			<li class="control_box next">
				<a href="/community/event_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[다음글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>	
<!-- 이벤트 디테일 -->

<!-- 고객 체험기 리스트 -->
<script type="text/x-jquery-tmpl"  id="BD06_list">
		<li class="list_item">
			<a href="/community/review_detail/\${board_idx}">
				<div class="item_box">
					<div class="img"><img src="{{html $item.replaceImg()}}" alt="체험자 사진"></div>
					<div class="txt_box">
						<p class="title">\${board_title}</p>
						<!-- <span class="date">\${board_reg_date}</span> -->
					</div>
				</div>
				<span class="category"># \${tcd_title}</span>
			</a>
			{{if board_etc1 == 'Y' }}
			<div class="mark_best">BEST</div>
			{{/if}}
		</li>
</script>
<!-- 고객 체험기 리스트 -->

<!-- 고객 체험기 디테일 -->
	<script type="text/x-jquery-tmpl"  id="BD06_detail_tmpl">
		<div class="detail_box">
			<div class="detail_title flex_between">
				<p class="title">\${board_title}</p>
				<span class="date">\${board_reg_date}</span>
			</div>
			<div class="detail_info flex">
				<div class="info01 flex">
					<div class="title">고객 정보<span class="bar_title">ㅣ</span></div>
					<div class="name">\${board_etc2} / \${board_etc3}</div>
				</div>
				<div class="info02 flex">
					<div class="title">수술 방법<span class="bar_title">ㅣ</span></div>
					<div class="name">\${tcd_title}</div>
				</div>
			</div>
			<div class="detail_write flex">
				<div class="detail_write_inr">
					{{html $item.replaceTag()}}
				</div>
			</div>
		</div>
		
		<a href="/community/review" class="btn_apply">목록 보기</a>
		
		<ul class="detail_page_control">

		</ul>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="BD06_detail_prev_tmpl">
			<li class="control_box prev">
				<a href="/community/review_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[이전글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>
	<script type="text/x-jquery-tmpl"  id="BD06_detail_next_tmpl">
			<li class="control_box next">
				<a href="/community/review_detail/\${board_idx}" class="flex_between">
					<div class="flex">
						<span class="txt">[다음글]</span>
						<div class="title">\${board_title}</div>
					</div>
					<div class="date">\${board_reg_date}</div>
				</a>
			</li>	
	</script>	
<!-- 고객 체험기 디테일 -->

<script type="text/x-jquery-tmpl"  id="eventList">
	<div class="swiper-slide">
		<a href="javascript:void(0)" class="item_box">
			<div class="img"><img src="/common/img/main/img_event01.png" alt="우리아이 드림렌즈"></div>
			<div class="txt_box">
				<p class="title">아이의 꿈을 키워주는 드림 이벤트</p>
				<span class="date">2021-03</span>
				<div class="btn_link"></div>
			</div>
		</a>
	</div>
	<div class="swiper-slide">
	<a href="javascript:void(0)" class="item_box">
			<div class="img"><img src="/common/img/main/img_event02.png" alt="흘러내리는 안경은 이제그만!"></div>
			<div class="txt_box">
				<p class="title">원데이 시력 교정</p>
				<span class="date">2021-03</span>
				<div class="btn_link"></div>
			</div>
		</a>
	</div>
	<div class="swiper-slide">
		<a href="javascript:void(0)" class="item_box">
			<div class="img"><img src="/common/img/main/img_event03.png" alt="내 눈, 새로고침!"></div>
			<div class="txt_box">
				<p class="title">신중년층 프리미엄 노안 교정</p>
				<span class="date">2021-03</span>
				<div class="btn_link"></div>
			</div>
		</a>
	</div>
	<div class="swiper-slide">
		<a href="javascript:void(0)" class="item_box">
			<div class="img"><img src="/common/img/main/img_event01.png" alt="우리아이 드림렌즈"></div>
			<div class="txt_box">
				<p class="title">아이의 꿈을 키워주는 드림 이벤트</p>
				<span class="date">2021-03</span>
				<div class="btn_link"></div>
			</div>
		</a>
	</div>
	<div class="swiper-slide">
		<a href="javascript:void(0)" class="item_box">
			<div class="img"><img src="/common/img/main/img_event02.png" alt="흘러내리는 안경은 이제그만!"></div>
			<div class="txt_box">
				<p class="title">원데이 시력 교정</p>
				<span class="date">2021-03</span>
				<div class="btn_link"></div>
			</div>
		</a>
	</div>
	<div class="swiper-slide">
		<a href="javascript:void(0)" class="item_box">
			<div class="img"><img src="/common/img/main/img_event03.png" alt="내 눈, 새로고침!"></div>
			<div class="txt_box">
				<p class="title">신중년층 프리미엄 노안 교정</p>
				<span class="date">2021-03</span>
				<div class="btn_link"></div>
			</div>
		</a>
	</div>
</script>

<script type="text/x-jquery-tmpl"  id="reviewList">
	<div class="swiper-slide">
		<div class="item_box">
			<div class="img"><img src="/common/img/main/img_review01.png" alt="체험자 사진"></div>
			<div class="txt_box">
				<p class="title">정**님 체험기</p>
				<span class="date">2021-03</span>
			</div>
		</div>
	</div>
	<div class="swiper-slide">
		<div class="item_box">
			<div class="img"><img src="/common/img/main/img_review02.png" alt="체험자 사진"></div>
			<div class="txt_box">
				<p class="title">권**님 체험기</p>
				<span class="date">2021-03</span>
			</div>
		</div>
	</div>
	<div class="swiper-slide">
		<div class="item_box">
			<div class="img"><img src="/common/img/main/img_review03.png" alt="체험자 사진"></div>
			<div class="txt_box">
				<p class="title">황**님 체험기</p>
				<span class="date">2021-03</span>
			</div>
		</div>
	</div>
	<div class="swiper-slide">
		<div class="item_box">
			<div class="img"><img src="/common/img/main/img_review01.png" alt="체험자 사진"></div>
			<div class="txt_box">
				<p class="title">정**님 체험기</p>
				<span class="date">2021-03</span>
			</div>
		</div>
	</div>
	<div class="swiper-slide">
		<div class="item_box">
			<div class="img"><img src="/common/img/main/img_review02.png" alt="체험자 사진"></div>
			<div class="txt_box">
				<p class="title">권**님 체험기</p>
				<span class="date">2021-03</span>
			</div>
		</div>
	</div>
	<div class="swiper-slide">
		<div class="item_box">
			<div class="img"><img src="/common/img/main/img_review03.png" alt="체험자 사진"></div>
			<div class="txt_box">
				<p class="title">황**님 체험기</p>
				<span class="date">2021-03</span>
			</div>
		</div>
	</div>
</script>

<script src="/common/js/HuskyEZCreator.js"></script>      
<script type="text/javascript">
var oEditors = [];
var $xhr = null;
var $tempFnc = {
	    replaceTag : function(){
				var data = this.data.board_detail;
				//data = data.replace(/[<](.*?)[>]/g,"");
				data = data.replace(/[&](.*?)[;]/g,"");

				return data;
		},
		replacePopup : function(){
				var data = this.data.board_detail;
				data = data.replace(/[<](.*?)[>]/g,"");
				data = data.replace(/[&](.*?)[;]/g,"");

				return data;
		},
		replaceCode : function(){
				var data = this.data.board_cate_L;
				if( data == "RS01" ){
					data = "노안/백내장 관련";
				}else if( data == "RS02" ){
					data = "시력 교정 관련";
				}else if( data == "RS03" ){
					data = "드림 렌즈 관련";
				}else if( data == "RS04" ){
					data = "안 질환 관련";
				}else if( data == "RS05" ){
					data = "아이케어 관련";
				}

				return data;
		},
		replaceStr : function(){
			var data = this.data.board_title;
			
			if(data.length > 15){
				data = data.substr(0,14);
				data = data + " ...";
			}

			return data;
		},
			
		replaceImg : function(size){
			var saveFiles = this.data.save_file;
			var saveArr = new Array();
			if (saveFiles.indexOf("|") > -1 ) 
			{
				saveArr = saveFiles.split("|");
			}
			else
			{
				saveArr.push(saveFiles);
			}

			var data = ""+saveArr[0];
			if( size =="mo" ){
				data = ""+saveArr[1];
			}
			return data;
		},
			
		splitImg1 : function(){
			var data = this.data.save_file.split('|');
			data = "/common/images" + data[0];
			return data;
		},
		
		splitImg2 : function(){
			var data = this.data.save_file.split('|');
			data = "/common/images" + data[1];
			return data;
		},
		
		replaceName : function(){
			
			var level = "${sessionScope.GRAND_USER_LEVEL}";
			if(level ==""){
				level = 10;
			}else{
				parseInt(level);
			}
			var data = this.data.board_reg_name;
			if(level > 2){
				data = data.replace(data.substring(1),"**");
			}
			return data;
		},
		
		replaceSpace : function(){
			var data = this.data.board_detail;
			return data;
		},
		charSpace : function(){
			if(this.data.board_detail !=null){
				var data = this.data.board_detail;
				data = data.replace(/[</](.*?)[>]/g,"\n");
				data = data.replace(/[<](.*?)[>]/g,"");
				return data;
			}else{
				return "";
			}
			
		},
		replySpace : function(){
			if(this.data.board_reply !=null){
				var data = this.data.board_reply;
				data = data.replace(/[</](.*?)[>]/g,"\n");
				data = data.replace(/[<](.*?)[>]/g,"");
				return data;
			}else{
				return "";
			}
			
		},
		columnImg : function(){
			var data = ""+this.data.column_thum;
			return data;
		},
		columnTag : function(){
			var data = this.data.column_content;
			data = data.replace(/[<](.*?)[>]/g,"");
			data = data.replace(/[&](.*?)[;]/g,"");
			return data;
		},
		encodeURI : function(){
			var data = this.data.board_title;
			data = encodeURIComponent(data);
			return data;
		},
		replyYn : function(){
			var data = this.data.board_etc1;
			if( data =="Y"){
				data = "답변 완료";
			}else{
				data = "대기중";
			}
			return data;
		}
			
   };
   
	function commonTemplate(box,url_prm,template_id,swiper_prm,swiper_class,banner_yn){

		$boardList.set({
			box 				: box
			,url           	 	: "/community/interface/communityList/"+url_prm
	      	,templeat      	    : template_id
			,onComplete        : function(data){

				if( banner_yn =='Y' ){
					if( url_prm == 'BD06' ) {
						bannerSwiper1(swiper_prm,swiper_class);	
					} else {
						bannerSwiper(swiper_prm,swiper_class);
					}
				}else if( banner_yn =='main' ){
					mainBannerSwiper(swiper_prm,swiper_class);
				}else if( banner_yn =='NEW' ){
					bannerSwiper_new(swiper_prm,swiper_class);
				}else if( banner_yn =='popup' ){
					popupSwiper(swiper_prm,swiper_class);
					resizePopup();
				}else{
					rollingSwiper(swiper_prm,swiper_class);
				}
				
	        }
		});
	}

	var $page = 1;
	var $pagesize = 10;	
	var $boardList = {
			
			set: function( options )
			{
				var setting = $.extend({ 
						box			 		: ""
					,	url					: ""
					,	board_idx			: 0
					,	board_search 		: ""
					,	type				: ""
					,	page				: $page
					,	pageinit			: ""
					,	category			: ""
					,   templeat			: ""
					,	list_form			: ""
					,	search_category		: ""
					,	pagingbox			: ".ui-paging"
					,	init				: ""
					, 	onChange   		: function( row, that ){ }
					/* ,   onBefore  : function(){
						
					} */
					,   onComplete  : function( row ){
					}
					,   onSuccecs     : function( row ){
					}
				} , options );
				__dataload(setting, $page );
		    }
			
	};			
			
	function __dataload( setting, page ){

		var roundNumber = 10;
		if( setting.list_form == "BD02" || setting.list_form == "BD03"){
			roundNumber = 6;
		}
		/*
		else if(setting.list_form == "BD06"){
			roundNumber = 10;
		}
		*/

		var param = {};
		param.board_idx				= setting.board_idx;
		param.board_search 			= setting.board_search;
		param.search_level     		= 0;
		param.board_cate_L			= setting.category;
		param.search_useyn   		= "Y";
		param.rows	 			  	= roundNumber;
		param.page 					= setting.page;
		param.search_category		= setting.search_category;

		$xhr = $.ajax(
			{
				 url      			 : setting.url
				,data 				 : param
				,type    			 : "POST"
				,dataType 		 	 : "json"
               /* ,beforeSend : function(xhr,opts) {
            	   
               } */
				,success  : function(response) {
					setting.onSuccecs(response);

					if( setting.board_search !=null && setting.board_search !='' && response.count == 0 ){
						alert('검색 결과가 없습니다.');
						return false;
					}
					
					var next;
					var prev;
					
					if( setting.board_idx != 0 ){

						if( response.rows[0].board_idx == setting.board_idx ){
							console.log(response.rows.length);
							if(response.rows.length == 3){
								prev = response.rows[1];
								next = response.rows[2];
								response.rows = response.rows[0];
							}else{
								next = response.rows[1];
								response.rows = response.rows[0];
							}
							
						}else if( response.rows[1].board_idx == setting.board_idx ){
							prev = response.rows[0];
							next = response.rows[2];
							response.rows = response.rows[1];
						}else if( response.rows[2].board_idx == setting.board_idx ){
							prev = response.rows[1];
							response.rows = response.rows[2];
						}
						
					}
					
					response.c_reffers = "";
					
					if ( response.count > 0 && response.count > response.pageNum){
						
						var totalPage = Math.ceil( response.count / roundNumber );
						
						var totalPagingCount = Math.floor( response.count / (roundNumber*10) );
						var LastNum = ( response.count % (roundNumber*10) );
						
						var nowPageNum = response.pageNum;
						var pageNum = Math.floor(response.pageNum / (roundNumber*10));
						var pageList = (totalPage / roundNumber);
						pageFirstNum = (roundNumber*pageNum)+1;
						
						if( pageNum < totalPagingCount ){
							pageList = ( pageFirstNum -1 ) +roundNumber;
						}else{
							pageList = ( Math.floor( LastNum / roundNumber ) );
							
							if( LastNum % roundNumber != 0 ){
								pageList +=1;
							}
							pageList += (totalPagingCount * 10);
						}
						
						var $tmpleat = $( setting.templeat );
						var $tmpleat_mo = $( setting.templeat+"_mo" );
						var $html = $tmpleat.tmpl( response.rows,$tempFnc);
						var $html_mo = $tmpleat_mo.tmpl( response.rows,$tempFnc);
						
						/* if( setting.templeat.indexOf("BD04_detail_tmpl") > -1 ){
							
						} */
						
						
						
						if( setting.box ==".BD01_list" && setting.init != "Y" ){
							setting.box += " tbody";
						}
						
						if( setting.box ==".BD04_list" && setting.init != "Y" ){
							setting.box += " tbody";
						}
						
						
						if(setting.init == "Y"){
							$(setting.box).append($html);
							$(setting.box+"_mo").append($html_mo);
							
							var paging = "";
							
							paging += "<li><span> < </span></li>";
							for(var i=pageFirstNum;i<=pageList;i++){
								paging += "<li>"+i+"</li>";
							}
							paging += "<li><span> > </span></li>";

							$(".paging").html(paging);

							clickEvent(response.count,roundNumber,search_text);
							
						}else if(setting.pageinit =="prev" || setting.pageinit =="next"){
							$(setting.box).html("");
							$(setting.box).append($html);
							
							var paging = "";
							paging += "<li><span> < </span></li>";
							for( var i=pageFirstNum;i<=pageList;i++ ){
								paging += "<li>"+i+"</li>";
							}
							paging += "<li><span> > </span></li>";
							
							$(".paging").html(paging);
							
							clickEvent(response.count,roundNumber,search_text);
							
							if( setting.pageinit =="prev" ){
								$(".paging > li:eq(10)").addClass("active");
							}else if ( setting.pageinit =="next" ){
								$(".paging > li:eq(1)").addClass("active");
							}
							
						}else{
							
							
							
							$(setting.box).html("");
							$(setting.box).append($html);			
							
						}
						
						if( setting.board_idx != 0 ){
							if( prev != undefined ){
								$("#"+response.rows.board_menu_code+"_detail_prev_tmpl").tmpl(prev).appendTo(".detail_page_control");
							}
							if( next != undefined ){
								$("#"+response.rows.board_menu_code+"_detail_next_tmpl").tmpl(next).appendTo(".detail_page_control");
							}
						}
					}
				},complete : function() {
					setting.onComplete();
				},onComplete : function() {
					
				}
			}	
		);	 
	}		
			
	function movePage(link) {
		if (link) {
			window.open(link);
		}
	}


</script>