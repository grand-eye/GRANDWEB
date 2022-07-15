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
			
		</h1>
	
	    <div style="padding:0;float:right;margin-top:15px;">
	    	<span>한민수님 환영합니다. (2018-02-05 오후 3:15:20에 로그인 함.)</span>
	    	<span>&nbsp;</span>
	        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-man'" 	style="width:80px">정보수정</a>
	        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" 		style="width:80px">로그아웃</a>
	    </div>	
	</div>
	
	
	<div data-options="region:'west',split:false,title:'Menu'" id="main_west" style="width:230px;padding:10px;">
        <ul id="main_menu_tree"></ul>
	</div>
	
	
	
	<div id="main_tab_box" class="easyui-tabs" data-options="region:'center'" style="width:100%;height:auto"></div>
	<div data-options="region:'south',split:true" style="height:0px;">	</div>
	
	
	<script type="text/javascript">
			
			var $headerSize = 86;
			var $tabCount    = 10;
			

            
            
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
			
			
			
            $('#main_west').panel({
                onResize:function(w,h){
                	
                	console.log(w);
					$('#main_tab_box').tabs({
						width : "100%"
					});	
                }
            });			
	
            
            
			var prMain=  {};
			prMain.s_category = "GNB02";
			prMain.s_level 		= "0";
			prMain.s_useyn		= "Y";
			prMain.s_login		= 'N';
			
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
	    					console.log(tabCount);

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
					tabPosition:"bottom"
					, height : $(window).height() - $headerSize		//헤더의 크기(70px) + 패딩사이즈 (10px)
			});
			
			$(window).on("resize", function(){
				
					$('#main_tab_box').tabs({
						tabPosition:"bottom"
						, height : $(window).height() - $headerSize		//헤더의 크기(70px) + 패딩사이즈 (10px)
					});				
			});
	
	</script>
</body>
</html>