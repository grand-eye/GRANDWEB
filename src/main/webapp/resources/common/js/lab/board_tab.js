
$(function () {
	$('.board_bna .board_tab > ul > li > a').on('click',function(e){
		var idx = $(this).parents('li').index();
		boardActiveFn(idx);
	});
	$('.board_bna .board_tab > ul > li > ul a').on('click',function(e){
		var s = $(this).parents('li').index();
		var n = $(this).parent().parents('li').index();
		boardActiveFn2(n,s);
	});
	function boardActiveFn(n){
		$('.board_bna .board_tab li').removeClass('on');
		if(n<0){
			return;
		}
		$('.board_bna .board_tab > ul > li').eq(n).addClass('on');
		var $target = $('.board_bna .board_tab > ul > li').eq(n);
		var len = $target.find('ul').length;
		if(len>0){
			var tx = Math.max(0,$target.position().left);		
			var tw = $target.find('ul li:last-child').position().left+ $target.find('ul li:last-child').width();
			var ty = $target.find('ul li:last-child').position().top;
			if(ty>30){
				tx = 0;
			}else if(tx+tw>1200){
				tx = 1200-tw-10;
			}
			$('.board_bna .board_tab > ul ul').css('left',tx+'px');
		}
		boardActiveFn2(n,0);
	}
	function boardActiveFn2(n,s){
		$('.board_bna .board_tab ul ul li').removeClass('on');
		$('.board_bna .board_tab > ul > li').eq(n).find('li').eq(s).addClass('on');
	}
	/*
	var boardActive;
	boardActive = $('.board_bna .board_tab > ul > li.active').index();
	$('.board_bna .board_tab > ul > li > a').on('click',function(e){
		var idx = $(this).parents('li').index();
		boardActiveFn(idx);
	});
	$('.board_bna .board_tab').on('mouseleave',function(e){
		boardActiveFn(boardActive);
	});
	
	function boardActiveFn(n){
		$('.board_bna .board_tab li').removeClass('on');
		console.log(n);
		if(n<0){
			return;
		}
		$('.board_bna .board_tab > ul > li').eq(n).addClass('on');
		var $target = $('.board_bna .board_tab > ul > li').eq(n);
		var len = $target.find('ul').length;
		if(len>0){
			var tx = Math.max(0,$target.position().left);		
			var tw = $target.find('ul li:last-child').position().left+ $target.find('ul li:last-child').width();
			var ty = $target.find('ul li:last-child').position().top;
			if(ty>30){
				tx = 0;
			}else if(tx+tw>1200){
				tx = 1200-tw-10;
			}
			$('.board_bna .board_tab > ul ul').css('left',tx+'px');
		}
	}
	boardActiveFn(boardActive);
	*/
});



(function( $ ) {

})( jQuery );

