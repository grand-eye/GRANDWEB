<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<div class="counsel_space"></div>

<div id="quick">
	<div id="qconsult">		
		<img src="/common/images/common/counsel_top.png" alt=""/>
		<form name="form" method="post" class="qform" onsubmit="javascript:return doSubmit_main_web()">					
			<fieldset>
				<input type="hidden" name="mh_type" id="mh_type" value="<?=$type_page?>">
				<input type="hidden" name="is_mobile" value="pc">
				<div class="fbox">
					<!-- <p class="txt">상담신청접수 후 빠른 시일내에<br>답변드리겠습니다.</p> -->
					<img src="/common/images/common/counsel_txt.png" alt=""/>
					<p class="frow"><input type="text" class="full" placeholder="이름" name="mh_name" id="mh_name2"/></p>
					<p class="frow"><input type="text" class="full" placeholder="연락처" name="mh_hp" id="mh_hp2" maxlength="13" onkeyup="ck_telephone(this);" onkeypress="return numkeyCheck(event);"/></p>
					<div class="frow"><textarea class="full" name="mh_message" id="mh_message2" placeholder="내용입력"></textarea></div>
					<div class="agree_cont">
						<input type="checkbox" id="checkbox012"/><label for="checkbox012">개인정보취급방침동의</label>
						<a href="javascript:void(0);" class="btn_modal">내용 확인</a>
					</div>
				</div>
				<input type="image" src="/common/images/common/btn_submit.png" alt="상담신청하기" class="btn_submit newCustomers">		
			</fieldset>
		</form>			
	</div>	
	<a href="javascript:void(0)" class="btn_top "><img src="/common/images/common/btn_top.png" alt=""></a>
</div>

<div class="modal_wrap">
	<div id="modal_popup">
		<div class="modal_content">
			<a href="javascript:void(0)" class="btn-close"></a>
			<div style="height:95%;">
				<h3>개인정보처리(취급)방침</h3>
				<div class="member_wrap" style="padding:20px 0 40px;height:100%;">
					<div class="m_body" style="height:100%;overflow-x:hidden;overflow-y:auto;">				
						<!-- mcontents -->
						<div class="m_contents">
							<div class="m_box">
								<div class="m_con">
									
								</div>
							</div>
						</div>        
						<!-- mcontents -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<a href="http://pf.kakao.com/_xovxoul" target="_blank" class="btn_kakao_pc kakaoB2bBtn" onmousedown="javascript:AM_PL('http://pf.kakao.com/_xovxoul');" ><img src="/common/images/common/btn_kakao.png" alt="카카오톡링크" onclick=""></a>

<script type="text/javascript">
	/* var stmnLEFT = 1210; // 오른쪽 여백 
	var stmnGAP1 = 0; // 위쪽 여백 
	var stmnGAP2 = 380; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
	var stmnBASE = 140; // 스크롤 시작위치 
	var stmnActivateSpeed = 30; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
	var stmnScrollSpeed = 30; //스크롤 속도 (클수록 느림)
	var stmnTimer; 

	
	function RefreshStaticMenu() { 
		var stmnStartPoint, stmnEndPoint; 
		stmnStartPoint = $("body").height() - $(window).height() - $(window).scrollTop();
		stmnEndPoint = $("body").height() - $(window).height();
		if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
		if (stmnStartPoint != stmnEndPoint) { 
		//stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
		document.getElementById('quick').style.top = '100px';
		stmnRefreshTimer = stmnScrollSpeed;
		
	}
		stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 

		
	} 

	

	function InitializeStaticMenu() 
	{
		document.getElementById('quick').style.top = '100px'; 
		//RefreshStaticMenu();
	}

	$(function(){
		InitializeStaticMenu();

		$('#modal_popup .btn-close').on('click',function(e){
			$('.modal_wrap').hide(200);
			$('body').removeClass('lock');
		});

		$('.btn_modal').on('click',function(e){			
			$('.modal_wrap').show(200);
			$('body').addClass('lock');
		});

		$(".btn_top").on("click", function() {
			$("html, body").animate({scrollTop:0}, '500');
			return false;		
		});
	}); */
</script>


<div id="fixed_btn">
	<a href="http://pf.kakao.com/_xovxoul" target="_blank" class="btn_kakao kakaoB2bBtn" onMouseDown="javascript:AM_PL('http://pf.kakao.com/_xovxoul');" onclick=""><img src="/common/images/common/btn_kakao.png" alt="카카오톡링크"/></a>
	<div class="counsel-top-btn"></div>
	<a href="javascript:void(0);" class="btn_counsel fbtn "><img src="/common/images/common/fbtn01.jpg" alt="" onclick=""/></a>
	<a href="tel:1899-2854" class="btn_tel02 fbtn newTelBtn" onclick="_LA.EVT('3498');fbq('track', 'AddToCart'); AM_PL('tel:1899-2854');" onclick=""><img src="/common/images/common/fbtn02.jpg" alt=""/></a>
</div>

<div id="counsel">
	<a href="javascript:void(0);" class="btn_close"><img src="/common/images/common/btn_counsel_close.jpg" alt="빠른상담 닫기"/></a>
	<div class="box">
		<h2><img src="/common/images/common/tit_counsel.jpg" alt="처음부터 일등치과 실시간 상담 문의"/></h2>
			<script src="/common/js/siteConsult.js?"></script>
			<form name="form" action="/board/consult_proc.php" method="post" class="qform" onsubmit="javascript:return doSubmit_main()">
			<input type="hidden" name="mh_type" id="mh_type" value="<?=$type_page?>">
			<input type="hidden" name="is_mobile" value="mobile">
			<fieldset>
				<legend class="hidden">빠른상담</legend>
				<table class="table01">
					<colgroup>
						<col style="width:45px;"/>
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th><label for="mh_name">이름</label></th>
							<td><input type="text" id="mh_name" name="mh_name"/></td>
						</tr>
						<tr>
							<th><label for="mh_hp">연락처</label></th>
							<td><input type="text" id="mh_hp" name="mh_hp" maxlength="13" onkeyup="ck_telephone(this);"/></td>									
						</tr>
						<tr>
							<th><label for="mh_message">내 용</label></th>
							<td>
								<textarea id="mh_message" name="mh_message" placeholder="상담내용을 작성해주세요"></textarea>			
							</td>
							
						</tr>
						<tr>
							<td colspan="2" class="chk_box">
								<p class="checkbox">
									<input type="checkbox" id="checkbox01"/><label for="checkbox01"> 개인정보취급방침동의 </label>
								</p>
								<a href="javascript:void(0);" class="btn_modal" style="margin-top:2px;">내용 확인</a>
							</td>
							
						</tr>
					</tbody>
				</table>
				<div class="input-wrap">
					<input type="image" src="/common/images/common/btn_counsel_submit.jpg" class="btn_submit newCustomers" alt="실시간 상담 문의하기"/>
				</div>
			</fieldset>
		</form>
	</div>
</div>
<!-- //consel -->

<script>
	$(function() {
		$('.btn_counsel').on('click',function(e){
			e.preventDefault();
			try { 
			 AM_PL('btn_counsel'); 
			 } catch (e) {}

			$(this).addClass('on');
			$('#counsel').addClass('on');
		});
		$('#counsel .btn_close').on('click',function(e){
			e.preventDefault();
			$('#counsel').removeClass('on');
			$('.btn_counsel').removeClass('on');
		});


		timeCheck();
		
	})

	


	$(".newTelBtn").on("click", function(){
		var url = location.pathname;
		var categoryName = "메인페이지";

		if ( url.indexOf("/community/community02.php") > -1  )
		{
			var searchStr = location.search.toLowerCase();

			if ( searchStr.indexOf("tb=news&act=view") > -1 )
			{
				categoryName="TEL_" + $(".board_view_top").find(".title").text();
			}
			else
			{
				categoryName = "TEL_미디어>컬럼";
			}
		}
		else
		{
			categoryName = "TEL_" + url;
		}


		/* gtag('event', 'EVENT', {'event_category' : categoryName , 'event_label' : '<?=$_SESSION['utm_source']?>/<?=$_SESSION['utm_medium']?>/<?=$_SESSION['utm_campaign']?>'  }); */
	});
	
	$(".newCustomers").on("click", function(){
		var url = location.pathname;
		var categoryName = "메인페이지";

		if ( url.indexOf("/community/community02.php") > -1  )
		{
			var searchStr = location.search.toLowerCase();

			if ( searchStr.indexOf("tb=news&act=view") > -1 )
			{
				categoryName="counsel_" + $(".board_view_top").find(".title").text();
			}
			else
			{
				categoryName = "counsel_미디어>컬럼";
			}
		}
		else
		{
			categoryName = "counsel_" + url;
		}

	});


	$(".kakaoB2bBtn").on("click", function(){
		var url = location.pathname;
		var categoryName = "메인페이지";

		if ( url.indexOf("/community/community02.php") > -1  )
		{
			var searchStr = location.search.toLowerCase();

			if ( searchStr.indexOf("tb=news&act=view") > -1 )
			{
				categoryName="KAKAO_" + $(".board_view_top").find(".title").text();
			}
			else
			{
				categoryName = "KAKAO_미디어>컬럼";
			}
		}
		else
		{
			categoryName = "KAKAO_" + url;
		}


		/* gtag('event', 'EVENT', {'event_category' : categoryName , 'event_label' : '<?=$_SESSION['utm_source']?>/<?=$_SESSION['utm_medium']?>/<?=$_SESSION['utm_campaign']?>'  }); */
	});

	function timeCheck() {
				
		var today = new Date();
		var now_h = today.getHours();
		var now_m = today.getMinutes();
		
		if( now_h > 8 && now_h < 19 ) {
		
			$("#fixed_btn").removeClass("tel_none");
			$(".btn_kakao_pc").removeClass("tel_none");

			if( now_h == 9 && now_m < 30 ) {

				$("#fixed_btn").addClass("tel_none");
				$(".btn_kakao_pc").addClass("tel_none");
				
			}

		} else {

			$("#fixed_btn").addClass("tel_none");
			$(".btn_kakao_pc").addClass("tel_none");
			
		}
	
		clearTimeout(timeCheck.interval);
		timeCheck.interval = setTimeout(function(){ timeCheck(); },1000);

	}

		//탑버튼 스크롤시 노출
		function btnShow(){
			$(window).scroll(function(){
				if($(window).scrollTop() > 20){
					$(".counsel-top-btn").show();
				}else{
					$(".counsel-top-btn").hide();
				}
			});
		}
	//메인에 탑버튼 노출 & 타페이지에 태블릿, 모바일에만 노출
	$(document).ready(function(){
		

		//탑버튼 동작 애니메이션
		$(".counsel-top-btn").on("click", function() {
			$("html, body").animate({scrollTop:0}, '500');
			return false;		
		});
	});
</script>