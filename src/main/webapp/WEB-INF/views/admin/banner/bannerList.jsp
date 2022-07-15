<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp" %>
</head>
<body id="bannerBody">	     
  	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp" %>
  	<table id="bannerList" style="width:100%">
	  <tr >
	     <th>노출순서</th>
	     <th>이미지설명</th> 
	     <th>웹이미지</th>
	     <th>기타이미지</th>
	     <th>노출기간</th>
	     <th>게시여부</th>
	  </tr>
	</table> 
    <script type="text/javascript">    		
    		/** 실제 로직화 구현**/
    		$(document).ready(function(){
    			getBannerListDtl("${bannersub_parentidx}");
    		});
    	
            
    		function getBannerListDtl(param)
    		{
    			param.pagesize = 50;
    			var bannerListhtml = "";
    			$.ajax({  
					url      			 : "/web/interface/selectBannerwebInfo"
				   ,data 				 : param
				   ,type    			 : "POST"
				   ,dataType 		 : "json"
				   ,success  : function(data) {
					   
					   for(var i=0; i < data.rows.length ; i++)
					   {	
						   bannerListhtml += "<tr>";
						   bannerListhtml += "<td>" + data.rows[i].bannersub_showorder+"</td>";
						   bannerListhtml += "<td>"+ data.rows[i].bannersub_explan+ "</td>";
						   if(data.rows[i].bannersub_webImg != ""){
						   	bannerListhtml += "<td><img style='width:150px;height:150px;' src='" +_web_path + data.rows[i].bannersub_webImg+"'/></td>";
						   }
						   else{
							   bannerListhtml += "<td></td>";
						   }
						   if(data.rows[i].bannersub_etcImg != ""){
						   	bannerListhtml += "<td><img style='width:150px;height:150px;'  src='" +_web_path + data.rows[i].bannersub_etcImg+"'/></td>";
						   }
						   else{
							   bannerListhtml += "<td></td>";
						   }
						   bannerListhtml += "<td>" + data.rows[i].bannersub_showdate+"</td>";
						   bannerListhtml += "<td>" + data.rows[i].bannersub_show+"</td>";
						   bannerListhtml += "</tr>";
					   }
					   $("#bannerList").append(bannerListhtml);
				   }
				   ,
				   error:function (xhr, ajaxOptions, thrownError){
						failes(xhr, ajaxOptions, thrownError);
				   } 
				});
    		}    		
    </script>
    <style>
    	table, th, td {
  		   border: 1px solid black;
     	   border-collapse: collapse;
     	   padding: 15px;
     	   text-align:center;
		} 
		td{
			 width:150px;height:150px;
			 vertical-align: middle;
		}
    </style>
</body>
</html>
