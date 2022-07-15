<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub com__reservation">
			<h2 class="sub_title">온라인 예약</h2>
			<div class="wsize pt100 pb200"> 
				<div class="wsize03 reser_wrap">
					<div class="reser_info">
						<ul class="list_box">
							<li>
								정확한 검사를 위해 내원일 포함 렌즈 미착용 기간 필요합니다.
								<ul class="period_list">
									<li><span class="left">― 소프트렌즈 7일</span> <span class="right">― 하드렌즈(RGP)  14일</span></li>
									<li><span class="left">― 난시용 소프트렌즈  14일</span> <span class="right">― 드림렌즈 1개월</span></li>
								</ul>
							</li>
							<li>검사 당일 약물 검사로 인해 근거리 시력이 불편해지며 눈부심 때문에 자가 운전이 불가합니다.</li>
							<li>검사는 2-3시간정도 소요됩니다.</li>
						</ul>
					</div>
					<div class="check_box ta_c mt25">
						<input type="checkbox" id="confirm">
						<label for="confirm">확인</label>
					</div>
					<div class="mt90 pl15_pr15 clinic__desc">
						<p class="sub_title05">진료 구분</p>
						<div class="check_box_wrap flex_between">
							<div class="check_box">
								<input type="checkbox" id="chk01" value="RS01" class="test1">
								<label for="chk01">노안 &middot; 백내장</label>
							</div>
							<div class="check_box">
								<input type="checkbox" id="chk02" value="RS02" class="test1">
								<label for="chk02">시력 교정 (라식&middot;라섹)</label>
							</div>
							<div class="check_box">
								<input type="checkbox" id="chk03" value="RS03" class="test1">
								<label for="chk03">드림렌즈</label>
							</div>
							<div class="check_box">
								<input type="checkbox" id="chk04" value="RS04" class="test1">
								<label for="chk04">안 질환</label>
							</div>
							<div class="check_box">
								<input type="checkbox" id="chk05" value="RS05" class="test1">
								<label for="chk05">안 종합 검진 &middot; 아이케어 (IPL)</label>
							</div>
						</div>
					</div>

					<div class="mt90 reser_today_yn pl15_pr15">
						<p class="sub_title05">당일 수술 가능 여부</p>
						<div class="radio_box_wrap flex">
							<div class="radio_box">
								<input type="radio" id="yes" name="answer" value="Y">
								<label for="yes">예</label>
							</div>
							<div class="radio_box">
								<input type="radio" id="no" name="answer" value="N">
								<label for="no">아니요</label>
							</div>
						</div>
					</div>

					<div class="mt90 pl15_pr15 reser__date">
						<p class="sub_title05">예약 날짜 선택</p>
						<div class="flex_between mt45 align-item-start date__container">
							<div class="date_wrap">
								<div id="datepicker" class="datepicker"></div>
								<p class="info fc_orange">※ 예약 신청해주시면 전화드린 후 예약 확정해드리겠습니다.</p>
							</div>
							<div class="time_wrap flex_between">
							<!-- 선택 시 클래스 active 추가 -->
								<div class="time_box time_box_AM">
									
								</div>
								<span>ㅣ</span>
								<div class="time_box time_box_PM">
									
								</div>
							</div>
						</div>
					</div>

					<div class="mt90 pl15_pr15 counsel_detail_box">
						<div class="input_box flex mr95">
							<label for="name">고객 성함</label>
							<input type="text" id="name" placeholder="홍길동">
						</div>
						<div class="input_box flex">
							<label for="birth">생년월일</label>
							<input type="text" maxlength="8" id="birth" placeholder="예) 19820201">
						</div>
						<div class="input_box flex mr95">
							<label for="tel">휴대폰 번호</label>
							<input type="text" id="tel" placeholder="휴대폰 번호를 - 없이 입력해주세요.">
						</div>
					</div>

					
					<div class="mt90 pl15_pr15 reser_add_list">
						<p class="sub_title05">추가 사항 1</p>
						<p class="qst">평소 드시는 약 또는 치료 중인 질환이 있는 경우 기재해주세요. (비타민 , 영양제 등 제외)</p>
						<div class="flex align-item-start mt30 radio__box__container">
							<div class="radio_box_wrap flex align-item-start">
								<div class="radio_box mr75">
									<input type="radio" id="no02" name="answer02" value="N">
									<label for="no02">없음</label>
								</div>
								<div class="radio_box">
									<input type="radio" id="yes02" name="answer02" value="Y">
									<label for="yes02">있음</label>
								</div>
							</div>
							<div class="input_box02">
								<input type="text" placeholder="약 또는 치료 중인 질환을 기재해주세요." id="etc">
								<ul class="list_box02 mt10">
									<li>복용 중인 약에 따라 소견서가 필요할 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="pl15_pr15 counsel_privacy_box">
						<p class="sub_title05">개인정보 취급방침</p>
						<div class="cont">
							<div class="cont_inr">
								'강남그랜드안과의원'은 (이하 '본원'은) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.<br>
								본원은 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
								본원은 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br><br>

								1. 수집하는 개인정보의 항목 및 수집방법<br>
								본원은 회원가입 시 서비스 이용을 위해 필요한 최소한의 개인정보만을 수집합니다.<br>
								귀하가 본원의 서비스를 이용하기 위해서는 회원가입 시 필수항목과 선택항목이 있는데,
								메일수신여부 등과 같은 선택항목은 입력하지 않더라도 서비스 이용에는 제한이 없습니다.<br><br>

								[진료정보]<br>
								- 수집항목 : 성명, 주민등록번호, 주소, 연락처, 진료기록<br>
								※ 의료법에 의해 고유식별정보 및 진료정보를 의무적으로 보유하여야 함<br>
								(별도 동의 불필요)<br><br>

								[홈페이지 회원가입 시 수집항목]<br>
								- 필수항목 : 성명, 아이디, 비밀번호, 주소, 연락처(전화번호, 휴대폰번호)<br>
								- 선택항목 : 이메일, 메일수신여부<br>
								- 서비스 이용 과정이나 서비스 제공 업무 처리 과정에서 다음과 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. : 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보<br><br>
								[개인정보 수집방법]<br>
								- 다음과 같은 방법으로 개인정보를 수집합니다.<br>
								홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일<br><br>
								2. 개인정보의 수집 및 이용목적<br>
								본원은 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
								이용자가 제공한 모든 정보는 하기 목적에 필요한 용도 이외로는 사용되지 않으며 이용
								목적이 변경될 시에는 사전 동의를 구할 것입니다.<br><br>

								[진료정보]<br>
								- 진단 및 치료를 위한 진료서비스와 청구, 수납 및 환급 등의 원무서비스 제공<br>
								[홈페이지 회원정보]<br>
								- 필수정보 : 홈페이지를 통한 진료 예약, 예약조회 및 회원제 서비스 제공,<br>
								- 선택정보 : 이메일을 통한 병원소식, 질병정보 등의 안내, 설문조사<br>
								[마케팅 및 광고에 활용]<br>
								- 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br>
								3. 개인정보의 보유 및 이용기간<br>
								본원은 개인정보의 수집목적 또는 제공받은 목적이 달성된 때에는 귀하의 개인정보를 지체 없이 파기합니다.<br><br>

								[진료정보]<br>
								- 의료법에 명시된 진료기록 보관 기준에 준하여 보관<br>
								[홈페이지 회원정보]<br>
								- 회원가입을 탈퇴하거나 회원에서 제명된 때<br>
								다만, 수집목적 또는 제공받은 목적이 달성된 경우에도 상법 등 법령의 규정에 의하여
								보존할 필요성이 있는 경우에는 귀하의 개인정보를 보유할 수 있습니다.<br>
								- 선택정보 : 이메일을 통한 병원소식, 질병정보 등의 안내, 설문조사<br>
								- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래 등에서의 소비자보호에 관한 법률)<br>
								- 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)<br>
								- 본인 확인에 관한 기록 : 6개월 (정보통신망 이용촉진 및 정보보호 등에 관한 법률)<br>
								- 방문에 관한 기록 : 3개월 (통신비밀보호법)<br>
							</div>
						</div>
						<div class="check_box">
							<input type="checkbox" id="agreeInfo">
							<label for="agreeInfo">개인정보 수집 및 활용 동의</label>
						</div>
						<ul class="list_box02 mt20">
							<li>2012년 8월 18일부터 개정된 정보통신망법 23조 2항 “주민등록번호 사용제한”에 의해주민등록번호를 저장 및 조회 하지 않습니다.</li>
						</ul>
					</div>
					<a href="javascipt:void(0)" class="btn_apply">예약 신청</a>
				</div>
			</div> 
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript">
	
	var prm = {};
	var val = [];
	prm.board_menu_code = "${menu_code}";
	var click_date;
	
	var date = new Date();
	var year = date.getFullYear();
	var mon = date.getMonth()+1;
	var day = date.getDate();
	
	if( mon < 10 ){
		mon = "0"+mon;
	}
	
	click_date = year+"-"+mon+"-"+day;
	
	prm.board_etc5 = click_date;
	
		$(document).ready(function(){
			reservation_check(click_date);
		});
		

		function reservation_check(click_date){
			
			prm.board_etc5 = click_date;
			
			$.ajax({
				url			: "/community/interface/communityList/${menu_code}"
				,data		: prm
				,type		: "POST"
				,success	: function(data){
					for(var i=0;i<data.rows.length;i++){
						$(".time_box a:contains('"+data.rows[i].board_etc2+"')").html("<span class='time'>"+data.rows[i].board_etc2+"</span>ㅣ 예약 불가");
					}
				}
			});
		}
		
		$(".btn_apply").on('click',function(){
			
			if( $("#confirm").is(":checked") == false ){
				alert("유의 사항을 확인 해주시기 바랍니다.");
				$("#confirm").focus();
				return false;
			}
			
			if( $("input[name='answer']:checked").val() == "undefined" || $("input[name='answer']:checked").val() ==null ){
				alert("당일 수술 가능 여부를 체크하여 주세요.");
				return false;
			}
			
			if( !$("#agreeInfo").is(":checked") ){
				alert("개인정보 수집 및 활용에 동의하셔야 예약 신청이 가능합니다.");
				return false;
			}
			
			if( $("#name").val() == null || $("#name").val() =='' ){
				alert("성함을 입력해주세요.");
				return false;
			}
			
			if( $("#birth").val() == null || $("#birth").val() =='' ){
				alert("생년월일을 입력해주세요.");
				return false;
			}
			
			if( $("#tel").val() == null || $("#tel").val() =='' ){
				alert("연락처를 입력해주세요.");
				return false;
			}
			
			if( $(".active").text().indexOf("예약 불가") > -1 ){
				alert("선택하신 시간대는 현재 예약이 불가능합니다.");
				return false;
			}
			
			var category_M="";
			
			$("input[class='test1'][type='checkbox']:checked").each(function(i){
				category_M += $(this).val() +",";
			});
			
			prm.board_title = "상담 예약";
			prm.board_useyn = "Y";
			prm.board_show = "Y";
			prm.board_reg_name = $("#name").val();
			prm.birthday = $("#birth").val();
			prm.board_mobile = $("#tel").val();
			prm.board_cate_L = "${category}";
			prm.board_cate_M = category_M;
			prm.board_etc1 = $("input[name='answer']:checked").val();
			prm.board_etc2 = datePickerFormat() + " " + $(".time_box").find(".active .time").text();
			prm.board_etc3 = $("input[name='answer02']:checked").val();
			prm.board_etc4 = $("#etc").val();

			if( prm.board_etc2 ==null || prm.board_etc2 =='' ){
				alert("예약시간을 선택 해주세요.");
				return false;
			}

			try {
				if (typeof sendGoogleAnalyticsEvent !== 'undefined') {
					sendGoogleAnalyticsEvent('conversion', '검사예약');
				}
			} catch (e) {
			}
			
			$.ajax({
				url			: "/community/interface/insertBoard"
				,data		: prm
				,type		: "POST"
				,success	: function(data){
					if( data.resultMsg == "Y" ){
						alert("신청이 완료됐습니다.");
						location.reload();
					}else{
						alert("잠시 후 다시 실행해주시기 바랍니다.");
					}
				}
			})	
		});
		
		function timeBoxClickEvent(){
			$('.time_box li').click(function() {
				$('.time_box li').each(function() { $(this).removeClass('active'); });
				$(this).addClass('active');
			});
		}
		
		// datepicker 달력
		function datePicker(){
			
			$(".ui-datepicker-prev").on('click',function(){
				datePicker();
			});
			
			$(".ui-datepicker-next").on('click',function(){
				datePicker();
			});
			
			$("#datepicker").datepicker({
				monthNames: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],	
				monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],	
				dayNames: ["일", "월", "화", "수", "목", "금", "토"],	
				dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],	
				dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
				yearSuffix: " - ",
				showButtonPanel: true,
				todayHighlight : true,
				minDate : 1,
				beforeShowDay: function(date){
					var day = date.getDay();
					return [day != 3];
				}
			});
			
			$("#datepicker td").each(function(){
				$(this).on('click',function(){
					
					datePicker();
					
					prm.board_etc5 = datePickerFormat();
					
					$.ajax({
						url			: "/community/interface/communityList/BD05"
						,data		: prm
						,type		: "POST"
						,success	: function(data){
							
							$(".time_box_AM").html("");
							$(".time_box_PM").html("");
							
							$("#time_box_AM_tmpl").tmpl().appendTo(".time_box_AM");
							$("#time_box_PM_tmpl").tmpl().appendTo(".time_box_PM");
							
							timeBoxClickEvent();
							
							if( data.count > 0 ){
								//reservation_check(data.rows[0].board_reg_date);
								
								for(var i=0;i<data.rows.length;i++){
									$(".time_box a:contains('"+data.rows[i].board_etc2+"')").html("<span class='time'>"+data.rows[i].board_etc2+"</span>ㅣ 예약 불가");
								}
							}
							
						}
					
					});
					
				});
			});
		}
		
		$(document).ready(function(){
			datePicker();
			$("#no02").attr("checked",true);
			$("#time_box_AM_tmpl").tmpl().appendTo(".time_box_AM");
			$("#time_box_PM_tmpl").tmpl().appendTo(".time_box_PM");
			
			timeBoxClickEvent();
			
			$(".ui-datepicker-prev").on('click',function(){
				datePicker();
			});
			
			$(".ui-datepicker-next").on('click',function(){
				datePicker();
			});
			
		});
		
		function datePickerFormat() {
			var month = $(".ui-datepicker-month").text();
			if (month < 10) {
				month = "0" + month;
			}
			return $(".ui-datepicker-year").text() + "-" + month + "-" + $(".ui-state-active").text();
		}
		
		
	</script>
	
	<script type="text/x-jquery-tmpl"  id="time_box_AM_tmpl">
		<p>오전</p>
		<ul>
			<li>
				<a href="javascript:void(0)">
					<span class="time">10 : 00</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">10 : 30</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">11 : 00</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">11 : 30</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">12 : 00</span>ㅣ 예약 가능
				</a>
			</li>
		</ul>
	</script>
	
	<script type="text/x-jquery-tmpl"  id="time_box_PM_tmpl">
		<p>오후</p>
		<ul>
			<li>
				<a href="javascript:void(0)">
					<span class="time">2 : 00</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">2 : 30</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">3 : 00</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">3 : 30</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">4 : 00</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">4 : 30</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">5 : 00</span>ㅣ 예약 가능
				</a>
			</li>
			<li>
				<a href="javascript:void(0)">
					<span class="time">5 : 30</span>ㅣ 예약 가능
				</a>
			</li>
		</ul>
	</script>
	
</body>
</html>
