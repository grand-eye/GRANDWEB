<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
</head>
<body>
<table width="800" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td align="center" style="padding-top:25px;"><img src="C:\\project\\GRAND\\src\\main\\webapp\\resources\\front\\mail\\images/email_img01.gif" alt="회원가입안내" /></td>
	</tr>
	<tr>
		<td align="center" style="padding-top: 15px;">
			<table width="100%" border="0" cellspacing="10" cellpadding="0" style="background:#ecedf1;" bgcolor="#ecedf1">
				<tr>
					<td align="left">
						<div style="font-size:18px; font-weight:bold; color:#333; text-align:center;">회원가입완료 안내</div></td>
				</tr>
				<tr>
					<td align="center" valign="top" style="background:#FFF; border-bottom:1px solid #e1e2e6;" bgcolor="#ffffff">
						<table border="0" cellspacing="0" cellpadding="0" width="760" height="301">
							<tr>
								<td valign="top" style="padding-top: 20px; border-bottom:1px solid #e1e2e6;">
									<!------>
									<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td height="40" align="left" style="color:#686868; font-weight:bold; color:#465daa; font-size: 14px; line-height:140%;"> @ETC1@</td>
										</tr>
										<tr>
											<td height="50" align="left">
												<div style="color:#141414; font-size: 12px; font-weight:normal; line-height:140%;">@ETC2@</div>
											</td>
										</tr>
										<tr>
											<td height="100" align="center" valign="middle">
												<!------>
												<table border="0" cellspacing="0" cellpadding="0" width="500" style="border:1px solid #e0e0e0;">
													<tr>
														<td width="40%" bgcolor="#f5f5f5" style="padding:7px; color:#000; font-weight:bold; font-size:12px;">성명</td>
														<td width="60%" style="padding:7px; color:#686868; font-size: 12px; padding-left:10px;">@NAME@</td>
													</tr>
													<tr>
														<td width="40%" bgcolor="#f5f5f5" style="padding:7px; color:#000; font-weight:bold; font-size:12px;">아이디</td>
														<td width="60%" style="padding:7px; color:#686868; font-size: 12px; padding-left:10px;">@ID@</td>
													</tr>
												</table>
												<!------>
											</td>
										</tr>
									</table>
									<div style="text-align:center; padding:20px 0 40px 0"><a href="@HOMEURL@" target="_blank" ><img src="@HOMEURL@/mail/images/btn_homepage.gif" alt="" border="0" /></a></div>
									<!------>
								</td>
							</tr>
							<tr>
								<td style="padding:20px 0; font-size:12px; color:#999; text-align:center; line-height:140%;">본메일은 발신전용 메일이며 회신을 통한 문의 및 수신거부는 처리되지 않습니다. <br />메일수신을 원하지 않을경우 홈페이지의 회원정보수정 메뉴에서 E-mail 수신여부를 변경하여 주세요.</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="font-size:12px; color:#999; text-align:left; padding:10px 10px 20px; line-height:140%;">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
							@footer@
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
