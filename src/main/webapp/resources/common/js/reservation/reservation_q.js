$(function () {
	$('#reser_jijeom').on('change',function(e){
		getJijeomTime($(this).val());
		getHolidayList();
		$('#str_date').val('');
		$('#str_time option').remove();
		$('#str_time').append('<option value="">예약일자를 먼저 선택하여 주세요.</option>');
	});
	
	$('.btn_calendar').on('click',function(e){
		$('#zeze').toggle();
	});
	$('#str_date').on('click',function(e){
		$('#zeze').toggle();
	});

	$('.q_btn_more').on('click',function(e){		
		e.preventDefault();
		$('.q_agree_box').css('display','block');
	});
	$('.q_agree_box .btn_close02').on('click',function(e){		
		e.preventDefault();
		$('.q_agree_box').css('display','none');
	});
	if ($('#reser_jijeom').length == 0) {
		getHolidayList();
	}
});

	function reservationSubmit_q() {
		var chknum = 0;
		if( !document.frmQuick.str_date.value ) {
			alert('예약일자를 선택해 주세요.');
			document.frmQuick.str_date.focus();
			return false;
		}
		if( !document.frmQuick.str_time.value ) {
			alert('예약시간을 선택해 주세요.');
			document.frmQuick.str_time.focus();
			return false;
		}
		if( !$('#quick_name').val()) {
			alert('이름을 입력해 주세요.');
			$('#quick_name').focus();
			return false;
		}
		if( !$('#quick_mobile2').val()) {
			alert('핸드폰번호를 입력해 주세요.');
			$('#quick_mobile2').focus();
			return false;
		}
		if( !$('#quick_mobile3').val()) {
			alert('핸드폰번호를 입력해 주세요.');
			$('#quick_mobile3').focus();
			return false;
		}
		if ($('#frmQuick input:radio[name=reser_crack]').is(':checked') == false) {
			alert('진료구분을 선택하여 주세요.');
			return false;
		}
		if ($('#quick_agree1').is(":checked") == false)
		{
			alert('개인정보 수집·이용 동의하셔야 합니다.');
			return false;
		}
		if ($('#quick_agree2').is(":checked") == false)
		{
			alert('SMS 수신에 동의하셔야 합니다.');
			return false;
		}
	}

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
		gomul="<div class='calendarWrap'><div class='headBox'><p class='wrap'><img src='/board/skin/reservation/images/btn_prev.png' class='btn_prev' onclick=\"calendarr('"+pre_mon+"','"+pre_year+"','"+day+"');\" style='cursor:pointer;'>&nbsp;<span class='month'>"+date_today+"</span>&nbsp;<img src='/board/skin/reservation/images/btn_next.png' class='btn_next' onclick=\"calendarr('"+nex_mon+"','"+nex_year+"','"+day+"');\" style='cursor:pointer;'></p></div>";
        gomul+="<table id='calendar' border='1'><colgroup><col width='14%'><col width='14%'><col width='14%'><col width='14%'><col width='14%'><col width='14%'><col width='14%'></colgroup><thead><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr></thead><tbody><tr>";
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
                        gomul+='<td class="todayOn day_'+i+'"><div>'+i;
						day_neil=""+i;
						if(day_neil.length==1) day_neil="0"+day_neil;
						if(week!=0) gomul+="<div class='btn_reser' style='display:none;'><a href=\"javascript:void(0)\" onclick=\"loadData('"+year+"','"+month_gogo+"','"+day_neil+"','"+week+"','"+(date_now.getHours()+2)+"')\">"+i+"</a></div>";
						gomul+='</div></td>';
                }else{
						neill="";
						neill=neil;
						day_neil=""+i;
						if(day_neil.length==1) day_neil="0"+day_neil;
						neill=neill+""+day_neil;

                        gomul+='<td class="day_'+i+'"><div>'+i;
						if(parseInt(onul) <= parseInt(neill) && week!=0){
							var is_today = month_gogo+day_neil;
							// 공휴일에도 근무가능
							gomul+="<div class='btn_reser' style='display:none;'><a href=\"javascript:void(0)\" onclick=\"loadData('"+year+"','"+month_gogo+"','"+day_neil+"','"+week+"','')\">"+i+"</a></div>";
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
        gomul+='</tbody></table></div>';
		document.getElementById('zeze').innerHTML=gomul;
		getHolidayList();
        return true;
	}

	function setTime(time) {
		$('#str_time').val(time);
	}
	function getHolidayList() {
		$('.btn_reser').hide();
		
		
		$.ajax({
			url:"/counsel/reservation/holidayCheck"
			,data:null
			,type:"POST"
			,success:function(data){
				console.log(data);
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
		/*$.post("/board/skin/reservation/ajax.holiday_list.php", {
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
		var shift = new Array();

		var breaktime = $('#weekday'+week_value+'_breaktime').val().split(',');
		var shift = $('#weekday_'+week_value).val().split(',');

		if ($('#reser_jijeom').length>=1) {
			if (!$('#reser_jijeom').val()) {
				alert('지점을 선택하여 주세요.');
				return false;
			}
		}

		$('#str_date').val(i_Year+"-"+i_Month+"-"+i_Day);
		var start_time = (parseInt(gap)>= parseInt(shift[0])) ? parseInt(gap) : parseInt(shift[0]);
		var end_time = parseInt(shift[1]);

		var lunchTime_start = parseInt(breaktime[0]);
		var lunchTime_end = breaktime[1];

		$.post("/board/skin/reservation/ajax.holiday_time.php", {
			date: $('#str_date').val(),
			gubun: $('#reser_jijeom').val()
		}, function(data,status){
			var optionHtml = "";
			$('#str_time option').remove();
			for(var i=start_time; i<=end_time; i++) {
				if (i < lunchTime_start || i >= lunchTime_end) {
					var txtflag1 = '';
					var txtflag2 = '';
					var disable1 = '';
					var disable2 = '';
					if (data) {
						if (data.indexOf(i+":00") > -1) { txtflag1 = '(불가능)'; disable1='disabled'; }
						if (data.indexOf(i+":30") > -1) { txtflag2 = '(불가능)'; disable2='disabled'; }
					}
					optionHtml += "<option "+disable1+" value='"+i+":00'>"+ i +"시 00분"+txtflag1+"</option>";
					optionHtml += "<option "+disable2+" value='"+i+":30'>"+ i +"시 30분"+txtflag2+"</option>";
				}
			}
			if (!optionHtml) {
				optionHtml = "<option value=''>금일 예약은 종료되었습니다.</option>";
			}
			$('#str_time').append(optionHtml);
			$('#zeze').hide();
		});
	}

	function getJijeomTime(val) {
		$.post("/board/skin/reservation/ajax.jijeom_time.php", {
			idx: val
		}, function(data,status){
			$('#weekday').val(data.weekday);
			$('#weekend').val(data.weekend);
			$('#weekday_breaktime').val(data.weekday_breaktime);
			$('#weekend_breaktime').val(data.weekend_breaktime);
		});
	}