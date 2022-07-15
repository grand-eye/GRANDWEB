$(function(){
	
	var filter = "win16|win32|win64|macintel|mac|"; // PC일 경우 가능한 값
	if( navigator.platform)	{
		if( filter.indexOf(navigator.platform.toLowerCase())<0 ) {	
			$("body").addClass('mobile');
			$("body").removeClass('pc');
		} else {	
			$("body").addClass('pc');
			$("body").removeClass('mobile');
		}
	}

	
	AOS.init({
		duration: 800,
	});

	function onElementHeightChange(elm, callback) {
    var lastHeight = elm.clientHeight
    var newHeight;
    
    (function run() {
        newHeight = elm.clientHeight;      
        if (lastHeight !== newHeight) callback();
        lastHeight = newHeight;

        if (elm.onElementHeightChangeTimer) {
          clearTimeout(elm.onElementHeightChangeTimer); 
        }

        elm.onElementHeightChangeTimer = setTimeout(run, 200);
    })();
  }
  onElementHeightChange(document.body, function(){
		AOS.refresh();
  });
  setTimeout(aosReset,300);
  function aosReset(){
	AOS.refresh();
  }
	
	if($('#attach1').length>0){
		$('#attach1').MultiFile({
			max: 10,
			max_size: 1000,	
			accept: 'gif|jpg|png|jpeg',
			list: '#upload_name_p'
		});
	}

	$(window).on('scroll', function() {
		scrollFn();
	});

	function scrollFn(){				
		scrollTop = $(document).scrollTop();
		
		var d = $('#mobile_header').css('display');
		var ty = 70;
		if(d=='block'){
			ty = 48;
		}
		if (scrollTop > ty) {
			$('#sub_top').addClass('fixed_top');
		} else {
			$('#sub_top').removeClass('fixed_top');
		}
	}
	scrollFn();
	
	$(window).on('resize', function() {
		$('#sub_top').removeClass('on');
	});

	$('#sub_top .btn_search').on('click',function(e){
		e.preventDefault();
		$('#sub_top .top_board_search').addClass('open');
	});
	$('#sub_top .btn_search_close').on('click',function(e){
		e.preventDefault();
		//$('#sub_top .top_board_search').removeClass('open');
		$("input[name='sKeyword']").val("");
	});
	

	/* pc */
	$('#pc_header .gnb .top a, .gnb_total').on('mouseenter focus', function() {		
		$('#pc_header').addClass('open');
	});
	$('#pc_header .gnb, .gnb_total').on('mouseleave',function(e){
		$('#pc_header').removeClass('open');		
	});
	$('#pc_header .btn_mem').on('click',function(e){
		e.preventDefault();
		$('#pc_header .mem_list').toggleClass('on');
	});


	$('#pc_header .btn_search').on('click',function(e){
		e.preventDefault();
		$('#search_layer').css('display','block');
		setTimeout(function () {
		  $('#search_layer').addClass('open');
		}, 20);
	});
	$('#search_layer .btn_close').on('click',function(e){
		e.preventDefault();
		$('#search_layer').removeClass('open');
		$('#search_layer').one('transitionend', function(e) {
		  $('#search_layer').css('display','none');
		});
	});
	

	/* mobile */
	$('#mobile_header .btn_mem').on('click',function(e){
		e.preventDefault();
		$('#mobile_header .mem_list').toggleClass('open');
	});
	$('#mobile_header .btn_menu').on('click',function(e){
		e.preventDefault();
		$('#mobile_header').toggleClass('open');
		$('#mobile_menu .gnb_list > li').removeClass('on');
		$('#mobile_menu').removeClass('scroll');
	});
	
	$("#mobile_menu .btn_search").on('click',function(e){
		$('#mobile_header').addClass('search_open');
	});
	$("#mobile_header .search_box .btn_cancel").on('click',function(e){
		$('#mobile_header').removeClass('search_open');
	});

	$('#mobile_header .gnb_list > li > a').on('click',function(e){
		e.preventDefault();
		var $parent = $(this).parents('li');
		$parent.toggleClass('on');
		$('#mobile_menu').addClass('scroll');
	});
	$('#sub_top h2 a').on('click',function(e){		
		var tw = $(window).width();
		if(tw>=1200){
			return;
		}
		e.preventDefault();
		$('#sub_top').toggleClass('on');
	});


	$('.btn_movie_pop').on('click',function(e){
		e.preventDefault();
		var url = $(this).data('opt');
		var str =  '';
			str += '	<iframe src="'+url+'" frameborder="0" allow="autoplay; fullscreen" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>';
			str += '	</iframe>';

		$('#movie_pop').show();
		$('#movie_pop .mbox').append(str);
	});
	$('#movie_pop .btn_close').on('click',function(e){
		e.preventDefault();
		$('#movie_pop').hide();
		$('#movie_pop .mbox').empty();
	});

	$(".mo_board_search .keywordInput").on("focus", function() {
		$(".mo_board_search form").addClass("onfocus");
	});

	if($(".mo_board_search .keywordInput").val() != "" && $(".mo_board_search .keywordInput").val() != null) {
		$(".mo_board_search .btnClear").show(100);	
	} else {
		$(".mo_board_search .btnClear").hide(100);	
	}		

	$(".mo_board_search .keywordInput").on("keyup", function() {

		if( $(".mo_board_search input[name='sKeyword']").val().length > 0 ) {
			$(".mo_board_search .btnClear").show(100);	
		} else {
			$(".mo_board_search .btnClear").hide(100);	
		}
		
	});

	$(".mo_board_search .keywordInput").on("keydown", function(event) {

		if(event.keyCode === 13) {
			$("form[name='mo_searchFrm']").submit();
		}

	});

	$(".btnClear").on("click", function() {
		$(".mo_board_search input[name='sKeyword']").val("");
		$(this).hide(100);
	});

	$(".mo_board_search .keywordInput").on("blur", function() {
		$(".mo_board_search .mo_board_search form").removeClass("onfocus");
	});
	
	   /*---클릭---*/
	  $('.history03_list > li:nth-child(1) > a').on('click',function(e){
	    e.preventDefault();
	    $("html,body").stop().animate({
	        "scrollTop":$(".li_2020").offset().top + 10
	    },600);
	    })
	    $('.history03_list > li:nth-child(2) > a').on('click',function(e){
	        e.preventDefault();
	        $("html,body").stop().animate({
	            "scrollTop":$(".li_2016").offset().top
	        },600);
	    })
	    $('.history03_list > li:nth-child(3) > a').on('click',function(e){
	        e.preventDefault();
	        $("html,body").stop().animate({
	            "scrollTop":$(".li_2013").offset().top
	        },600);
	    })
	   
	   


});

setTimeout(function startSwiper(){
	//랜딩스와이퍼
	var loctSwiperTab = new Swiper('.navi-swiper .swiper-container', {
			slidesPerView: 4,
			watchSlidesVisibility: true,
			watchSlidesProgress: true,
		}) ;
	var loctSwiper = new Swiper('.location-swiper .swiper-container', {
			autoHeight: true,
			pagination: {
				el: '.swiper-wrap .swiper-pagination',
				clickable: true,
			},
			navigation: {
		   	nextEl: '.swiper-wrap .swiper-button-next',
			prevEl: '.swiper-wrap .swiper-button-prev',
			},
			thumbs: {
				swiper: loctSwiperTab
			}
	});
	
	//랜딩D스와이퍼
	var swiperMenu = ['틀어진 치아', '누런 치아', '벌어진치아', '블랙트라이앵글', '풍치', '재보철', '부식된 치아', '교정 후 재치료']
	var caseSwiper = new Swiper('.case-swiper .swiper-container', {
		pagination:{
			el: '.case-swiper .swiper-pagination',
			clickable: true,
			renderBullet: function(index, className){
				return '<span class="landing-pagination ' + className + '">' + (swiperMenu[index]) + '</span>';
			},
		},
		navigation:{
			nextEl: '.case-swiper .swiper-button-next',
			prevEl: '.case-swiper .swiper-button-prev'
		}
	}) ;
},1500);


