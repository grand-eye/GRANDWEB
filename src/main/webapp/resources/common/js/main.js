$(document).ready(function() {
	// 퀵메뉴
	$(".btn_top").on("click", function(e){
		$("html, body").animate({ scrollTop: 0 }, 500);
		return false;
	})

	$(window).on('resize', function () {
		let winW = $(window).width();	
		if(winW <= 1236){
			$(".btn_quick").show();
			$(".quick_box").hide();
			
			$(".top_btn").show();
		}else{
			$(".btn_quick").hide();
			$(".quick_box").show();
			
			$(".top_btn").hide();
		}
	})
	// 탑 배너 닫기
	$(".btn_banner_close").on("click", function() {
		$(".top_banner").hide();
	});

	// 탑 배너 닫기
	$(".btn_banner_close").on("click", function() {
		$(".top_banner").hide();
	});
	
	// 비주얼 슬라이드
	/*var visual_swiper = new Swiper('.visual_swiper .swiper-container', {
		speed: 700,
		navigation: {
			nextEl: '.visual_swiper .swiper-button-next',
			prevEl: '.visual_swiper .swiper-button-prev',
		},
	});*/
	
	//모바일 메뉴 오픈
	$('.mo_menu_btn').on('click', function(){
		$('.mo_gnb_wrap').toggle();
		$('body').toggleClass('lock');
		$('.mo_menu_btn').toggleClass('active');
	});
	//모바일 메뉴 2depth 활성화
	$('.mo_gnb .gnb_list > li').on('click', function(){
		$('.mo_gnb .gnb_list > li').removeClass('active');
		$(this).addClass('active');
	});
	//배너 닫기
	$('.btn_banner_close_mo').on('click', function(){
		$('.top_banner').toggle();
		$('.mo_menu').addClass('banner_closed');
	});
	

	// 롤링 배너 - 공지사항 -> index.jsp 에서 사용 중
	/*var rolling_swiper01 = new Swiper('.notice_swiper .swiper-container', {
		direction: 'vertical',
		loop:true,
		speed:500,
		touchRatio: 0,
		autoplay: {
			delay: 2000,
			disableOnInteraction: false,
		},
	});*/

	// 롤링 배너 - 미디어  -> index.jsp 에서 사용 중
	/*var rolling_swiper02 = new Swiper('.media_swiper .swiper-container', {
		direction: 'vertical',
		loop:true,
		speed:500,
		touchRatio: 0,
		autoplay: {
			delay: 2000,
			disableOnInteraction: false,
		},
	});*/

	// 특별한 이벤트  -> index.jsp 에서 사용 중
	/*var event_swiper = new Swiper('.event_swiper .swiper-container', {
		speed: 700,
		slidesPerView: 3,
		spaceBetween: 28,
		navigation: {
			nextEl: '.event_swiper .swiper-button-next',
			prevEl: '.event_swiper .swiper-button-prev',
		},
	});*/

	// 강남그랜드안과의 특별함
	var special_swiper = new Swiper('.special_swiper .swiper-container', {
		centeredSlides: true,
		speed: 700,
		slidesPerView: 1.4,
		spaceBetween: 22,
		loop: true,
		navigation: {
			nextEl: '.special_swiper .swiper-button-next',
			prevEl: '.special_swiper .swiper-button-prev',
		},
		breakpoints: {
			1200:{
				slidesPerView: '1',

			},
			991:{
				slidesPerView: 'auto',
				loop: false,
				spaceBetween: 70,
			}
		}
	});
	
	$(window).resize(function(){
		special_swiper.update();
	})
	
	special_swiper.on('slideChange', function () {

	});

	/*var special_swiper = new Swiper('.special_swiper .swiper-container', {
		centeredSlides: true,
		speed: 700,
		slidesPerView: 'auto',
		navigation: {
			nextEl: '.special_swiper .swiper-button-next',
			prevEl: '.special_swiper .swiper-button-prev',
		},
	});
	
	special_swiper.on('slideChange', function () {
		var swiperIdx = this.realIndex;
		console.log(swiperIdx);
		var target = $('.special_swiper').eq(swiperIdx).children('.special_txt');
		console.log("target="+target);
		var sec_title = target.children('.sec_title').text();
		console.log("sec_title="+sec_title);
		$('.special_txt.rel').children('.sec_title').text(sec_title);
	});*/

	// 고객체험기  -> index.jsp 에서 사용 중
	/*var review_swiper = new Swiper('.review_swiper .swiper-container', {
		speed: 700,
		slidesPerView: 3,
		spaceBetween: 28,
		navigation: {
			nextEl: '.review_swiper .swiper-button-next',
			prevEl: '.review_swiper .swiper-button-prev',
		},
	});*/
});

function rollingSwiper(swiper_prm,swiper_class){
	var swiper_prm = new Swiper(swiper_class+' .swiper-container', {
		direction: 'vertical',
		loop:true,
		speed:700,
		touchRatio: 0,
		autoplay: {
			delay: 2000,
			disableOnInteraction: false,
		},
	});
};

function bannerSwiper(swiper_prm,swiper_class){
	var swiper_prm = new Swiper(swiper_class+" .swiper-container", {
		speed: 700,
		slidesPerView: 1.5,
		spaceBetween: 14,
		navigation: {
			nextEl: swiper_class + ' .swiper-button-next',
			prevEl: swiper_class + ' .swiper-button-prev',
			
		},
		breakpoints: {
		   750:{
	          slidesPerView: 2,
	          spaceBetween: 28
	       },
	       991:{
	          slidesPerView: 2.5,
	          spaceBetween: 28
	       },
		   1021:{
	          slidesPerView: 3,
	          spaceBetween: 28
	       }
	    }
	});
};

function bannerSwiper1(swiper_prm,swiper_class){
	var swiper_prm = new Swiper(swiper_class+" .swiper-container", {
		speed: 700,
		slidesPerView: 2,
		spaceBetween: 14,
		navigation: {
			nextEl: swiper_class + ' .swiper-button-next',
			prevEl: swiper_class + ' .swiper-button-prev',
			
		},
		breakpoints: {
		   750:{
	          slidesPerView: 2,
	          spaceBetween: 28
	       },
	       991:{
	          slidesPerView: 2.5,
	          spaceBetween: 28
	       },
		   1021:{
	          slidesPerView: 3,
	          spaceBetween: 28
	       }
	    }
	});
};

function mainBannerSwiper(swiper_prm,swiper_class){
	var swiper_prm = new Swiper(swiper_class+" .swiper-container", {
		speed: 700,
		navigation: {
			nextEl: swiper_class + ' .swiper-button-next',
			prevEl: swiper_class + ' .swiper-button-prev',			
		},
		autoplay: {
			delay: 5000,
			disableOnInteraction: false,
		},
	});
};

function bannerSwiper_new(swiper_prm,swiper_class){
	var swiper_prm = new Swiper(swiper_class+" .swiper-container", {
	    speed: 700,
	    slidesPerView: 'auto',
	    spaceBetween: 12,
	    navigation: {
	    	nextEl: swiper_class + ' .swiper-button-next',
			prevEl: swiper_class + ' .swiper-button-prev',
	    },
	    breakpoints: {
	       991:{
	          slidesPerView: 3,
	          spaceBetween: 28
	       }
	    }
	 });
}

function popupSwiper(swiper_prm,swiper_class){

	var swiper_prm = new Swiper(swiper_class+" .swiper-container", {
		slidesPerView: 1,
		speed: 700,
	    slidesPerView: 'auto',
	    spaceBetween: 12,
	    autoplay: {
			delay: 5000,
			disableOnInteraction: false,
		},
		navigation: {
			nextEl: swiper_class + ' .swiper-button-next',
			prevEl: swiper_class + ' .swiper-button-prev',
		},
		pagination:{
			el: swiper_class +' .swiper-pagination'
		},
		on : {
			init: function () {
				var opt = $('.banner_swiper .swiper-container .swiper-slide').eq(this.activeIndex).data("opt");
	
				if( opt == "w" ) {
					$(".banner_swiper").removeClass("bl_type");
				} else {
					$(".banner_swiper").addClass("bl_type");
				}
			}
			,
			slideChange : function() {
				var opt = $('.banner_swiper .swiper-container .swiper-slide').eq(this.activeIndex).data("opt");
	
				if( opt == "w" ) {
					$(".banner_swiper").removeClass("bl_type");
				} else {
					$(".banner_swiper").addClass("bl_type");
				}
			}
		}
	});
}


function applyAPI(apply_button_name, agree_button_name, title, menu_code){
	$("."+apply_button_name).on('click',function(){

		if( $("#"+agree_button_name).is(":checked") == false && agree_button_name !=null){
			alert("개인정보 수집 사용에 동의 해주시기 바랍니다.");
			return false;
		}
		
		this.category = $(".checkup_list_title").attr("opt");
		
		this.prm = {};
		
		this.prm.board_reg_name = $("#name").val();
		this.prm.board_email = $("#email").val();
		this.prm.board_mobile = $("#phone").val();
		this.prm.board_title = title;
		this.prm.board_cate_L = "";
		this.prm.board_useyn = "Y";
		this.prm.board_show = "Y";
		this.prm.board_menu_code = menu_code;
		this.prm.board_detail = $("#cont").val();
		
		
		if( menu_code == "BD11" ){
			this.prm.board_cate_L = $("select option:selected").attr("val");
		}
		
		
		//상담 문의 - 나이
		if( menu_code == 'BD04'){
			this.prm.board_etc1 = $("#age").val();
		}
		
		//제안 제휴 - 회사명
		if( menu_code == 'BD08' ){
			this.prm.board_etc2 = $("#company").val();
		}
		
		//검사 신청
		var regExp = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
		var hangle =   /^[가-힣]+$/;
		var numValid = /[0-9]/;
		
		if(menu_code == "BD11"){
			var numLimit = $(".counsel_box").find("#phone").val().length;
			
			if( $(".checkup_list_title option:selected").attr("val") == ''){
				alert("검사 항목을 선택 해주시기 바랍니다.");
				return false;
			}
			
			if( $(".counsel_box").find("#name").val() == "" || $(".counsel_box").find("#name").val() ==null ){
				alert("성함을 입력 해주시기 바랍니다.");
				return false;
			}
			
			if( $(".counsel_box").find("#age").val() == "" || $(".counsel_box").find("#age").val() ==null ){
				alert("나이를 입력 해주시기 바랍니다.");
				return false;
			}
			
			// numValid변수로 체크하면 - 가 들어가져서 숫자만 입력하는 로직을 이걸로 바꿈
			if( $(".counsel_box").find("#phone").val() == "" || $(".counsel_box").find("#phone").val() ==null ){
				alert("연락처는 숫자만 입력 가능합니다.");
				return false;	
			}
			
		    if( !hangle.test( $(".counsel_box").find("#name").val() )) {
				alert("한글만 입력 해주시기 바랍니다.");
				return false;
			}
			
			if( numLimit < 10 ){
				alert("제대로 된 핸드폰 번호를 입력 해주세요");
				return false;
			}
	
			if( !regExp.test($(".counsel_box").find("#phone").val())){
				alert("제대로 된 핸드폰 번호를 입력 해주세요");
				return false;
			}
			
		}else if(menu_code == 'BD08'){	//제안 제휴 신청 값 체크
			var selectText = $(".select_box .select").html();
			
			//제휴 제안 만 
			if(typeof selectText != "undefined"){
				if( selectText == '제휴 및 제안을 선택하세요.'){
					alert("제휴 및 제안을 선택 해주시기 바랍니다.");
					return false;
				}
			}
			
			if( $(".input_box #name").val() == "" || $(".input_box #name").val() ==null ){
				console.log($(".input_box #name").val());
				alert("성함을 입력 해주시기 바랍니다.");
				return false;
			}
			
			if( !hangle.test( $(".input_box #name").val() )) {
				alert("성함은 한글만 입력 해주시기 바랍니다.");
				return false;
			}
			
			if( $(".input_box #company").val() == "" || $(".input_box #company").val() ==null ){
				alert("회사명을 입력 해주시기 바랍니다.");
				return false;
			}
			
			if( $(".input_box #phone").val() == "" || $(".input_box #name").val() ==null ){
				alert("연락처를 입력 해주시기 바랍니다.");
				return false;
				
			}else if( !numValid.test( $(".input_box #phone").val() ) ){
				alert("연락처는 숫자만 입력 가능합니다.");
				return false;
			}
			
			if( $(".input_box #email").val() == "" || $(".input_box #email").val() ==null ){
				alert("이메일을 입력 해주시기 바랍니다.");
				return false;
			}
			
			if( $(".input_box #cont").val() == "" || $(".input_box #cont").val() ==null ){
				alert("문의내용을 입력 해주시기 바랍니다.");
				return false;
			}
			
		}else{		
			if( $(".checkup_list_title").attr("opt") == ''){
				alert("검사 항목을 선택 해주시기 바랍니다.");
				return false;
			}
			
			if( $(".name_box input").val() == "" || $(".name_box input").val() ==null ){
				alert("성함을 입력 해주시기 바랍니다.");
				return false;
			}
			
			if( !hangle.test( $(".name_box input").val() )) {
				alert("한글만 입력 해주시기 바랍니다.");
				return false;
			}
			
			if( $(".years_box input").val() == "" || $(".years_box input").val() ==null ){
				alert("나이를 입력 해주시기 바랍니다.");
				return false;
			}
			
			if( $(".num_box input").val() == "" || $(".num_box input").val() ==null ){
				alert("연락처를 입력 해주시기 바랍니다.");
				return false;
				
			}else if( !numValid.test( $(".num_box input").val() ) ){
				alert("연락처는 숫자만 입력 가능합니다.");
				return false;
			}
		}

		if( menu_code == "BD11" ){
			this.prm.board_etc1 = $(".counsel_box").find("#age").val();
			this.prm.board_cate_L = $("select option:selected").attr("val");
			this.prm.board_reg_name = $(".counsel_box").find("#name").val();
			this.prm.board_mobile = $(".counsel_box").find("#phone").val().replace(/[^0-9]/g, "");
			
		}else if( menu_code == 'BD08'){
			this.prm.board_reg_name = $(".input_box #name").val();
			this.prm.board_mobile = $(".input_box #phone").val().replace(/[^0-9]/g, ""); 
			var cateText = $(".select_box .select").html();
			
			if(cateText == '기업 제휴'){
				cateText = 'JJ01';
			}else if(cateText == '프로모션 제안'){
				cateText = 'JJ02';
			}else if(cateText == '광고 · 마케팅 제안'){
				cateText = 'JJ03';
			}
			
			if(typeof cateText != "undefined"){
				this.prm.board_cate_L = cateText;
			}

		}else{
			this.prm.board_etc1 = $(".years_box input").val();
			this.prm.board_reg_name = $(".name_box input").val();
			this.prm.board_mobile = $(".phone_num_title").text() + $(".num_box input").val();
			this.prm.board_cate_L = this.category;
		}
		
		$.ajax({
			url			: "/community/interface/insertBoard"
			,data		: this.prm
			,type		: "POST"
			,dataType	: "json"
			,success	: function(data){
				
				if( data.resultMsg == 'Y' ){
					alert('신청이 완료됐습니다.');
					location.reload();
				}else{
					alert('에러가 발생했습니다. 관리자에게 문의해주시기 바랍니다.');
				}
			}
		});
	});
}


