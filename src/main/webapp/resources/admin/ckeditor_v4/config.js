/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	config.language = 'ko';
	config.font_names = 'Noto Sans KR/Noto Sans KR;나눔고딕/나눔고딕;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;맑은 고딕/Malgun;Arial/arial;Comic Sans MS/comic;Courier New/cour;Georgia/georgia;Lucida Sans/LSANS;Tahoma/tahoma;Times New Roman/times;Trebuchet MS/trebuc;Verdana/verdana;';    // 사용 가능한 폰트 설정
	config.extraPlugins = 'youtube';
	config.fontSize_defaultLabel = '12px';
	config.fontSize_sizes='8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;';
	config.enterMode =CKEDITOR.ENTER_BR;		//엔터키 입력시 br 태그 변경
	config.shiftEnterMode = CKEDITOR.ENTER_P;	//엔터키 입력시 p 태그로 변경
	config.docType = "<!DOCTYPE html>";		//문서타입 설정
	//config.extraAllowedContent = 'iframe (*)';		//video , embed 등 막힌 태그를 허용하게 하는 설정	
	config.allowedContent = true;
	config.skin ='office2013';
	
};
