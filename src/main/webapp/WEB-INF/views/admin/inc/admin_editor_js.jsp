<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var _editor = [];
	var _startTarget = null;
	var $meplzEditorCommon = {
		
			overLoadPhoto : function(obj){
				_startTarget = obj;
				winPopUPCenter("/admin/photo_uploader", "winPopEditorUploader", 772, 488, "yes", "yes");
			}
			,
			uploadSuccecs : function(fileInfo){
				
				var html = "";
				html +=' <img src="'+"/imgpath"+fileInfo.file_path+fileInfo.file_name+'" /> ';

				_startTarget.exec("PASTE_HTML", [html]);
			}
			
	};
	
	
	var $meplzNaverEditor = {
		init : function( options ){
			
			setting = $.extend({ 
					container 		: "meplzEditor"
				, 	useToolBar	 	: true
				, 	editorMode	 	: true
				, 	modeChange		: true
				,	saver			: _editor
				, 	onLoadSuccecs   : function(){
				
					}
				}			, options );
			
			
			
			 var btnHtml = "<button id='btnTesutEditor'>테스트</button>";
			 $("#"+setting.container).next().append(btnHtml);
			  
		      nhn.husky.EZCreator.createInIFrame({
		          oAppRef			: setting.saver	,
		          elPlaceHolder		: setting.container, //textarea에서 지정한 id와 일치해야 합니다. 
		          sSkinURI			: "/resources/admin/se2/SmartEditor2Skin.html",  
		          htParams : {
		              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseToolbar : setting.useToolBar ,             
		              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseVerticalResizer : setting.editorMode ,     
		              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseModeChanger : setting.modeChange ,         
		              fOnBeforeUnload : function(){
		                   
		              }
		          }, 
		          fOnAppLoad : function(){
		              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
		              //oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
		              
		        	  setting.onLoadSuccecs();
		          },
		          fCreator: "createSEditor2"
		      });
		}
	};
	
	
	function winPopUPCenter(url, winName, pwidth, pheight, scrollYN, resizeYN) {
	     var win = null;
	     var winL = (screen.width-pwidth)/2;
	     var winT = (screen.height-pheight)/2;
	     var spec = 'toolbar=no,'; // 도구메뉴
	     spec += 'status=no,'; // 상태바
	     spec += 'location=yes,'; // 주소관련메뉴
	     spec += 'height='+pheight+','; // 높이
	     spec += 'width='+pwidth+','; // 너비
	     spec += 'top='+winT+','; // 세로위치
	     spec += 'left='+winL+','; // 가로위치
	     spec += 'scrollbars='+(scrollYN == undefined ? "no" : scrollYN)+','; // 스크롤바 여부(기본)
	     spec += 'resizable='+(resizeYN == undefined ? "no" : resizeYN); // 창크기조정 여부
	     win = window.open(url, winName, spec);
	     if(parseInt(navigator.appVersion) >= 4) {
	      win.window.focus();
	     }
	} 


	
</script>
<script type="text/javascript" src="/resources/admin/se2/js/HuskyEZCreator.js" charset="utf-8"></script>