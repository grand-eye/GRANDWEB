<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body class="" id="">
	<div id="gnbBodys" class="easyui-layout" style="width:100%;height:100%;">
	    <div data-options="region:'west',title:'Gnb메뉴관리',split:false" style="width:250px;">
			<div class="easyui-panel" style="height:auto;padding:5px;border:0;"  > 
				<select name="gnbCategory" id="gnbCategory" style="width:100%;">
				</select>
			    <div style="margin:10px 0;display:none" id="gnb_btn_box">
			        <a href="#" class="easyui-linkbutton" id="gnb_append" >메뉴 추가</a>
			        <a href="#" class="easyui-linkbutton" id="gnb_delete" >메뉴 삭제</a>
			    </div>				
				<ul id="gnb_menu_tree">
				</ul>		
			</div>		    
	    </div>
	    <div data-options="region:'center',title:'메뉴상세설정'" style="padding:5px;">
				<div  id="gnb_pannel" style="height:auto;padding:5px;border:0;"  > 
				</div>	    
	    
	    
	    </div>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			commonFnc.setDataCombo("#gnbCategory", "A004", "0", "", "GNB카테고리 선택", function(value){
				if( value != "" )
				{
					getMenuTreeLoaded( value );
				}
			});
		});
		
		function gnbMenuDelete( selectedGnbId ){
			var param = {};
			param.tm_code = selectedGnbId;
			
			$.ajax({
				url					: "/admin/interface/deleteGnb"
				,data				: param
				,type				: "POST"
				,dataType			: "json"
				,success			: function(res){
					if( res.resultCode == 'Y' ){
						alert('선택하신 메뉴가 삭제됐습니다.');
					}else{
						alert('오류가 발생 했습니다. 관리자에게 문의 해주시기 바랍니다.');
					}
					
				}
			});
			
		}
		

		function getMenuTreeLoaded( category )
		{			
			var pr=  {};
			pr.s_category = category;
			pr.s_level = "0";
			
			if ( category == "GNB02" )
			{
				pr.s_group = "A004";
			}
			
			$.ajax({  
                url      			 : "/admin/interface/selectGnb"
               ,data 				 : pr
               ,type    			 : "POST"
               ,dataType 		 : "json"
               ,success  : function(response) {
            	   					
            	    $("#gnb_btn_box").show();
            	    
            	    $("#gnb_delete").off("click").on("click", function(){
            	    
            	    	if (confirm("정말로 삭제 하시겠습니까?")) {
            	    	
	                        var node = $('#gnb_menu_tree').tree('getSelected');
	                        
	                        if ( node != null && node != "null")
	                        {
	                        	
	                        	if(node.id != undefined && node.id != '')
	                        	{
	                        		gnbMenuDelete( node.id );
	                        		//$('#gnb_menu_tree').tree('remove', node.target);		
	                        	}
	                        }
            	    	}else{
            	    		alert('취소 됐습니다.');
            	    	}   
                                    	    	
            	    });
            	    
            	    $("#gnb_append").off("click").on("click", function(){
            	    	
                        var t = $('#gnb_menu_tree');
                        var node = t.tree('getSelected');
                        
                        if ( node != null && node != "null")
                        {

                        	
	                        t.tree('append', {
	                            parent: (node?node.target:null),
	                            data: [
	                            	{
	                                	text: '<span style="color:blue">새로운 GNB</span>'	,
	                                	tm_parent : node.tm_code	,
	                                	tm_code	 : ''
	                            	}
	                            ]
	                        });		                        	
                        }
                        else
                        {
                        	alert("메뉴 Tree에서 추가할 부모영역을 선택하셔야 합니다.");
                        }
            	    	
            	    });
            	    
            	    
					$("#gnb_menu_tree").tree({
						animate:true 				,
						data : response.rows	,
						formatter:function(node){
							
							if( node.tm_useyn == "N")
							{
								return '<span style="color:red;text-decoration: line-through;">'+node.text+'</span>';
							}
							else
							{
								return node.text;	
							}
							
						}			
						,
						onClick: function(node){
							
							var url = '/admin/gnb/gnbForm?s_category='+category;
							if ( node.id !="root")
							{
								url = url + '&s_code='+node.tm_code+'&s_parent='+node.tm_parent;
								
								$("#gnb_pannel").panel({
								    href	:	url						,
								    onLoad:function(){
								        //alert('loaded successfully');
								    }
								});										
							}
						}
					});
               }
            });				
			
		}		
	</script>		
</body>
</html>