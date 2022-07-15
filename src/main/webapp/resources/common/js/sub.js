$(document).ready(function() {

	/*========== 강남그랜드안과 - 의료진 소개 ==========*/
	// 이관훈 탭 메뉴
	$(".lgh_box .tab").hide();
	$(".lgh_box .tab:first").show();

	$(".lgh_box .tab_menu li").click(function () {
	$(".lgh_box .tab_menu li").removeClass("active");

		$(this).addClass("active");
		$(".lgh_box .tab").hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn();
	});

	// 이영섭 탭 메뉴
	$(".lys_box .tab").hide();
	$(".lys_box .tab:first").show();

	$(".lys_box .tab_menu li").click(function () {
	$(".lys_box .tab_menu li").removeClass("active");

		$(this).addClass("active");
		$(".lys_box .tab").hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn();
	});

	// 이정진 탭 메뉴
	$(".ljj_box .tab").hide();
	$(".ljj_box .tab:first").show();

	$(".ljj_box .tab_menu li").click(function () {
	$(".ljj_box .tab_menu li").removeClass("active");

		$(this).addClass("active");
		$(".ljj_box .tab").hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn();
	});

	// 인증패 및 수상 내역
	var doctor_swiper = new Swiper(".doctor_swiper .swiper-container", {
		speed: 500,
		slidesPerView: 3,
		navigation: {
			nextEl: ".doctor_swiper .swiper-button-next",
			prevEl: ".doctor_swiper .swiper-button-prev",
		},
		pagination:{
			el:'.doctor_swiper .swiper-pagination'
		},
		breakpoints: {
			991:{
				slidesPerView: 5,
			}
		}
	});
	
	var cookieData = document.cookie;

	if (cookieData.indexOf("close=Y") > 0) {
		$(".top_banner").hide();
	} else {
		$(".top_banner").show();
	}

	$(".btn_banner_close").on('click', function() {
		bannerClose();
	});
	
	
	
	    

	/*========== 강남그랜드안과 - 장비 소개 ==========*/
	$('.equip_swiper').each(function(idx, el){
		let slideLen = $(this).find('.swiper-slide').length;
		if(slideLen <= 3){
			$(this).find('.swiper-button-next').hide();
			$(this).find('.swiper-button-prev').hide();
		}else{
			$(this).find('.swiper-button-next').show();
			$(this).find('.swiper-button-prev').show();
		}

		var equip_swiper = new Swiper(".equip_swiper0"+ idx + " .swiper-container", {
			speed: 500,
			slidesPerView: 2,
			spaceBetween: 13,
			navigation: {
				nextEl: ".equip_swiper0"+idx +" .swiper-button-next",
				prevEl: ".equip_swiper0"+idx+" .swiper-button-prev",
			},
			breakpoints: {
				991:{
					slidesPerView: 3,
					spaceBetween: 100,
				}
			},
			pagination:{
				el:'.equip_swiper0'+idx +' .swiper-pagination'
			},
		});
	})
	
	var eyecare_slide01 = new Swiper(".eyecare_slide01 .swiper-container", {
		speed: 500,
		slidesPerView: 2,
		spaceBetween: 13,
		navigation: {
			nextEl: ".eyecare_slide01 .swiper-button-next",
			prevEl: ".eyecare_slide01 .swiper-button-prev",
		},
		breakpoints: {
			991:{
				slidesPerView: 3,
				spaceBetween: 100,
			}
		},
		pagination:{
			el:'.eyecare_slide01 .swiper-pagination'
		},
	});

	var eyecare_slide02 = new Swiper(".eyecare_slide02 .swiper-container", {
		speed: 500,
		slidesPerView: 2,
		spaceBetween: 13,
		navigation: {
			nextEl: ".eyecare_slide02 .swiper-button-next",
			prevEl: ".eyecare_slide02 .swiper-button-prev",
		},
		breakpoints: {
			991:{
				slidesPerView: 3,
				spaceBetween: 100,
			}
		},
		pagination:{
			el:'.eyecare_slide02 .swiper-pagination'
		},
	});

	var eyecare_slide03 = new Swiper(".eyecare_slide03 .swiper-container", {
		speed: 500,
		slidesPerView: 2,
		spaceBetween: 13,
		navigation: {
			nextEl: ".eyecare_slide03 .swiper-button-next",
			prevEl: ".eyecare_slide03 .swiper-button-prev",
		},
		breakpoints: {
			991:{
				slidesPerView: 3,
				spaceBetween: 100,
			}
		},
		pagination:{
			el:'.eyecare_slide03 .swiper-pagination'
		},
	});

	var eyecare_slide04 = new Swiper(".eyecare_slide04 .swiper-container", {
		speed: 500,
		slidesPerView: 2,
		spaceBetween: 13,
		navigation: {
			nextEl: ".eyecare_slide04 .swiper-button-next",
			prevEl: ".eyecare_slide04 .swiper-button-prev",
		},
		breakpoints: {
			991:{
				slidesPerView: 3,
				spaceBetween: 100,
			}
		},
		pagination:{
			el:'.eyecare_slide04 .swiper-pagination'
		},
	});

	// 탭 메뉴
	$(".equip_wrap .tab").hide();
	$(".equip_wrap .tab:first").show();

	$(".equip_wrap .sub_tab_menu li").click(function () {
	$(".equip_wrap .sub_tab_menu li").removeClass("active");

		$(this).addClass("active");
		$(".equip_wrap .tab").hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn();

	});


	/*========== 강남그랜드안과 - 제안 제휴 ==========*/
	// 탭 메뉴
	$(".partner_wrap .tab").hide();
	$(".partner_wrap .tab:first").show();

	$(".partner_wrap .sub_tab_menu li").click(function () {
	$(".partner_wrap .sub_tab_menu li").removeClass("active");

		$(this).addClass("active");
		$(".partner_wrap .tab").hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn();
		
		$(".tab_contents").html("");
		$("#" + activeTab+"_tmpl").tmpl().appendTo(".tab_contents");
		
		// select
		$(".select").on("click", function () {
			$(".select_ul").toggle();
		})
		// 셀렉트 박스 옵션 선택
		$(".select_ul li").on("click", function () {
			var text = $(this).text();
			$(".input-email2").val(text);
			$(".select").html(text);
			$(".select_ul").toggle();
		})
		//셀렉트 박스 이외 선택시 보이지 않게 하기
		$("body").on("click", function(e){
			if($(".select_ul").css("display") == "block"){
				if($(".select_box").has(e.target).length == 0){
					$(".select_ul").hide()
				}
			}
		})
		
		var title = $(".sub_tab_menu").find(".active").text();
		applyAPI("btn_apply", "agree", title, "BD08");
	});

	// select
	$(".select").on("click", function () {
		$(".select_ul").toggle();
	})
	// 셀렉트 박스 옵션 선택
	$(".select_ul li").on("click", function () {
		var text = $(this).text();
		$(".input-email2").val(text);
		$(".select").html(text);
		$(".select_ul").toggle();
	})
	//셀렉트 박스 이외 선택시 보이지 않게 하기
	$("body").on("click", function(e){
		if($(".select_ul").css("display") == "block"){
			if($(".select_box").has(e.target).length == 0){
				$(".select_ul").hide()
			}
		}
	})

	/*========== 노안 백내장 - 클리닉 ==========*/
	let cata_swiper = new Swiper(".cata_swiper .swiper-container", {
		speed: 500,		   
        slidesPerView: 1,
        spaceBetween: 0,
		allowTouchMove:false,
		centeredSlides: true,
		navigation: {
			nextEl: ".cata_swiper .swiper-button-next",
			prevEl: ".cata_swiper .swiper-button-prev",
		},
		breakpoints: {
          991: {
				slidesPerColumn: 1,
				slidesPerView: 3,
				spaceBetween: 30,
				centeredSlides: false,
				allowTouchMove:true,
          },
        },
	});

	// 탭 메뉴
	$(".pres_wrap .tab").hide();
	$(".pres_wrap .tab:first").show();

	$(".pres_wrap .sub_tab_menu li").click(function () {
	$(".pres_wrap .sub_tab_menu li").removeClass("active");

		$(this).addClass("active");
		$(".pres_wrap .tab").hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn();
	});


	/*========== 커뮤니티 - 자주묻는질문 ==========*/
	// 탭 메뉴
	$(".qna_wrap .tab").hide();
	$(".qna_wrap .tab:first").show();

	$(".qna_wrap .sub_tab_menu li").click(function () {
	$(".qna_wrap .sub_tab_menu li").removeClass("active");

		$(this).addClass("active");
		$(".qna_wrap .tab").hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn();
	});

	// 아코디언 메뉴
	$(".q_box").on("click", function(){
		$(this).next(".n_box").slideToggle();
		$(this).toggleClass("active");
	});


	//프리미엄 노안백내장, 시력교정 클리닉 드림렌즈 탭
	$('.tab-rec li a').on('click', function(e){
		e.preventDefault();
		var tabCont = $(this).attr('href');
		$('.tab-rec li a').removeClass('active');
		$(this).addClass('active');
		$('.tab').css('display','none');
		$(tabCont).css('display','block');

		eyecare_slide01.update();		
		eyecare_slide02.update();
		eyecare_slide03.update();
		eyecare_slide04.update();
	});

	//프리미엄 노안백내장 장비 애니메이션
	var circleTimer = null;
	var circleInterval = function() {
		var circle = $('.time-list');
		var i = 0;
		circleTimer = setInterval(function (){
			i++;
			circle.find('.on').next().addClass('on').siblings('.on').removeClass('on');

			if(i === 3) {
				i = 0;
				circle.find('li').removeClass('on');
				circle.find('li:eq(0)').addClass('on');
			}
		}, 2500);
	}
	circleInterval();
	autoDrag();

	if($(".drag_frame_box").length > 0 ){
		dragEvent();
	}

});

//eventDb
function eventDb(){
	//eventDb checkUpList
	$(".checkup_list_title").on("click", function () {
		$(".checkup_list_ul").toggle();
	});
	// 셀렉트 박스 옵션 선택
	$(".checkup_list_ul li").on("click", function () {
		var text = $(this).html();
		var opt = $(this).attr("opt");
		$(".checkup_list_title").html(text);
		$(".checkup_list_title").attr("opt",opt);
		$(".checkup_list_ul").toggle();
	});
	//셀렉트 박스 이외 선택시 보이지 않게 하기
	$("body").on("click", function(e){
		if($(".checkup_list_ul").css("display") == "block"){
			if($(".checkup_list").has(e.target).length == 0){
				$(".checkup_list_ul").hide()
			}
		}
	});
	
	//eventDb phone_num

	$(".phone_num_title").on("click", function () {
		$(".phone_num_ul").toggle();
	});
	// 셀렉트 박스 옵션 선택
	$(".phone_num_ul li").on("click", function () {
		var text = $(this).html();
		$(".phone_num_title").html(text);
		$(".phone_num_ul").toggle();
	});
	//셀렉트 박스 이외 선택시 보이지 않게 하기
	$("body").on("click", function(e){
		if($(".phone_num_ul").css("display") == "block"){
			if($(".phone_num_list").has(e.target).length == 0){
				$(".phone_num_ul").hide()
			}
		}
	});
}

/*========== 망막 녹내장, 시력교정 드림렌즈 - 이미지 드래그 모션   ==========*/
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
         var barWidth = $(this).parent().innerWidth();
         var trans = ui.position.left/barWidth;
         $(".img.drag").css("opacity", trans)
      }
   });

   var chk = true;

   $(window).on("load resize", function() {
      var cw = $(window).innerWidth();
      if( cw < 991 && chk ) {
         chk = false;
         $(".drag_box .drag_control .bar").css({"width":"488px"});
         setTimeout(function(){
            $(".btn_drag").css({"left":parseInt($(".btn_drag").css("left")) - 100+"px"});            
         }, 700)
      }

      if( cw < 751 ) {
         $(".drag_box .drag_control .bar").css({"width":"50%"});
         setTimeout(function(){
            $(".btn_drag").css({"left":$(".drag_box .drag_control .bar").outerWidth() - $(".btn_drag").outerWidth()+"px"});      
         }, 700)

      }
   });

}

window.addEventListener('resize', function(event) {
	resizePopup();
}, true);

function resizePopup(){
	if( $('html').width() > 991 ){

		$(".popup_slide").each(function(){
			$(this).css({"background-image":"url("+$(this).attr('pcImg')+")","background-size":"cover"});
		})
	}else{
		$(".popup_slide").each(function(){
			$(this).css({"background-image":"url("+$(this).attr('moImg')+")","background-size":"cover"});
		})
	}
};

//메인 배너 오늘 하루 보지 않기 쿠키 GET
function getCookie(obj) {
	var name = obj + "=";
	var ca = document.cookie.split(';');

	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ')
			c = c.substring(1);
		if (c.indexOf(name) != -1)
			return c.substring(name.length, c.length);
	}
	return "";
}

//메인 배너 오늘 하루 보지 않기 쿠키 SET
function setCookie(ename, cvalue, exdays) {
	var today = new Date();
	today.setTime(today.getTime() + (exdays * 12 * 60 * 60 * 1000));
	var expires = "expires" + today.toUTCString();

	document.cookie = ename + "=" + cvalue + "; " + expires;
}

function bannerClose() {
	setCookie("close", "Y", 1);
}

function autoDrag() {
   var time = 1500;
   $('.img.drag').stop().animate({opacity : 1}, {
      duration: time,
      complete: function (){
         //$(this).stop().animate({opacity : 0},{duration: time}, "linear");
      }
   },"linear");
   
   setTimeout(function(){
      var barW = $(".drag_control .bar").innerWidth();
      var moveDrag = barW - 48;
      $('.btn_drag.ui-draggable').stop().animate({left:moveDrag}, {
         duration: time,
         complete: function (){
            //$(this).stop().animate({left:0},{duration: time},"linear");
         }
      },"linear").addClass("auto");
   },1500)


   
     
   const winW = $(window).innerWidth();
   $(window).on("load resize", function() {
      const barW = $(".drag_control .bar").innerWidth();
      var moveDrag = barW - 48;
      $('.btn_drag.ui-draggable').stop().animate({left:moveDrag}, {
         duration: time,
         complete: function (){
            //$(this).stop().animate({left:0},{duration: time},"linear");
         }
      },"linear").addClass("auto");
   })
}            