<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
	<script type="text/javascript">
		var fileIdx; 				// 단일 업로드 경우 (파일IDX)
		var fileIdxs = new Array(); // 복수 업로드 경우 (파일IDX)
		
		var $fileGoupCode = "";
		
		console.log('1243456')
		function fnUploadCommon() {
		}
		fnUploadCommon.prototype.UploadStart = function () { 
			// 각자 페이지에서 오버라이딩
		};
		fnUploadCommon.prototype.UploadCompleteError = function (up, err) { 
			// 각자 페이지에서 오버라이딩
		};
		fnUploadCommon.prototype.UploadComplete = function (r, file) { 
			// 각자 페이지에서 오버라이딩
		};
		
		
		fnUploadCommon.prototype.getFileIdx = function(){
			return fileIdxs;
		};
		
		fnUploadCommon.prototype.getFileGroupCode = function(){
			return $fileGoupCode;
		};		
		
		
		var filefn = new fnUploadCommon(); //업로드 객체 생성
		
		

		
		
		var uploader = new plupload.Uploader({
   		    runtimes : 'html5',
   			browse_button :  dropObj ,
	   		drop_element 	:  dropObj	,
   		    
   		    url : "/fileCommonUpload?${_csrf.parameterName}=${_csrf.token}",
   		    filters : {
   		        max_file_size :fileSize, // 파일 사이즈 
   		        mime_types: [
   		            {title : "Image files", extensions : fileExt} // 파일 확장자 
   		        ]
   		    },
   		 	multi_selection : multiSelect,
   		    multipart_params : { // 업로드 필요한 데이터 셋팅
		        "groupCode" : '',
		        "cateCode" : cateCode
		    },
		    
   		 	init: {
		 		 Init: function(up, params) {
		 			$.ajax({
		 				  url: "/admin/interface/getGroupCode",  
		 				  async: false
		 				}) .done(function(data){
		 					uploader.settings.multipart_params.groupCode = data.code; // 업로드 필요한 동적 데이터 셋팅
		 					$fileGoupCode = data.code;

		 				});
		 			filefn.UploadStart(); // 파일업로드  시작 (처음한번만)
		 			if (uploader.features.dragdrop) {
		 		          var target = $("#" + dropObj);
		 		          
		 		          target.ondragover = function(event) {
		 		          		event.dataTransfer.dropEffect = "copy";
		 		          };
		 		          
		 		          target.ondragenter = function() {
		 		            	this.className = "dragover";
		 		          };
		 		          
		 		          target.ondragleave = function() {
		 		            	this.className = "";
		 		          };
		 		          
		 		          target.ondrop = function() {
		 		            	this.className = "";
		 		          };
		 		        }
 		        },
		        PostInit: function() {
		        },
		 
		        FilesAdded: function(up, files) {
 		            plupload.each(files, function(file) {
 		            	uploader.start();
 		            });
 		        },
 		 
 		        UploadProgress: function(up, file) {},
 		 
 		        Error: function(up, err) {
 		        	filefn.UploadCompleteError(up, err);	// 파일업로드 실패
 		        },
 		        
 		        FileUploaded : function(up, file, r){
 		        	var res1 = r.response.replace('"{', '{').replace('}"', '}');
 					var resData = JSON.parse(res1).files;
 					if(resData.flag == "Y") {
	 					fileIdx = resData.idx;				// 단일 업로드 경우
	 					fileIdxs.push(resData.idx);			// 복수 업로드 경우 (배열형식)
 					}
 		        	filefn.UploadComplete(r, file);		// 파일업로드 완료
   		        }
   		    }
   		});
   		uploader.init();
    		
</script>