<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
	<%@ include file="/WEB-INF/views/front/inc/common_board_js.jsp" %>
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
	
		$(document).ready(function(){
			load_board_list();
		});
		
		
		function load_board_list(){
			this.tmpl = "#"+"${menu_code}" + "_detail_tmpl";
			
			$boardList.set({
				box 				: ".tmpl"
				,url           	 	: "/community/interface/communityList/${menu_code}"
				,board_idx			: "${board_idx}"
		      	,templeat      	    : this.tmpl
				,onComplete         : function(data){
					
					if( "${menu_code}" == "BD04"  ){
						$(".sub").addClass("counsel__review");
						board_delete();
						board_update();
					}else if( "${menu_code =='BD06'}"  ){
						$(".sub").addClass("mo_padding review__main");
					}
					
					if( "${menu_code}"=="BD03" ){
						eventDb();
						applyAPI("btn_apply_block", "info_agree" , "검사 신청", "BD12");
					}
		        }
		      	
			});
		}
		
		function board_delete(){
			$(".btn_delete").on('click',function(){
				if(confirm("정말로 삭제하시겠습니까?")) {
					
					this.prm = {};
					this.prm.board_idx = "${board_idx}"; 
					
					$.ajax({
						url			: "/community/interface/deleteBoard"
						,type		: "POST"
						,data		: this.prm
						,success	: function(data){
							if( data.result == 1 ){
								alert("삭제가 완료 됐습니다.");
								location.href="/community/counsel";
							}else{
								alert("오류가 발생하였습니다. 관리자에게 문의하여주세요.");
							}
						}
					});
				}else{
					return false;
				}
			});
		}
		
		function board_update(){
			$(".btn_update").on('click',function(){
				location.href="/community/counsel_write/${board_idx}";
			});
		}
		
		
		
	</script>
</body>
</html>