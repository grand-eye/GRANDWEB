<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/front/inc/header.jsp" %>
</head>
<body>
		<%@ include file="/WEB-INF/views/front/inc/gnb.jsp" %>
	<main>
		<div class="sub nonbenefit">
			<div class="wsize02">
				<h2 class="sec_title">비급여 진료비 안내</h2>
				<p class="sec_desc ta_c">의료법 제 45조 비급여 진료 비용 등의 고지</p>
				<div class="table_box">
					<table>
						<thead>
							<tr>
								<th>분류</th>
								<th>코드</th>
								<th>명칭</th>
								<th>구분</th>
								<th>비용 (원)</th>
								<th>최저 비용 (원)</th>
								<th>최고 비용 (원)</th>
								<th>특이 사항</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>행위료-검사</td>
								<td class="ls0">EZ796</td>
								<td>안구광학단층촬영 (OCT / Ant-OCT)</td>
								<td>단안</td>
								<td class="ls0"></td>
								<td class="ls0">30,000</td>
								<td class="ls0">500,000</td>
								<td>급여인정 기준 외 실시한 경우 비급여</td>
							</tr>
							<tr>
								<td>행위료-검사</td>
								<td class="ls0">EX795</td>
								<td>샤임프러그 사진촬영</td>
								
								<td>단안</td>
								<td class="ls0"></td>
								<td class="ls0">50,000</td>
								<td class="ls0">200,000</td>
								<td></td>
							</tr>
							<tr>
								<td>행위료-검사</td>
								<td class="ls0">EZ799</td>
								<td>간섭에 의한 눈물 지질층 두께 측</td>
								
								<td></td>
								<td class="ls0">80,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>행위료-검사</td>
								<td class="ls0"></td>
								<td>각막이영양증검사</td>
								
								<td>1회</td>
								<td class="ls0">100,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>행위료-검사</td>
								<td class="ls0"></td>
								<td>드림렌즈, 하드렌즈 검사</td>
								
								<td></td>
								<td class="ls0"></td>
								<td class="ls0">50,000</td>
								<td class="ls0">150,000</td>
								<td></td>
							</tr>
							<tr>
							<tr>
								<td>행위료-검사</td>
								<td class="ls0">E7801</td>
								<td>눈의 안축장 길이검사[편측]-레이저 간섭계 이용</td>
								
								<td>단안</td>
								<td class="ls0">30,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td>급여인정 기준 외 실시한 경우 비급여</td>
							</tr>
							<tr>								
								<td>행위료-이학요법료</td>
								<td class="ls0">MZ013</td>
								<td>안구 건조증 치료-마사지 요법</td>
								
								<td>1회</td>
								<td class="ls0">50,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>행위료-이학요법료</td>
								<td class="ls0">MZ015</td>
								<td>안구 건조증 치료-레이저 광선 치료</td>
								
								<td>1회</td>
								<td class="ls0">100,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>행위료-처치 및 수술료 등</td>
								<td class="ls0">SZ666</td>
								<td>자가혈청</td>
								
								<td>1병</td>
								<td class="ls0">50,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>행위료-처치 및 수술료 등</td>
								<td class="ls0"></td>
								<td>결막모반제거</td>
								
								<td>1회</td>
								<td class="ls0"></td>
								<td class="ls0">50,000</td>
								<td class="ls0">100,000</td>
								<td>크기에 따라 다름</td>
							</tr>
							<tr>
								<td>행위료-처치 및 수술료 등</td>
								<td class="ls0"></td>
								<td>컨투라비전</td>
								
								<td>양안</td>
								<td class="ls0">300,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>행위료-처치 및 수술료 등</td>
								<td class="ls0">SX669</td>
								<td>각막교차결합술</td>
								
								<td>양안</td>
								<td class="ls0">300,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>행위료-처치 및 수술료 등</td>
								<td class="ls0">2Z9610001</td>
								<td>시력교정술료-레이저각막절삭성형술(라섹)</td>
								
								<td>양안</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td class="ls0">2,400,000</td>
								<td>수술종류에 따라 다름</td>
							</tr>
							<tr>
								<td>행위료-처치 및 수술료 등</td>
								<td class="ls0">2Z9610001</td>
								<td>시력교정술료-레이저각막절삭성형술(라식)</td>
								
								<td>양안</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td class="ls0">2,500,000</td>
								<td>수술종류에 따라 다름</td>
							</tr>
							<tr>
								<td>행위료-처치 및 수술료 등</td>
								<td class="ls0">2Z9610001</td>
								<td>시력교정술료-클리어뷰 스마일 라식</td>
								
								<td>양안</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td class="ls0">4,000,000</td>
								<td>수술종류에 따라 다름</td>
							</tr>
							<tr>
								<td>행위료-처치 및 수술료 등</td>
								<td class="ls0"></td>
								<td>안내렌즈삽입술</td>
								
								<td>양안</td>
								<td class="ls0"></td>
								<td class="ls0">5,000,000</td>
								<td class="ls0">6,000,000</td>
								<td>수술종류에 따라 다름</td>
							</tr>
							<tr>
								<td>행위료-처치 및 수술료 등</td>
								<td class="ls0"></td>
								<td>추가라섹</td>
								
								<td></td>
								<td class="ls0"></td>
								<td class="ls0">300,000</td>
								<td class="ls0">500,000</td>
								<td></td>
							</tr>
							<tr>
								<td>기타</td>
								<td class="ls0"></td>
								<td>1회용렌즈(T-LENS)</td>
								
								<td>1개</td>
								<td class="ls0">1,0000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>기타</td>
								<td class="ls0"></td>
								<td>렌즈 세척액</td>
								
								<td></td>
								<td class="ls0"></td>
								<td class="ls0">8,000</td>
								<td class="ls0">13,000</td>
								<td>종류,용량에 따라 다름</td>
							</tr>
							<tr>
								<td>기타</td>
								<td class="ls0"></td>
								<td>렌즈 보존액</td>
								
								<td></td>
								<td class="ls0">12,000</td>
								<td class="ls0">13,000</td>
								<td class="ls0"></td>
								<td>종류,용량에 따라 다름</td>
							</tr>
							<tr>
								<td>기타</td>
								<td class="ls0"></td>
								<td>단백질 제거제</td>
								
								<td></td>
								<td class="ls0">7,700</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td>추가 시, 1장 1000원</td>
							</tr>
							<tr>
								<td>치료재료대 - 보장구</td>
								<td class="ls0"></td>
								<td>굴절교정렌즈(하드렌즈)</td>
								
								<td>양안</td>
								<td class="ls0">350,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 보장구</td>
								<td class="ls0"></td>
								<td>굴절교정렌즈(드림렌즈)</td>
								
								<td>양안</td>
								<td class="ls0"></td>
								<td class="ls0">800,000</td>
								<td class="ls0">1,200,000</td>
								<td>치료재료, 할인율에 따라 다름</td>
							</tr>
							<tr>

								<td>치료재료대 - 보장구</td>
								<td class="ls0"></td>
								<td>근시교정 소프트 렌즈(마이사이트 렌즈)</td>
								
								<td>단안</td>
								<td class="ls0"></td>
								<td class="ls0">70,000</td>
								<td class="ls0">80,000</td>
								<td>치료재료, 할인율에 따라 다름</td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0202OZ</td>
								<td>AT TORBI 709M (Toric)</td>
								
								<td>단안</td>
								<td class="ls0">799,530</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>							
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0204EB</td>
								<td>ACRYSOF IQ TORIC NATURAL IOL(T2-T5)</td>
								
								<td>단안</td>
								<td class="ls0">799,530</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0205EB</td>
								<td>IQ Toric (SN6AT6~9)</td>
								
								<td>단안</td>
								<td class="ls0">799,530</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0207LN</td>
								<td>TECNIS EYHANCE IOL</td>
								
								<td>단안</td>
								<td class="ls0">1,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0204HM</td>
								<td>RAYONE (RA0603F)</td>
								
								<td>단안</td>
								<td class="ls0">2,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0201VD</td>
								<td>TECNIS MULTIFOCAL 1-PIECE INTRAOCULAR LENSE(IOL)</td>
								
								<td>단안</td>
								<td class="ls0">2,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
								<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0206LN</td>
								<td>TECNIS SYMFONY TORIC</td>
								
								<td>단안</td>
								<td class="ls0">2,804,150 </td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
								<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0205HM</td>
								<td>Sulcoflex Trifocal</td>
								
								<td>단안</td>
								<td class="ls0">3,000,000 </td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0205OZ</td>
								<td>AT LARA 829MP</td>
								
								<td>단안</td>
								<td class="ls0"> 2,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0203OZ</td>
								<td>AT LISA 839MP</td>
								
								<td>단안</td>
								<td class="ls0"> 2,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0204OZ</td>
								<td>AT LISA TRI TORIC 939M(P)</td>
								
								<td>단안</td>
								<td class="ls0"> 2,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0201TE</td>
								<td>LENTIS MPLUS</td>
								
								<td>단안</td>
								<td class="ls0">4,704,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0204TE</td>
								<td>LENTIS M TORIC</td>
								
								<td>단안</td>
								<td class="ls0">4,704,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0201KU</td>
								<td>FINEVISION, POD F</td>
								
								<td>단안</td>
								<td class="ls0">5,054,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0202KU</td>
								<td>FINEVISION TORIC, POD FT</td>
								
								<td>단안</td>
								<td class="ls0">5,054,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0208EB</td>
								<td>PANOPTIX</td>
								
								<td>단안</td>
								<td class="ls0">5,054,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0200EB</td>
								<td>PANOPTIX TORIC</td>
								
								<td>단안</td>
								<td class="ls0">5,054,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
								<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0209EB</td>
								<td>VIVITY(DFT)</td>
								
								<td>단안</td>
								<td class="ls0">5,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
								<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0210EB</td>
								<td>VIVITY Toric</td>
								
								<td>단안</td>
								<td class="ls0">5,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0208LN</td>
								<td>TECNIS SYNERGY OPTIBLUE IOL</td>
								
								<td>단안</td>
								<td class="ls0">5,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
								<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0209LN</td>
								<td>TECNIS SYNERGY TORIC OPTIBLUE IOL</td>
								
								<td>단안</td>
								<td class="ls0">5,804,150</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0211EB</td>
								<td>Clareon Panoptix</td>
								
								<td>단안</td>
								<td class="ls0">6,799,530</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0212EB</td>
								<td>Clareon Panoptix Toric</td>
								
								<td>단안</td>
								<td class="ls0">6,799,530</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
							<td>치료재료대 - 조절성 인공수정체</td>
								<td class="ls0">BI0203KU</td>
								<td>FINEVISION HP, POD F GF</td>
								
								<td>단안</td>
								<td class="ls0">6,799,530</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0">PDE010001</td>
								<td>영문 일반진단서</td>
								
								<td></td>
								<td class="ls0">20,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0">PDZ010000</td>
								<td>일반진단서</td>
								
								<td></td>
								<td class="ls0">10,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0">PDZ090002</td>
								<td>입퇴원확인서</td>
								
								<td></td>
								<td class="ls0">1,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0">PDZ090007</td>
								<td>진료확인서</td>
								
								<td></td>
								<td class="ls0">1,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0"></td>
								<td>수술확인서</td>
								
								<td></td>
								<td class="ls0">2,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0"></td>
								<td>소견서</td>
								
								<td></td>
								<td class="ls0">3,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
								<tr>
								<td>제증명수수료</td>
								<td class="ls0"></td>
								<td>영문 소견서</td>
								
								<td></td>
								<td class="ls0">10,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0">PDZ110004</td>
								<td>진료기록(영상) CD</td>
								
								<td></td>
								<td class="ls0">10,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0">PDZ110101</td>
								<td>진료기록사본-1~5매</td>
								
								<td></td>
								<td class="ls0">1,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0">PDZ110102</td>
								<td>진료기록사본-6매 이상</td>
								
								<td></td>
								<td class="ls0">100</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
							<tr>
								<td>제증명수수료</td>
								<td class="ls0">PDZ160000</td>
								<td>제증명서 사본(재발급)</td>
								
								<td></td>
								<td class="ls0">1,000</td>
								<td class="ls0"></td>
								<td class="ls0"></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="info_download_box">
				<div class="wsize02">
					<h4>건강 보험이 적용되지 않는 비급여 진료비 비용 정보 <span>[ 2021년 2월 기준 ]</span></h4>
					<div class="txt">의료법 제 45조 제 1항 및 2항과 동법 시행규칙 제 42조의 2 제 1항, 제 2항 및 제 3항에 의거하여 비급여 진료비용을 위와 같이 고지합니다.<br>
					증명서 발급의 경우 <em>개인정보보호법에 의거, 병원에 직접 내원 시에만 본인 확인 후 발급이 가능</em>하며, 우편·FAX·이메일 등으로 발급이 불가합니다.<br>
					부득이하게 직접 내원이 불가능한 경우, 대리인을 통해 필요 서류 지참 후 내원하시면 발급이 가능합니다.<br>
					단, 소견서 및 진단서는 본인 진료 후에만 발급이 가능합니다.
						<div class="btn_download_box">
							<button type="button" class="btn_download btn_download1" data-opt="consent.hwp">진료 기록 열람 및 사본 발급 동의서 다운로드</button>
							<button type="button" class="btn_download btn_download2" data-opt="procuratory.hwp">위임장 다운로드</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/front/inc/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".btn_download").on("click", function() {
				// var filePath = "/NAS/_grand/common/"+$(this).data("opt");
				// var fileName = $(this).data("opt");
				// 해당 컨트롤러 애초에 존재하지 않음 -> /community/fileDownload
				// location.href="/community/fileDownload?filePath="+filePath+"&fileName="+fileName;
				location.href = "/imgpath/_grand/common/"+$(this).data("opt");
			});
		});
	</script>
</body>
</html>