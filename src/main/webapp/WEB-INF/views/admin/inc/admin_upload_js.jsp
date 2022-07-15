<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
		var $plUploader = null;
		var meplzSetting = {};
		
		var $meplzUploader = {
				
				fileIdx : ""
				,
				fileArray : new Array()
				,
				gropupCode : ""
				,
				enabled : false
				,
				start : function(  ){
					$plUploader.start();
				}
				,
				getFileIdx : function(){
					return this.fileIdx;
				}
				,
				getFileArray : function(){
					return this.fileArray;
				}				
				,
				getFileGroupCode : function(){
					return this.gropupCode;
				}				
				,
				init : function(options){
					
					meplzSetting = $.extend({
						parameter : {
					        "groupCode" : ''			,
					        "cateCode" 	: "test"							
						} 
						, multiSelect : false
						, dropBool : false
						, dropBox : "tempDrop"
						, uploadStartButton : ""
						, container	: ""
						, fileSize : "2"
						, extensionMessage : "Image Files"
						, extension : "jpg,gif,png" 
						, onLoadSucces : function(){}
						, onFileAdd : function(up, files){}
						, onUpdProgress : function(up, files){}
						, onError : function( up, err ){}
						, onComplete : function( svrResponse , fileInfo,  response ){}
						, onBefore : function(up, files) {}
					}, options );
					
					if ( meplzSetting.dropBool == false)
					{
						$("body").append(' <div id="tempDrop" style="width:0;height:0"></div> ' );
					}
					
					
					var $this = this;
					
					$plUploader  = new plupload.Uploader({
			   		    runtimes : 'html5',
			   		    browse_button : meplzSetting.uploadStartButton 						,
				   		drop_element 	: meplzSetting.dropBox										,
				   		multi_selection :  meplzSetting.multiSelect									,
			   		    url : "/admin/file/fileCommonUpload?${_csrf.parameterName}=${_csrf.token}",
			   		    filters : {
			   		        max_file_size :meplzSetting.fileSize 							, // 파일 사이즈 
			   		        mime_types: [
			   		            {
			   		            		  title 			: meplzSetting.extensionMessage  
			   		            		, extensions  : meplzSetting.extension  
			   		            } 
			   		        ]
			   		    },
			   		    multipart_params : meplzSetting.parameter ,
			   		 	init: {
					 		 Init: function() {
					 			$.ajax({
					 				  url: "/admin/interface/getGroupCode",  
					 				  async: false
					 				}) .done(function(data){
					 					$plUploader.settings.multipart_params.groupCode = data.code; // 업로드 필요한 동적 데이터 셋팅
					 					$meplzUploader.gropupCode = data.code;
					 				});
			 		        }
			   		    	,
					        PostInit: function() {
					        	meplzSetting.onLoadSucces();
					        }
			   		    	,
			   		    	BeforeUpload : function(up, files) {
			   		    		meplzSetting.onBefore( up, files );
			   		    	}
			   		    	,					 		
					        FilesAdded: function(up, files) {
			 		            
					        	if (meplzSetting.dropBool == false )
					        	{
					        		meplzSetting.onFileAdd( up, files );	
					        	}
					        	else
					        	{
				 		            plupload.each(files, function(file) {
				 		            	$plUploader.start();
				 		            });					        		
					        	}
			 		        },
			 		 
			 		        UploadProgress: function(up, file) {
			 		       		meplzSetting.onUpdProgress( up, file );
			 		        },
			 		 
			 		        Error: function(up, err) {
			 		        	meplzSetting.onError( up, err );
			 		        },
			 		        
			 		        FileUploaded : function(up, file, r){
			 		        	var res1 		= r.response.replace('"{', '{').replace('}"', '}');
			 					var resData  = JSON.parse(res1).files;
			 					
			 					meplzSetting.onComplete( resData  , file ,  r );
			 					$meplzUploader.enabled = true;
			 					
			 					if(resData.flag == "Y") {
			 						$meplzUploader.fileIdx = resData.idx;					
			 						$meplzUploader.fileArray.push(resData.idx);			
			 					}
			 					setTimeout(function(){
			 						imgBigSetOriginSize();
			 					},500);
			   		        }
			   		    }
			   		});		
					
					
					$plUploader.init();

				}
		};
</script>