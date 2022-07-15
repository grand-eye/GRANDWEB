<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>
</head>
<body style="background-color: #fff">
<link rel="stylesheet" type="text/css" href="/resources/admin/admin_board.css">

<div class="easyui-panel" title="예약관리 > 공휴일 설정"
		style="height: 60px; padding: 5px; border: 0;"
		data-options="iconCls:'icon-redo'">
		
	</div>	

<div id="reservationArea">
	<input type="hidden" id="gubun" value="0"/>
	<input type="hidden" id="weekday" value="10,19">
	<input type="hidden" id="weekend" value="10,17">
	<input type="hidden" id="weekday0" value="10,17">
	<input type="hidden" id="weekday_breaktime" value="13,14">
	<input type="hidden" id="weekend_breaktime" value="13,14">
	<input type="hidden" id="weekday_breaktime0" value="13,14">
	
	<div class="inwrap">
		<div id="zeze">
		</div>
		<div id="time_list" style="display:none">
			<h4></h4>
			<ul></ul>
		</div>
	</div>
</div>

	<%@ include file="/WEB-INF/views/admin/inc/reservation_js.jsp"%>
	
	<script type="text/javascript">		
   		
		$(document).ready(function() {
			
			var date = new Date();
			var year = date.getFullYear();
			var mon = date.getMonth()+1;
			var day = date.getDate();
			
   			calendarr(mon,year,day);
		});
		
		function getHolidayList() {
			
			var param = {};
			param.date = $('.month').html();
			param.time = "day";
			param.gubun = $('#gubun').val();
			
			$.ajax({  
	               url      		 : "/admin/interface/selectHolidayList"
	              ,data 			 : param
	              ,type    		 : "POST"
	              ,dataType 	 : "json"
	              ,success  : function(data) {				            	  
	            	  	var date = null;
		  				var day = null;
		  				for(var i=0; i<data.rows.length; i++) {
		  					date = data.rows[i].date;
		  					day = date.substring(8, 10);
		  					
		  					if( day.substring(0,1) == 0 ) {
		  						day = day.substring(1,2);						
		  					}
		  					
		  					$('.day_'+day+' :button:eq(0)').val('휴진취소');
		  					$('.day_'+day+' :button:eq(1)').hide();					
		  				}
	           	  }
	        })	;
		}
		
		function setHoliday() {
			$('#calendar :button.set_day').each(function() {
				$(this).click(function() {
					if ($('#gubun') && !$('#gubun').val()) {
						alert('구분(지점)을 선택하여 주세요.');
						return false;
					}			

					var Tid = $(this).attr('id').replace("day_", "");
					var Tidori = $(this).attr('id').replace("day_", "");
					var TidArr = Tid.split("-");
					if(TidArr[2].length ==1){
						Tid =TidArr[0]+'-'+TidArr[1]+'-0'+TidArr[2]; 
					}					
					
					var param = {};
					
					if ($(this).val() == '휴진취소') {
						
						param.date = Tid;
						param.time = "day";
						param.gubun = $('#gubun').val();
						
						$.ajax({  
				               url      		 : "/admin/interface/deleteHoliday"
				              ,data 			 : param
				              ,type    		 : "POST"
				              ,dataType 	 : "json"
				              ,success  : function(data) {				            	  
									if (data.resultCode == "Y") {
									        		 
										$('#day_'+Tidori).val('휴진설정');
										$('#time_'+Tidori).show();
									} else {
										alert('취소에 실패하였습니다. 문의');
									}
									
									setHolidayTime();
				           	  }
				        })	;				
					} else {
						
						param.date = Tid;
						param.time = "day";
						param.gubun = $('#gubun').val();
						$.ajax({  
				               url      		 : "/admin/interface/insertHoliday"
				              ,data 			 : param
				              ,type    		 : "POST"
				              ,dataType 	 : "json"
				              ,success  : function(data) {				            	  
				            	  if (data.resultCode == "Y") {
										$('#day_'+Tidori).val('휴진취소');
										$('#time_'+Tidori).hide();
									} else {
										alert('등록에 실패하였습니다. 문의');
									}
				            	  
				            	  setHolidayTime();
				           	  }
				        })	;
					}
				});
			});
		}
		
		
		function setHolidayTime() {
			
			$('#calendar :button.set_time').click(function() {

				if ($('#gubun') && !$('#gubun').val()) {
					alert('구분(지점)을 선택하여 주세요.');
					return false;
				}			

				$('#time_list').show();
				var Tid = $(this).attr('id').replace("time_", "");
				var gubun = $('#gubun').val();
				var week_value = $(this).attr('week');

				$('#time_list h4').html(Tid +"일자 근무 불가능 시간대 설정");

				if (week_value == 6) {
					var shift = $('#weekend').val().split(',');
					var breaktime = $('#weekend_breaktime').val().split(',');
				} else if (week_value == 0) {
					var shift = $('#weekday0').val().split(',');
					var breaktime = $('#weekday_breaktime0').val().split(',');
				} else {
					var shift = $('#weekday').val().split(',');
					var breaktime = $('#weekday_breaktime').val().split(',');
				}
				var start_time = parseInt(shift[0]);
				if(week_value == 6) {
					var end_time = parseInt(shift[1]);
					var lunchTime_start = parseInt(breaktime[0]);
					var lunchTime_end = parseInt(breaktime[1]);
				} else if(week_value == 0) {
					var end_time = parseInt(shift[1]);
					var lunchTime_start = parseInt(breaktime[0]);
					var lunchTime_end = parseInt(breaktime[1]);
				} else {
					var end_time = shift[1];
					var lunchTime_start = parseInt(breaktime[0]);
					var lunchTime_end = parseInt(breaktime[1]);
				}
				var timeLi ="";
				var TidArr = Tid.split("-");
				var Tidym = TidArr[0]+"-"+TidArr[1];
				
				var param = {};
				param.date_full = Tid;
				param.gubun = gubun;
				
				$.ajax({  
		               url      		 : "/admin/interface/selectHolidayList"
		              ,data 			 : param
		              ,type    		 : "POST"
		              ,dataType 	 : "json"
		              ,success  : function(data) {	
		            	  			            	  
		            	  for(var i=start_time; i<=end_time; i++) {
							if (i < lunchTime_start || i >= lunchTime_end) {
								var class_on1 = '';
								var class_on2 = '';
								var txtflag1 = '';
								var txtflag2 = '';
								if (data.rows.length > 0) {
									for( var j = 0; j < data.rows.length; j++ ) {
										
										if( data.rows[j].time == (i+":00") ) txtflag1 = '(불가능)';
										if( data.rows[j].time == (i+":30") ) txtflag2 = '(불가능)';
										
									}										
								}

								timeLi += "<li"+class_on1+" settime='"+i+":00'>"+ i +"시 00분"+txtflag1+"</li>";
								timeLi += "<li"+class_on2+"  settime='"+i+":30'>"+ i +"시 30분"+txtflag2+"</li>";
							}
						}
		            	  
						$('#time_list ul').html(timeLi);
						
						$('#time_list li').each(function() { 
							if ($(this).html().indexOf('불가능') == -1)
							{
								$(this).html('<a href=\"javascript:setTime(\''+Tid+"|"+$(this).attr('settime')+"|insert"+'\')\">'+$(this).html()+'</a>');
							} else {
								$(this).html('<a href=\"javascript:setTime(\''+Tid+"|"+$(this).attr('settime')+"|delete"+'\')\">'+$(this).html()+'</a>');
							}
						}); 
						
		           	  }
		        })	;
			});
		}
		
		function setTime(timestring) {
			
			var timeVal = timestring.split("|");
			
			var param = {};
			param.date = timeVal[0];
			param.time = timeVal[1];
			
			if( timeVal[2] == "insert" ) {
				
				$.ajax({  
		               url      		 : "/admin/interface/insertHoliday"
		              ,data 			 : param
		              ,type    		 : "POST"
		              ,dataType 	 : "json"
		              ,success  : function(data) {	
		            	  $('#time_list li').each(function() { 
		  					if ($(this).attr('settime').indexOf(timeVal[1]) == 0) {
		  						var time = timeVal[1].split(':');
		  						$(this).html('<a href=\"javascript:setTime(\''+timeVal[0]+"|"+$(this).attr('settime')+"|delete"+'\')\">'+time[0]+'시 '+time[1]+'분(불가능)</a>');
		  					}		  					
		  				});
		            	  
		              }
				});
				
			} else {
				
				$.ajax({  
		               url      		 : "/admin/interface/deleteHoliday"
		              ,data 			 : param
		              ,type    		 : "POST"
		              ,dataType 	 : "json"
		              ,success  : function(data) {	
		            	  $('#time_list li').each(function() { 
		  					if ($(this).attr('settime').indexOf(timeVal[1]) == 0) {
		  						var time = timeVal[1].split(':');
		  						$(this).html('<a href=\"javascript:setTime(\''+timeVal[0]+"|"+$(this).attr('settime')+"|insert"+'\')\">'+time[0]+'시 '+time[1]+'분</a>');
		  					}
		  				});
		        		
		              }
				
				});
				
			}
			
		}

   	</script>
</body>
</html>