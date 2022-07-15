$(function () {
	$('.btn_select').on('click',function(e){
		//e.preventDefault();
		$('#reservationPop').css('display','block');
	});
	$('.btn_complete').on('click',function(e){
		$('#reservationPop').css('display','block');
	});	
	$('#reservationPop .btn_close').on('click',function(e){
		//e.preventDefault();
		$('#reservationPop').css('display','none');
	});
	// 1차 카테고리
	/*$('#reser_cate').on('change',function(){
		$.post("/board/skin/reservation/ajax.cate2_list.php", {
			code: $(this).val()
		}, function(data,status){
			var optHtml='';
			optHtml += '<option value="">선택하세요</option>';
			for(var i=0; i<data.cate_name.length; i++) {
				optHtml += '<option value="'+data.code[i]+'">'+data.cate_name[i]+'</option>';
			}
			$('#reser_field option').remove();
			$('#reser_field').append(optHtml);
		});		
	});*/
	
	$('#reser_jijeom').on('change',function(){
		getJijeomTime($(this).val());
		getHolidayList();
		$('#str_date').val('');
		$('#str_time').val('');
		$('#time_am').html('<li>예약일을 선택해 주세요.</li>');
		$('#time_pm').html('');
		$('.btn_reser').removeClass('btn_reser_active');
	});	
	
	if ($('#reser_jijeom').length == 0) {
		//getHolidayList();
	}
});

	function calendarr(oo,aa,bb){
        var date = new Date(aa,parseInt(oo)-1,bb);
		var date_now = new Date();
        var year = date.getFullYear();
        var day = date.getDate();
        var month = date.getMonth();
		
		var day_now = date_now.getDate();
        var month_now = date_now.getMonth();
        var year_now = date_now.getFullYear();
		
		var month_nn=""+month_now;
		if(month_nn.length==1) month_nn="0"+month_nn;
		var day_nn=""+(day_now+1);
		if(day_nn.length==1) day_nn="0"+day_nn;
		var onul=year_now+""+month_nn+""+day_nn;

		var month_neil=""+month;
		if(month_neil.length==1) month_neil="0"+month_neil;
		var day_neil="";
		var neil=year+""+month_neil;
		var neill="";

		var month_gogo=""+(month+1);
		if(month_gogo.length==1) month_gogo="0"+month_gogo;

		var pre_mon=parseInt(oo)-1;
		var nex_mon=parseInt(oo)+1;
		var pre_year=year;
		var nex_year=year;
		if(pre_mon < 1){
			pre_mon=12;
			pre_year=parseInt(year)-1;
		}
		if(nex_mon > 12){
			nex_mon=1;
			nex_year=parseInt(year)+1;
		}

        if(year<=200){
                year += 1900;
        }
        months = new Array('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');
        days_in_month = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
        if(year%4 == 0 && year!=1900){
                days_in_month[1]=29;
        }
        total = days_in_month[month];
        var date_today = year+'-'+months[month];
        
		beg_j = date;
        beg_j.setDate(1);
        if(beg_j.getDate()==2){
                beg_j=setDate(0);
        }
        beg_j = beg_j.getDay();
		        
		var gomul="";
		gomul="<div class='calendarWrap'><div class='headBox'><p class='wrap'><img src='/common/images/reservation/btn_prev.png' class='btn_prev' onclick=\"calendarr('"+pre_mon+"','"+pre_year+"','"+day+"');\" style='cursor:pointer;'>&nbsp;<span class='month'>"+date_today+"</span>&nbsp;<img src='/common/images/reservation/btn_next.png' class='btn_next' onclick=\"calendarr('"+nex_mon+"','"+nex_year+"','"+day+"');\" style='cursor:pointer;'></p></div>";
        gomul+="<div class='inbox'><table id='calendar'><colgroup><col width='14%'><col width='14%'><col width='14%'><col width='14%'><col width='14%'><col width='14%'><col width='14%'></colgroup><thead><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr></thead><tbody><tr>";
        week = 0;
        for(i=1;i<=beg_j;i++){
                //gomul+='<td>'+(days_in_month[month-1]-beg_j+i)+'</td>';
				gomul+='<td>&nbsp;</td>';
                week++;
        }
		var year = year.toString();
		year_af = year.substring(0,3)-190;
		year_af = year_af + year.substring(3,4);
        for(i=1;i<=total;i++){
                if(week==0){
                        gomul+='<tr>';
                }
                if(day==i && month==month_now && year==year_now){
                        gomul+='<td class="todayOn day_'+i+'"><div><div class="reser_none">'+i;
						if(i.length==1) i="0"+i;
						//gomul+="<div class='btn_reser' style='display:none;'><a href=\"javascript:void(0)\" onclick=\"loadData('"+year+"','"+month_gogo+"','"+i+"','"+week+"','"+(date_now.getHours()+2)+"')\">"+i+"</a></div>";
						gomul+='</div></div></td>';
                }else{
						neill="";
						neill=neil;
						day_neil=""+i;
						if(day_neil.length==1) day_neil="0"+day_neil;
						neill=neill+""+day_neil;

                        
						if(parseInt(onul) <= parseInt(neill)){
							var is_today = month_gogo+day_neil;
							// 공휴일에도 근무가능
							gomul+='<td class="day_'+i+'"><div>'+i;
							gomul+="<div class='btn_reser' style='display:block;'><a href=\"javascript:void(0)\" onclick=\"loadData('"+year+"','"+month_gogo+"','"+day_neil+"','"+week+"','1')\">"+i+"</a></div>";
						}else{
							gomul+='<td class="day_'+i+'"><div><div class="reser_none">'+i;
							gomul+='</div>';
						}
						gomul+='</div></td>';
                }
                week++;
                if(week==7){
                        gomul+='</tr>';
                        week=0;
                }
        }
        for(i=1;week!=0;i++){
                //gomul+='<td>'+i+'</td>';
				gomul+='<td>&nbsp;</td>';
                week++;
                if(week==7){
                        gomul+='</tr>';
                        week=0;
                }
        }
        gomul+='</tbody></table></div></div>';
		document.getElementById('zeze').innerHTML=gomul;
		getHolidayList();
        return true;
	}

	function setTime(time) {
		$('#str_time').val(time);
		if ($('#click_num').length>=1) {
			$('#click_num').val(eval($('#click_num').val())+1);
		}
	}

	function getHolidayList() {
		
		var param = {};
		param.date = $('.month').html();
		param.time = "day";
		param.gubun = $('#gubun').val();
		
		//$('.btn_reser').hide();
		
		$.ajax({
			url:"/consult/reservation/holidayCheck"
			,data:param
			,type:"POST"
			,success:function(data){
				var j=0;
				for(var i=0; i<data.length; i++) {
					j++;
					if (data[i]==false) {
						$('.day_'+j+' .btn_reser').show();
					}		
				}
				//return;
			}
		});
		//return ;
		
		/*$.post("/counsel/reservation/holidayCheck", {
			date: $('.month').html(),
			gubun: $('#reser_jijeom').val()
		}, function(data,status){
			var j=0;
			for(var i=0; i<data.state.length; i++) {
				j++;
				if (data.state[i]==false) {
					$('.day_'+j+' .btn_reser').show();
				}
			}
		});*/
	}

	function getHolidayTimeList(date) {
		$.post("/consult/reservation/holidayCheck", {
			date: date
		}, function(data,status){
			return data;
		});
	}

	function cateChk() {
		var chktxt = "";
		var chknum = 0;
		$(".reser_field input[type='checkbox']").each(function() {
			if ($(this).is(":checked") == true) {
				chktxt += '<li>'+$(this).attr('title')+'</li>';
			}
		});
		$('#catelist').html(chktxt);
		$('#reservationPop').css('display','none');
	}

	/*
	예약시간
	*/
	function loadData( i_Year, i_Month, i_Day, week_value, gap) {
		$.post("/consult/reservation/interface/time", {
			//date: i_Year+'-'+i_Month+'-'+i_Day
		}, function(data,status){
			data = data.rows;
			
			$('#weekday_1').val(data.weekday_1);
			$('#weekday_2').val(data.weekday_1);
			$('#weekday_3').val(data.weekday_1);
			$('#weekday_4').val(data.weekday_1);
			$('#weekday_5').val(data.weekday_1);
			$('#weekday_6').val(data.weekday_6);
			$('#weekday_0').val(data.weekday_0);
			$('#weekday1_breaktime').val(data.weekday1_breaktime);
			$('#weekday2_breaktime').val(data.weekday1_breaktime);
			$('#weekday3_breaktime').val(data.weekday1_breaktime);
			$('#weekday4_breaktime').val(data.weekday1_breaktime);
			$('#weekday5_breaktime').val(data.weekday1_breaktime);
			$('#weekday6_breaktime').val(data.weekday6_breaktime);
			$('#weekday0_breaktime').val(data.weekday0_breaktime);
			$('#weekday1_term').val(data.weekday1_term);
			$('#weekday2_term').val(data.weekday1_term);
			$('#weekday3_term').val(data.weekday1_term);
			$('#weekday4_term').val(data.weekday1_term);
			$('#weekday5_term').val(data.weekday1_term);
			$('#weekday6_term').val(data.weekday6_term);
			$('#weekday0_term').val(data.weekday6_term);
			
			/*$('#weekday_1').val('09:00,17:30');
			$('#weekday_2').val('09:00,17:30');
			$('#weekday_3').val('09:00,17:30');
			$('#weekday_4').val('09:00,17:30');
			$('#weekday_5').val('09:00,17:30');
			$('#weekday_6').val('09:00,17:30');
			$('#weekday_0').val('09:00,17:30');
			$('#weekday1_breaktime').val('12:00,14:00');
			$('#weekday2_breaktime').val('12:00,14:00');
			$('#weekday3_breaktime').val('12:00,14:00');
			$('#weekday4_breaktime').val('12:00,14:00');
			$('#weekday5_breaktime').val('12:00,14:00');
			$('#weekday6_breaktime').val('12:00,14:00');
			$('#weekday0_breaktime').val('12:00,14:00');
			$('#weekday1_term').val('30');
			$('#weekday2_term').val('30');
			$('#weekday3_term').val('30');
			$('#weekday4_term').val('30');
			$('#weekday5_term').val('30');
			$('#weekday6_term').val('30');
			$('#weekday0_term').val('30');*/
			
			// 시간 설정
			$('.btn_reser').removeClass('btn_reser_active');
			if ($('.month').text() == i_Year+'-'+i_Month) {
				$('.day_'+parseInt(i_Day)).find('.btn_reser').addClass('btn_reser_active');
			}

			$('#str_date').val(i_Year+"-"+i_Month+"-"+i_Day);
			var Tid = i_Month+"-"+i_Day;
			//if (Tid.indexOf('01-01') > -1 || Tid.indexOf('03-01') > -1 || Tid.indexOf('05-05') >-1 || Tid.indexOf('06-06') >-1 || Tid.indexOf('08-15') >-1 || Tid.indexOf('10-03') >-1 || Tid.indexOf('10-09') >-1  || Tid.indexOf('12-25') >-1) {
			//	var shift = $('#holiday_work').val().split(',');
			//	var breaktime = $('#holiday_work_breaktime').val().split(',');
			//} else {
				var shift = $('#weekday_'+week_value).val().split(',');
				var breaktime = $('#weekday'+week_value+'_breaktime').val().split(',');
			//}
			var start_time = shift[0];
			var end_time = shift[1];
			var stime = start_time.split(":");
			var etime = end_time.split(":");

			var start_hour = stime[0];
			var start_min = stime[1];
			var end_hour = etime[0];
			if (breaktime[0]=='' || breaktime[0] == undefined) {
				var break_stime = '23';
				var break_etime = '23';
			} else {
				var break_stime = breaktime[0];
				var break_etime = breaktime[1];
			}
			var min = "";
			var pmLi = "";
			var amLi = "";
			var term=$('#weekday'+week_value+'_term').val();		// 시간별 term

			if ($('#click_num').length>=1) {
				$('#click_num').val(eval($('#click_num').val())+1);
				if ($('#click_num').val()>=2) {
					$('#str_time').val('');
				}
			}
			$.post("/consult/reservation/interface/hospitalReservationChk", {
				date: $('#str_date').val(),
				//gubun: $('#reser_jijeom').val()
			}, function(data,status){
				var rows = data.rows;
				data = JSON.stringify(data.rows);
				var pmLi = "";
				var amLi = "";
				for(var i=start_hour; i<=end_hour; i++) {
					for(var j=start_min; j<=30; j=j+30) {
						min = (j == 0) ? '00' : '30';
						if (i+':'+min < break_stime || i+':'+min >= break_etime) {
							var class_on = '';
							var txtflag = '';
							if (i <= 12) {
								if (data) {
									if (data.indexOf(i+":"+min) > -1) { txtflag = '(불가능)'; class_on = 'none'; }
								}
								amLi += "<li class='"+class_on+"' data-time='"+i+"' data-fulltime='"+i+":"+min+"' settime='"+i+":"+min+"'><span class='time'>"+ i +":"+min+"</span>"+ txtflag +"</li>";
							} else {
								var t = i - 12;
								if (data) {
									if (data.indexOf(t+":"+min) > -1) { txtflag = '(불가능)'; class_on = 'none'; }
								}
								pmLi += "<li class='"+class_on+"' data-time='"+i+"' data-fulltime='"+i+":"+min+"' settime='"+t+":"+min+"'><span class='time'>"+ t +":"+min+"</span>"+ txtflag +"</li>";
							}
						}
						if (end_time == i+':'+min) break;
					}
					start_min = parseInt('00');
				}		// End of for
				if (data.indexOf("day") > -1) {
					amLi = "<li>금일은 휴진일입니다.<br/>예약가능한 날짜를 선택해 주세요. </li>";
					pmLi = "";
					$('#time_am').html(amLi);
					$('#time_pm').html(pmLi);
					return;
				}
				$('#time_am').html(amLi);
				$('#time_pm').html(pmLi);

				// term에 따른 시간 remove
				if (term>=1 && term<29) {
					$('.timeSelect li').each(function(i) {
						if (i != 0) {
							var time_split = $(this).attr('data-fulltime').split(':');
							var hour = parseInt(time_split[0])+term;
							var min = time_split[1];
							if ($('.timeSelect li:eq(0)').attr('data-fulltime').indexOf(min) == -1)
							{
								$(this).remove();
							}
						}
					});
				}
				if (term==2) {
					var interval=1;
					var first_time = parseInt($('.timeSelect li:eq(0)').attr('data-time'));
					$('.timeSelect li').each(function() {
						$('.timeSelect li').each(function() {
							if ($(this).attr('data-time') == parseInt(first_time+interval)) {
								$(this).remove();
							}
						});
						interval = interval+2;
					});
				}

				$('.timeSelect li').each(function() { 
					if ($(this).html().indexOf('불가능') == -1)
					{
						$(this).html('<a href=\"javascript:setTime(\''+$(this).attr('settime')+'\')\">'+$(this).html()+'(예약가능)</a>');
					}
				});
				$('.timeSelect li').click(function() {
					$('.timeSelect li').each(function() { $(this).removeClass('on'); });
					$(this).addClass('on');
				});
				if ($('#act').val() != "edit_ok") {
					$('#str_time').val('');
				} else {
					$('.timeSelect li').each(function() {
						if ($(this).attr('settime') == $('#str_time').val()) {
							$(this).addClass('on');
						}
					});
				}
			});
		});
	}

	/*function getJijeomTime(val) {
		$.post("/counsel/reservation/interface/time", {
			idx: val
		}, function(data,status){
			$('#weekday_1').val(data.weekday_1);
			$('#weekday_2').val(data.weekday_2);
			$('#weekday_3').val(data.weekday_3);
			$('#weekday_4').val(data.weekday_4);
			$('#weekday_5').val(data.weekday_5);
			$('#weekday_6').val(data.weekday_6);
			$('#weekday_0').val(data.weekday_0);
			$('#weekday1_breaktime').val(data.weekday1_breaktime);
			$('#weekday2_breaktime').val(data.weekday2_breaktime);
			$('#weekday3_breaktime').val(data.weekday3_breaktime);
			$('#weekday4_breaktime').val(data.weekday4_breaktime);
			$('#weekday5_breaktime').val(data.weekday5_breaktime);
			$('#weekday6_breaktime').val(data.weekday6_breaktime);
			$('#weekday0_breaktime').val(data.weekday0_breaktime);
			$('#holiday_yn').val(data.holiday_yn);
			$('#holiday_work').val(data.holiday_work);
			$('#holiday_work_breaktime').val(data.holiday_work_breaktime);
		});
	}*/