function clickEvent(count,roundNumber,search_text){
			$(".paging > li").on('click',function(){
				
				var activeObj = $(".paging > li.active");
				var activeNum = parseInt(activeObj.text());
				
				if( $(this).text() == " > "){
					
					if( (count / roundNumber) <= activeNum ){
						return false;
					}
					
					$(".paging > li").removeClass("active");
					
					if( activeObj.next().text() == " > " ) {
						activeNum +=1;
						load_board_list(activeNum,"next","",search_text);
					}
					load_board_list ( activeObj.next().text(),null,"",search_text );
					activeObj.next().addClass("active");
					
				}else if( $(this).text() == " < "){
					if( activeObj.prev().text() != " < "){
						$(".paging > li").removeClass("active");
						load_board_list ( activeObj.prev().text(),null,"",search_text ) ;
						activeObj.prev().addClass("active");
					}else if( activeObj.prev().text() == " < ") {
						if( activeObj.text() =="1" ){
							return false;
						}else{
							$(".paging > li").removeClass("active");
							var activeNum = parseInt(activeObj.text());
							activeNum -=1;
							load_board_list(activeNum,"prev","",search_text);
							activeObj.prev().addClass("active");
						}
					}
				}else{
					load_board_list ( $(this).text(),null,"",search_text ) ;
					$(".paging > li").removeClass("active");
					$(this).addClass("active");
				}
				
			});
		}