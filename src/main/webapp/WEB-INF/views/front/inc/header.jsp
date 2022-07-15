<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<title>${share_page_title}</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" 	content = "IE=Edge">
<meta name="viewport" 				content = "width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="Cache-control" 	content = "max-age=604800">
<meta name="format-detection" 		content = "telephone=no">
<meta name="_csrf" 					content = "${_csrf.token}" />
<meta name="_csrf_header" 			content = "${_csrf.headerName}" />
<meta name="_web_path" 				content = "${WebPath}" />
<meta name="description" 			content = "${share_desc}" />
<meta name="keywords" 				content = "${share_keyword}">


<meta property="og:locale" 			content="ko_KR">
<meta property="og:title"        	content="${share_title}"/>
<meta property="og:url"          	content="${share_url}"/>
<meta property="og:image"        	content="${share_image}" />
<meta property="og:description"     content="${share_desc}"/>    
<meta property="og:image:width"     content="200" />
<meta property="og:image:height"    content="200" />
<meta property="og:site_name"       content="강남그랜드안과 홈페이지" />
<meta property="og:type"            content="website" />


<meta name="naver-site-verification" content="367c267f329eac0bd529f9b6aae0c6aabc805df6" />
<meta name="google-site-verification" content="01ih9hTJnI3V5nuEPBt1dXDnJ449Bq6q91dAGnirDqw" />

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>강남그랜드안과</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, viewport-fit=cover">
<link rel="stylesheet" href="/common/css/reset.css">
<link rel="stylesheet" href="/common/css/common.css">
<link rel="stylesheet" href="/common/css/layout.css">
<link rel="stylesheet" href="/common/css/main.css?d=0712">
<link rel="stylesheet" href="/common/css/sub.css?d=1112">
<link rel="stylesheet" href="/common/css/sub2.css?d=063015">
<link rel="stylesheet" href="/common/css/font.css">
<link rel="stylesheet" href="/common/css/jquery-ui.css?date=0715">

<!-- plugin css -->
<link rel="stylesheet" href="/common/css/swiper.min.css">

<link rel="shortcut icon" href="/imgpath/_grand/common/favicon.ico" type="image/x-icon">

<script src="/common/js/jquery.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script src="/common/js/jquery.drag.js"></script>
<script src="/common/js/jquery-ui-touch-punch.min.js"></script>
<script src="/common/js/swiper.min.js"></script>
<script src="/common/js/main.js?date=1207"></script>
<script src="/common/js/sub.js?date=1112"></script>
<script src="/common/js/jquery.ellipsis.js"></script>
<script type="text/javascript" src="/common/js/jquery.tmpl.js"></script>
<script type="text/javascript" src="/common/js/jquery.tmpl.plus.js"></script>

<script>

	var _web_path		= "${WebPath}";
	var _grand_path	= "${GrandPath}";
	//var _web_test = "https://test.mpps.co.kr";
	var _domain		= "";
	var $header = $("meta[name='_csrf_header']").attr("content");
	var $token  = $("meta[name='_csrf']").attr("content");
	
	$.ajaxSetup({
		  beforeSend: function(jqXHR,settings) {
			  jqXHR.setRequestHeader( $header, $token);
		      return true;
		  }
		  ,
		  error: function(xhr , status, error ) {
				/* console.log(xhr);
				console.log(status);
				console.log(error); */
				
				if(xhr.status=="404")
				{
					alert('요청한 서버정보가 존재하지 않습니다.\n시스템 관리자에게 문의하세요');
					return;
				}
				
				if(xhr.status=="403")
				{
					alert("KISA 의거한 보안규약으로 생성된 CSRF토큰이 만료되었습니다. 새로고침을 통해 새로운 토큰으로 교체합니다.");
					location.reload();
					return;
				}
				
				if(xhr.status=="500")
				{
					alert('서버 에러가 발생하였습니다.\n시스템 관리자에게 문의하세요');
					return;
				}	
				
				if(xhr.status=="999")
				{
					alert('로그인이 필요한 서비스입니다.\n다시 이용해주세요.');
					location.href='/member/login';
					return;
				}						
		  }		  
	});		
	
</script>

<script>

	$.browser={};(function(){
	    jQuery.browser.msie=false;
	    $.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)\./)){
	    $.browser.msie=true;jQuery.browser.version=RegExp.$1;}
	})();	
	
	jQuery(function ($) {
	    var _oldShow = $.fn.show;
	    //Override jquery's 'show()' method to include two triggered events before and after
	    $.fn.show = function (speed, oldCallback) {
	    	
	        return $(this).each(function () {
	            var obj = $(this),
	                newCallback = function () {
	                    if ($.isFunction(oldCallback)) {
	                        oldCallback.apply(obj);
	                }
	            };
	            
	            setTimeout(function(){
		            if ( $(".dimmed").css("display") == "block")
		            {
		            	$("html").addClass("lypop-active");
		            }	
	            },300);


	            
	            _oldShow.apply(obj, [speed, newCallback]);
	        });
	    }
	});	

	
	

	jQuery(function ($) {
	    var _oldHide = $.fn.hide;
	    //Override jquery's 'hide()' method to include two triggered events before and after
	    $.fn.hide = function (speed, oldCallback) {
	        return $(this).each(function () {
	            var obj = $(this),
	                newCallback = function () {
	                    if ($.isFunction(oldCallback)) {
	                        oldCallback.apply(obj);
	                }
	            };
	        
	            $("html").removeClass("lypop-active");
	            _oldHide.apply(obj, [speed, newCallback]);
	        });
	    }
	});			
	
	
	$.fn._fadeIn = $.fn.fadeIn;
	$.fn.fadeIn = function(){
		
           
           
           setTimeout(function(){
            if ( $(".dimmed").css("display") == "block")
            {
            	$("html").addClass("lypop-active");
            }	
           },300);
           
           
		if(!$.browser.ie){
			
            
            
			return $.fn._fadeIn.apply(this, arguments);
		}else{
			$.fn.show.apply(this);
			for(var i = 0, l = arguments.length; i < l; i++){
				$.isFunction(arguments[i]) && arguments[i]();
			};
		};
	};

	// override jquery fadeOut
	$.fn._fadeOut = $.fn.fadeOut;
	$.fn.fadeOut = function(){
		
		$("html").removeClass("lypop-active");
		
		if(!$.browser.ie){
			return $.fn._fadeOut.apply(this, arguments);
		}else{
			$.fn.hide.apply(this);
			for(var i = 0, l = arguments.length; i < l; i++){
				$.isFunction(arguments[i]) && arguments[i]();
			};
		};
	};			
</script>


<script>var mn=0; var sn=0; var cn=0;</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-VXFM7BNXFS"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-VXFM7BNXFS');
</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-199944832-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-199944832-1');
</script>

<script>
    function sendGoogleAnalyticsEvent(category, action) {
        var UserAgent = navigator.userAgent;
        var device = 'DESKTOP';
    	if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
    	    device = 'MOBILE';
    	}

        var data = {
           'event_action': action,
           'event_category': category,
           'event_label': device,
        };
        console.log(data);

        gtag('event', action, data);
    }

</script>
<!-- Facebook Pixel Code -->

<script>

  !function(f,b,e,v,n,t,s)

  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?

  n.callMethod.apply(n,arguments):n.queue.push(arguments)};

  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';

  n.queue=[];t=b.createElement(e);t.async=!0;

  t.src=v;s=b.getElementsByTagName(e)[0];

  s.parentNode.insertBefore(t,s)}(window, document,'script',

  'https://connect.facebook.net/en_US/fbevents.js');

  fbq('init', '911662786386448');

  fbq('track', 'PageView');

</script>

<noscript><img height="1" width="1" style="display:none"

  src="https://www.facebook.com/tr?id=911662786386448&ev=PageView&noscript=1"

/></noscript>

<!-- End Facebook Pixel Code -->
<script id='pixel-script-poptin' src='https://cdn.popt.in/pixel.js?id=23c9ffad557c0' async='true'></script>