$(function(){

	var article_boxH = $('.article_box_left').height();
	$('.article_box_right').css({
		height:article_boxH
	});

	//tab style 01
	$(document).on('click','.article_box .tab_st01 li',function(){
		$(this).addClass('on').siblings().removeClass('on')
		var tab_idx = $('.article_box .tab_st01 li').index($(this))
		$('.article_box .tab_sec').eq(tab_idx).addClass('on').siblings('.tab_sec').removeClass('on')
	});

});

