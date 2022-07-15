<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>


<script type="text/x-jquery-tmpl"  id="tmpl_main_banner2">
	<div>
		<a href="#none" class="gnb-banner">
			<img src="${WebPath}/\${bannersub_etcImg}" width="250" height="330" alt="">
		</a>
	</div>
</script>

<script type="text/x-jquery-tmpl"  id="tmpl_sub_banner">
	<li class="swiper-slide">
		<a href="\${bannersub_link}" target="{{html $item.isTarget('${bannersub_link}')}}" >
			<img src="${WebPath}\${bannersub_webImg}" alt="\${bannersub_summary}">
		</a>
	</li>
</script>	

<script type="text/x-jquery-tmpl"  id="tmpl_main_banner">
	{{if "${_device}" == "WEB"}}
		<li class="swiper-slide" data-bg="${WebPath}/\${bannersub_etcImg}">
			{{if bannersub_linktype == "Y"}}
			<a href="\${bannersub_link}" target="_blank">
			{{else}}
			<a href="\${bannersub_link}" target="_self">
			{{/if}}
				<span class="main-spot-over">
					<img src="/common/img/m_spot_over.png" alt="">
				</span>
				<img src="${WebPath}/\${bannersub_webImg}" alt="">
			</a>
		</li>
	{{else}}
		<li class="swiper-slide">
			<a href="\${bannersub_link}">
				<img src="${WebPath}/\${bannersub_mobImg}" alt="">
			</a>
		</li>  
	{{/if}}
</script>

<script type="text/x-jquery-tmpl"  id="login_banner_tmpl">
	<div class="login-spot" style="background:url('${WebPath}/\${bannersub_webImg}')"></div>
</script>




<script type="text/javascript">
	var _tempFnc = {
		  isTarget : function( urls ){
			   var  url 				= this.data.bannersub_link;
			   var regExt 		= /^((http(s?))\:\/\/)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/;
			   var httpCheck 	= url.match( regExt );
			   
			   if ( httpCheck == null ) 
			   {
				   return "_self";
			   }
			   else
			   {
				   return "_blank";
			   }
		  },
		  webpath : function(){
				return _web_path;
		   }
	};


	var $bannerCom = {
			
			set: function( options )
			{
				var setting = $.extend({ 
						bannersub_parentidx : ""
					, 	banner_gnb		 		: ""
					, 	bannersub_show	 		: "Y"
					,	bannersub_link			: ""
					, 	box					 	: ""
					,   templeat				: ""
					,	onCompleat				: function(target){}
					,	onBefore				: function(){}
				} , options );
				
				var data;
				var param = {};
				param.bannersub_parentidx	 = setting.bannersub_parentidx;
				param.banner_gnb     	 	 = setting.banner_gnb;
				param.bannersub_link		 = setting.bannersub_link;
				param.bannersub_show   	 	 = setting.bannersub_show;
				param.device				 = setting.device
				
				$.ajax(
				
						{  
			                url      			 : "/grand/interface/selectBannercommonInfo"
			               ,data 				 : param
			               ,type    			 : "POST"
			               ,dataType 			 : "json"
			               ,success  : function(response) {
								data = response;
			            	    if ( response.row.length > 0 )
			    				{
			            	    	//
			    					$.each(response.row, function(x,y){
			    						var html = y.bannersub_explan;
			    						var target = y.bannersub_tag;
			    						html = html.replace(/@img1@/gi, y.bannersub_webImg );
			    						html = html.replace(/@img2@/gi, y.bannersub_etcImg );
			    						//모바일
			    						html = html.replace(/@img3@/gi, y.bannersub_mobImg );
			    						html = html.replace(/@img4@/gi, y.bannersub_spareImg );
			    						
			    						$(target).append(html);
			    					});
			    				}
			               }
						   , complete : function() {
							   setting.onCompleat(data);
							   setTimeout(function(){
					        		$(".loader_dimm").remove();
					        		$(".loader").remove();
					        	},1000);
						   }
						}						
				
				);				

		    }		
	};			
	

</script>