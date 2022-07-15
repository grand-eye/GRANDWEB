<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>

</head>
<body class="easyui-layout" id="main_layout" style="width:100%;">

	<div data-options="region:'north',border:false" style="overflow:hidden;height:70px;background:#FFF;padding:10px;background: url(/admin/img/bg_admin.gif) repeat-x left top">
		<h1 style="margin-top:1px;float:left">
			<a href="https://grand.co.kr" style="font-size:20px;font-weight:bold;color:#000;display:block;line-height:45px;">강남그랜드안과 ADMIN</a>
		</h1>
	
	    <div style="padding:0;float:right;margin-top:15px;">
	    	<span><b>${sessionScope.GRANDADM_MANAGER_NM}</b>님 환영합니다. (${sessionScope.GRANDADM_LOGIN_DT}에 로그인 함.)</span>
	    	<span>&nbsp;</span>
	        <a href="#" class="easyui-linkbutton logoutAdminBtn" data-options="iconCls:'icon-clear'" 		style="width:80px">로그아웃</a>
	    </div>	
	</div>
	
	
	<div data-options="region:'west',split:false,title:'Menu'" id="main_west" style="width:250px;padding:10px;">
        <ul id="main_menu_tree"></ul>
	</div>
	
	
	
	<div id="main_tab_box" class="easyui-tabs" data-options="region:'center', tabPosition: 'bottom'" style="width:100%;height:auto"></div>
	<div data-options="region:'south',split:true" style="height:0px;">	</div>
	
	
	<script type="text/javascript">
			
			var $headerSize = 86;
			var $tabCount    = 20;
			var $grpCode	= "${sessionScope.GRANDADM_GRP_CD}";
			var $tabIndex = 0;
            
			var p = $('body').layout(
				{
					onCollapse : function(region){
						if ( region == "west")
						{
							$('#main_tab_box').tabs({
								width : "100%"
							});							
						}
					}
					,
					onExpand : function(region){
						if ( region == "west")
						{
							$('#main_tab_box').tabs({
								width : "100%"
							});							
						}
					}
				}		
			);
			
			
			/*
            $('#main_west').panel({
                onResize:function(w,h){
                	
					$('#main_tab_box').tabs({
						width : "100%"
					});
                	
                }
            });
			*/
            
            $(".logoutAdminBtn").on("click", function(){
            	if ( confirm('로그아웃 하시겠습니까?') ) {
            		
        			var param ={};
        			
    				$.ajax({  
    					url      			 : "/admin/interface/logOut"
    				   ,data 				 : param
    				   ,type    			 : "POST"
    				   ,dataType 		 : "json"
    				   ,success  : function(data) {
    					   location.href='/admin/login';
   						   return;
    				   }
    				});              		
            		
            	}
            });
            
            
			var prMain=  {};
			prMain.s_category = "GNB02";
			prMain.s_level 		= "0";
			prMain.s_useyn		= "Y";
			prMain.s_login		= 'Y';
			prMain.s_group		= $grpCode;
			prMain.s_rule			= 'Y';
			
			
			var $headerM = $("meta[name='_csrf_header']").attr("content");
			var $tokenM  = $("meta[name='_csrf']").attr("content");
			
			
			$.ajax({  
                url      			 : "/admin/interface/selectGnb"
               ,data 				 : prMain
               ,type    			 : "POST"
               ,dataType 		 : "json"
 			   ,beforeSend: function(jqXHR,settings) {
					  jqXHR.setRequestHeader( $headerM , $tokenM );
				    return true;
				}               
               ,success  : function(response) {
	       			$('#main_menu_tree').tree({
	       				data : response.rows					,
	    				animate:true								,
	    				onClick: function(node){
				
	    					var tabCount =$('#main_tab_box').tabs('tabs').length;

	    					if (parseInt(tabCount) + 1 > $tabCount)
	    					{
	    						alert('탭 원도우는 최대 '+$tabCount+'개까지 가능합니다. 해당 메뉴탭을 추가하실려면, 1개 이상 닫으신후 이용해주세요');
	    						return false;
	    					}
	    					
	    					var tabExists = 	 $('#main_tab_box').tabs('getTab', node.text);	
	    					
	    					if ( tabExists == null || tabExists == "null")
	    					{
	    						if ( node.tm_url != "" && node.tm_url != undefined )
	    						{
	    							$('#main_tab_box').tabs('add', {
	    								   title :  node.text
	    								,  href : node.tm_url + "?ui_id=" + node.id 
	    								,  closable : true
	    								,  selected : true
	    							});
	    						}
	    					}
	    					else
	    					{	
	    						$('#main_tab_box').tabs('select', node.text);
	    					}
	    				}
	    			});	
               }
            });			

			
			$('#main_tab_box').tabs({
					height : $(window).height() - $headerSize		//헤더의 크기(70px) + 패딩사이즈 (10px)
					, onSelect : function(title, index) {
						$tabIndex = index;
					}
			});
			
			$(window).on("resize", function(){
				
				var tabIdx = $tabIndex;
				
				$('#main_tab_box').tabs({
					tabPosition:"bottom"
					, height : $(window).height() - $headerSize		//헤더의 크기(70px) + 패딩사이즈 (10px)
				});
				
				$('#main_tab_box').tabs('select', tabIdx);
				
			});
	
	</script>
</body>
</html>