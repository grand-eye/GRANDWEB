<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/admin/inc/admin_header.jsp"%>

</head>
<body id="baordBody">

	<div class="easyui-panel" title="DM관리 > 예약안내 알림톡 보내기" style="height:10px;padding:5px;border:0;"  data-options="iconCls:'icon-redo'"> 
    </div>    
	<div class="easyui-panel" style="height: auto; padding: 5px; border: 0;">
		<table id="dg${_prefix}" title="예약안내 알림톡 보내기"  class="" style="width: 100%; height: auto">
		</table>
	</div>
	
	<div id="dg${_prefix}" style="height: auto;padding:5px;">
		<div class="panel-header"><div class="panel-title">예약안내 알림톡 보내기</div></div>
		<div id="smsMsgSend${_prefix}" class="board_sms_area" ></div>
	</div>

	<%@ include file="/WEB-INF/views/admin/inc/admin_common_js.jsp"%> 

	<script type="text/javascript">
	var html = "";
	var text = "<spring:message code='at.msg.5'></spring:message>";
	var text2 = "<spring:message code='at.msg.6'></spring:message>";
	var text3 = "<spring:message code='at.msg.7'></spring:message>";
	var text4 = "<spring:message code='at.msg.8'></spring:message>";
	var text5 = "<spring:message code='at.msg.9'></spring:message>";

    		/** 전역 Plugin를 만들어야 한다.**/
    		var ${_prefix} = {
    				
					_data : new Array() ,

					init : function(param){

						this.dataload( param  );

					}
					,
					
					dataload  : function(param){
    	    				
							html += "<div id='smsSendBox'>";				
							html += "	<form name='form_sms' method='post'>";

							html += "	    &nbsp;&nbsp;<select name='set_msg_type' id='set_msg_type'><option value='A'>상담직후(미예약)</option><option value='B'>내원 하루전날</option><option value='C'>신환예약당일</option><option value='D'>레이니데이</option><option value='E'>레드데이</option></select> <br /><br />";


							html += "		<input type=hidden name=send_list value=''>";
							html += "		<div class='phoneBox1' style='background-color:#fff;float:left;width:350px;height:450px;padding-top:0px;padding-left:10px'>";	
							html += "			<textarea name='wr_message' id='wr_message' style='width:100%;height:400px;padding:0;padding-left:5px'>"+text+"</textarea>";
							html += "		</div>";
							
							
							<!-- smsInfoBox -->
							html += "		<div class='smsInfoBox' style='width:500px'>";
							html += "				<div class='item box'>";
							html += "					<p class='row'>";
							html += "						<label for='hp_name' style='width:80px'>받는사람 :</label>";
							html += "						<input type=text id='i_phone' name='i_phone' class='input_t01' value='' placeholder='-를 제외한 숫자만 입력하세요.' maxlength=20  style='width:300px' >";
							html += "					</p>";
							html += "					<p class='row'>";
							html += "						<label for='hp_name' style='width:80px'>고객명 :</label>";
							html += "						<input type=text id='i_name' name='i_name' class='input_t01 at_text' value='' placeholder='' maxlength=20  style='width:300px' >";
							html += "					</p>";
							html += "					<p class='row'>";
							html += "						<label for='hp_name' style='width:80px'>예약날짜 :</label>";
							html += "						<input type=text id='i_date' name='i_date' class='input_t01 at_text' placeholder='입력예제 : 2020-01-01(수)' style='width:300px' >";
							html += "					</p>";
							html += "					<p class='row'>";
							html += "						<label for='hp_name' style='width:80px'>예약시간 :</label>";
							html += "						<input type=text id='i_time' name='i_time' class='input_t01 at_text' placeholder='입력예제 : 14:00경 ' style='width:300px' >";
							html += "					</p>";
							html += "				</div>";
							html += "				<div class='item'>";
							html += "					<div id='help01'>";
							html += "						<div id='csshelp1'><div id='csshelp2'><div id='csshelp3' style='line-height:20px;'>";
							html += "						<p>받는 사람 목록 중 중복되는 번호가 있으면 최초 하나만 발송하고 나머지 중복되는 번호는 발송목록에서 제외합니다.";
							html += "						중복되는 번호가 있는지 확인하시겠습니까?</p>";
							html += "						<input type=button value='중복번호 확인' onclick='overlap_check()' class='sbtn gray'>";
							html += "						<a href='#' class='sbtn gray btn_close'>닫기</a>";
							html += "						</div></div></div>";
							html += "					</div>	";	
							html += "				</div>";
							html += "				<input type=button class='sbtn lager gray full atSendBtn'  value='전송하기' onfocus='this.blur()' style='padding:0px'>";		
							html += "				<br /><br />";
							html += "				<iframe name='ifrSendResult' id='ifrSendResult' style='width:100%;height:100px;border:1px solid #e0e0e0'></iframe>";
							html += "		</div>";
							<!-- //smsInfoBox -->
							
							html += "	</form>";
							html += "</div>";
							
							$("smsMsgSend${_prefix}").html(html);
							$(".board_sms_area").append(html);
							
							
							$("#set_msg_type").on("change", function(){
								
								if ( $(this).val() == "A")
								{
									$("#wr_message").val(text);
									$("#i_date").hide();
									$("#i_time").hide();
								}
								else if($(this).val() == "B")
								{
									$("#wr_message").val(text2);
									$("#i_date").show();
									$("#i_time").show();
								}
								else if($(this).val() == "C")
								{

									$("#wr_message").val(text3);
									$("#i_date").show();
									$("#i_time").show();
								}
								else if($(this).val() == "D")
								{

									$("#wr_message").val(text4);
									$("#i_date").show();
									$("#i_time").show();
								}
								else if($(this).val() == "E")
								{

									$("#wr_message").val(text5);
									$("#i_date").show();
									$("#i_time").show();
								}
							});


							$(".at_text").off("keyup").on("keyup", function(){
									/**
									var nameTag = $(this).prop("name");
									var messageCng = text;

									messageCng = messageCng.replace('{i_name}', $("input[name='i_name']").val() );
									messageCng = messageCng.replace('{i_date}', $("input[name='i_date']").val() );
									messageCng = messageCng.replace('{i_time}', $("input[name='i_time']").val() );

									$("#wr_message").val(messageCng);								
									**/
							});
							
							

							$(".atSendBtn").off("click").on("click", function(){

								var i_phone = $("#i_phone").val();
								var i_name  = $("#i_name").val();
								var i_date  = $("#i_date").val();
								var i_time  = $("#i_time").val();
								
								if (i_phone=="")
								{
									alert("받는 사람 휴대폰번호를 -를 제외하고 숫자만 입력하세요.");
									return;
								}

								if (i_name=="")
								{
									alert("고객명을 입력하세요.");
									return;
								}

								if ( $("#set_msg_type").val() == "B"  || $("#set_msg_type").val() == "C" || $("#set_msg_type").val() == "D" || $("#set_msg_type").val() == "E")
								{
									if (i_date=="")
									{
										alert("예약날짜를 입력하세요");
										return;
									}

									if (i_time=="")
									{
										alert("예약시간을 입력하세요.");
										return;
									}


								//var iUrl="https://program.grand.kr/dhr/_sendAt2.php?i_phone="+i_phone+"&i_name="+encodeURIComponent(i_name)+"&i_date="+encodeURIComponent(i_date)+"&i_time="+encodeURIComponent(i_time);
									if ($("#set_msg_type").val() == "B")
									{
										var frmData = document.form_sms ;
										frmData.target = "ifrSendResult" ;
										frmData.action = "https://program.grand.kr/dhr/_sendAt6.php" ;
										frmData.submit() ;
									}

									if ($("#set_msg_type").val() == "C")
									{
										var frmData = document.form_sms ;
										frmData.target = "ifrSendResult" ;
										frmData.action = "https://program.grand.kr/dhr/_sendAt7.php" ;
										frmData.submit() ;

									}
									
									if ($("#set_msg_type").val() == "D")
									{
										var frmData = document.form_sms ;
										frmData.target = "ifrSendResult" ;
										frmData.action = "https://program.grand.kr/dhr/_sendAt8.php" ;
										frmData.submit() ;

									}
									
									if ($("#set_msg_type").val() == "E")
									{
										var frmData = document.form_sms ;
										frmData.target = "ifrSendResult" ;
										frmData.action = "https://program.grand.kr/dhr/_sendAt9.php" ;
										frmData.submit() ;

									}
										

									$(".atSendBtn").hide();
									
									setTimeout(function(){
										//$("#wr_message").val(_exec_message);
										$("#i_phone").val("");
										$("#i_name").val("");
										$("#i_date").val("");
										$("#i_time").val("");

										$(".atSendBtn").show();
									},1000);
								}
								else
								{

									var frmData = document.form_sms ;
									frmData.target = "ifrSendResult" ;
									frmData.action = "https://program.grand.kr/dhr/_sendAt5.php" ;
									frmData.submit() ;

									$(".atSendBtn").hide();
									
									setTimeout(function(){
										//$("#wr_message").val(_exec_message);
										$("#i_phone").val("");
										$("#i_name").val("");
										$("#i_date").val("");
										$("#i_time").val("");

										$(".atSendBtn").show();
									},1000);

								}


								



							});
					
							
    				}					
    		};    		
			
    		/** 실제 로직화 구현**/
    		$(document).ready(function(){
				var param = {};
				${_prefix}.init( param );
				$("#i_date").hide();
				$("#i_time").hide();
				
    		});
    		
    </script>
    
</body>
</html>
