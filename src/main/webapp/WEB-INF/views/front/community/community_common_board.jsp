<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
	<%@ include file="/WEB-INF/views/front/inc/common_board_js.jsp" %>
	<%@ include file="/WEB-INF/views/front/inc/common_board_template.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>	
	<main>
		<div class="sub">
			<h2 class="sub_title">${share_desc}</h2>
			<div class="wsize pt100 pb200 tmpl">
				
			</div> 
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript" src="/common/js/page.js"></script>
	<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
	<script type="text/javascript" src="/common/js/jquery.tmpl.plus.js"></script>
	
	<script type="text/javascript">

 		
 		var search_text;
		var search_category;
	
		var setPage = 1;
		
		window.onpageshow = function(event) {
			if( event.persisted || ( window.performance && window.performance.navigation.type == 2 )) {					
				var mCode = "${menu_code}";
				
				if( sessionStorage.getItem("url").indexOf(mCode) > -1 ) {
					setPage = sessionStorage.getItem("page");
				}
				load_board_list_init(setPage,"Y");					
			} else {				
				load_board_list_init(setPage,"Y");		
			}
		}
		
		$(document).ready(function(){
			$("#"+"${menu_code}"+"_list_tmpl").tmpl().appendTo(".tmpl");
			
			if( "${menu_code}"=="BD02" ){
				load_board_list_init(1,"Y",null,null,"Y");
			}
			
			if( "${menu_code}" == "BD04" ){
				$("#counsel_btn").append('<a href="/community/counsel_write" class="btn_apply mb160">온라인 상담하기</a>');
			}
			
			if( "${menu_code}" == "BD07" ){
				qna_click_event();
				$(".q_box").on("click", function(){
					$(this).next(".n_box").slideToggle();
					$(this).toggleClass("active");
				});
			}

			$(".btn_search").on("click",function() {

				var search_text = $("input[type='search']").val().trim();
				var search_category="";

				$("input[type='checkbox'][name='chk']").each(function() {
					if ( $(this).is(":checked") == true ) {
						search_category += $(this).attr("val") + ",";
					}
				});

				if( "${menu_code}" == "BD07" ){
					$(".qna_wrap .sub_tab_menu li").removeClass("active");
				}

				load_board_list(1, "next", "", search_text, null, search_category);
			});

			$("input[type='search']").on("keyup", function(key) {
				if (key.keyCode === 13) {
					$(".btn_search").trigger("click");
				}
			});

			/*
			$("input[type='checkbox'][name='chk']").on("change", function() {
				
			});
			*/
		});
		
		function qna_click_event(){
			$(".qna_wrap .tab").hide();
			$(".qna_wrap .tab:first").show();

			$(".qna_wrap .sub_tab_menu li").click(function () {
			$(".qna_wrap .sub_tab_menu li").removeClass("active");

			$("input[type='search']").val("");
			
				$(".qna_list").html("");
			
				$(this).addClass("active");
				$(".qna_wrap .tab").hide();
				var activeTab = $(this).attr("rel");
				$("#" + activeTab).fadeIn();
				
				if( activeTab != "all") {					
					this.category = $("li.active").attr("rel");
					load_board_list_init(1,"Y",this.category);
				} else {					
					load_board_list_init(1,"Y");
				}
				
			});
		}

		function load_board_list_init(page,init,category,list_form,recall){
				
			this.box = "."+"${menu_code}" + "_list";
			this.tmpl = "#"+"${menu_code}" + "_list";
			this.menu_code = "${menu_code}";
			
			if( recall == "Y" ){
				this.box = "."+"BD10" + "_list";
				this.tmpl = "#"+"BD10" + "_list";
				this.menu_code = "BD10";
				recall = "N";
			}
			
			/* this.box_mo = "."+"${menu_code}" + "_list_mo";
			this.tmpl_mo = "#"+"${menu_code}" + "_list_mo"; */
			
			/* if( window.innerWidth < 721 ){
				this.box = this.box + "_mo";
				this.tmpl = this.tmpl + "_mo";
			} */
			
			
			if( ${menu_code== "BD07"} ){
				//category = "QA01";
			}
			
			$boardList.set({
				box 				: this.box
				,url           	 	: "/community/interface/communityList/"+this.menu_code
		      	,templeat      	    : this.tmpl
		      	,page				: page
		      	,category			: category
		      	,list_form			: "${menu_code}"
		      	,init				: init
				,onComplete        : function(data){
					
					sessionStorage.setItem('page', page);
					sessionStorage.setItem('url', "/community/interface/communityList/${menu_code}");
					
					activeChk(page);
					//clickEvent();
					
					if( ${menu_code== "BD07"} ){
						$(".q_box").on("click", function(){
							$(this).next(".n_box").slideToggle();
							$(this).toggleClass("active");
						});
					}
					
					if( ${menu_code== "BD04"} ){
						$(".sub").addClass("com__counsel");
					}else if( ${menu_code== "BD01"} ){
						$(".sub").addClass("com__notice");
					}else if( ${menu_code== "BD06"} ){
						$(".sub").addClass("mo_padding review__main");
					}else if( ${menu_code== "BD02"} ){
						$(".sub").addClass("community__media");
					}else if( ${menu_code== "BD07"} ){
						$(".sub").addClass("community__qna");
					}
					
		        }
			});
		}
		
		function load_board_list(page,pageinit,category,search_text,list_form,search_category){
			
			this.box = "."+"${menu_code}" + "_list";
			this.tmpl = "#"+"${menu_code}" + "_list";
			
			/* this.box_mo = "."+"${menu_code}" + "_list_mo";
			this.tmpl_mo = "#"+"${menu_code}" + "_list_mo"; */
			
			/* if( window.innerWidth < 721 ){
				this.box = this.box + "_mo";
				this.tmpl = this.tmpl + "_mo";
			} */

			if( isNaN(page) == false ){
				$boardList.set({
					box 				: this.box
					,url           	 	: "/community/interface/communityList/${menu_code}"
			      	,templeat      	    : this.tmpl
			      	,page				: page
			      	,pageinit			: pageinit
			      	,board_search		: search_text
			      	,category			: category
			      	,search_category	: search_category
			      	,list_form			: "${menu_code}"
					,onComplete         : function(data){
						
						sessionStorage.setItem('page', page);
						sessionStorage.setItem('url', "/community/interface/communityList/${menu_code}");
						
						if( ${menu_code== "BD07"} ){
							$(".q_box").on("click", function(){
								$(this).next(".n_box").slideToggle();
								$(this).toggleClass("active");
							});
						}
						
			        }
			      	
				});
			}else{
				return false;
			}
			
			
		}
		
		function secret_tmpl(idx){
			$(".tmpl").html("");
			$("#secret_tmpl").tmpl().appendTo(".tmpl");
			
			$(".btn_counsel_detail").on('click',function(){
				if( $(".passwd").val() == null || $(".passwd").val()=='' ){
					alert('비밀번호를 입력해주시기 바랍니다.');
					return false;
				}
				var prm = {};
				prm.board_reg_pass = $(".passwd").val().toString();
				prm.board_idx = idx;
				
				$.ajax({
					url			: "/community/interface/communityList/BD04"
					,data		: prm
					,type		: "POST"
					,success	: function(data){
						if( data.count != 1 ){
							alert("비밀번호가 일치하지 않습니다. 비밀번호를 다시 입력해주세요.");
						}else{
							location.href='/community/counsel_detail/'+idx;
						}
					}
				})
			});
			
		}
		
		function activeChk(index){
			if( $('.paging >li').hasClass("active") == false ){
				$(".paging > li:eq("+index+")").addClass("active");
			}
		}
		
		
	</script>
	
	

</body>
</html>