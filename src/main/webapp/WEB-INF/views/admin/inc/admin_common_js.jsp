<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<script type="text/javascript">
	window.old_alert = window.alert;
	window.alert = function(message, fallback){
	    if(fallback)
	    {
	        old_alert(message);
	        return;
	    }
	    $.messager.alert('경고창', message  ,'error' );
	};
	
	
	function validatePassword (pw, options) {
		 // default options (allows any password)
		 var o = {
		  lower:    0,
		  upper:    0,
		  alpha:    0, /* lower + upper */
		  numeric:  0,
		  special:  0,
		  length:   [0, Infinity],
		  custom:   [ /* regexes and/or functions */ ],
		  badWords: [],
		  badSequenceLength: 0,
		  noQwertySequences: false,
		  noSequential:      false
		 };
		 
		 for (var property in options)
		  o[property] = options[property];
		 
		 var re = {
		   lower:   /[a-z]/g,
		   upper:   /[A-Z]/g,
		   alpha:   /[A-Z]/gi,
		   numeric: /[0-9]/g,
		   special: /[!^@#$%]/g
		  },
		  rule, i;
		 
		 // enforce min/max length
		 if (pw.length < o.length[0] || pw.length > o.length[1])
		  return false;
		 
		 // enforce lower/upper/alpha/numeric/special rules
		 for (rule in re) {
		  if ((pw.match(re[rule]) || []).length < o[rule])
		   return false;
		 }
		 
		 // enforce word ban (case insensitive)
		 for (i = 0; i < o.badWords.length; i++) {
		  if (pw.toLowerCase().indexOf(o.badWords[i].toLowerCase()) > -1)
		   return false;
		 }
		 
		 // enforce the no sequential, identical characters rule
		 if (o.noSequential && /([\S\s])\1/.test(pw))
		  return false;
		 
		 // enforce alphanumeric/qwerty sequence ban rules
		 if (o.badSequenceLength) {
		  var lower   = "abcdefghijklmnopqrstuvwxyz",
		   upper   = lower.toUpperCase(),
		   numbers = "0123456789",
		   qwerty  = "qwertyuiopasdfghjklzxcvbnm",
		   start   = o.badSequenceLength - 1,
		   seq     = "_" + pw.slice(0, start);
		  for (i = start; i < pw.length; i++) {
		   seq = seq.slice(1) + pw.charAt(i);
		   if (
		    lower.indexOf(seq)   > -1 ||
		    upper.indexOf(seq)   > -1 ||
		    numbers.indexOf(seq) > -1 ||
		    (o.noQwertySequences && qwerty.indexOf(seq) > -1)
		   ) {
		    return false;
		   }
		  }
		 }
		 
		 // enforce custom regex/function rules
		 for (i = 0; i < o.custom.length; i++) {
		  rule = o.custom[i];
		  if (rule instanceof RegExp) {
		   if (!rule.test(pw))
		    return false;
		  } else if (rule instanceof Function) {
		   if (!rule(pw))
		    return false;
		  }
		 }
		 
		 // great success!
		 return true;
		}	
	
	
	var comboFnc = {
			publicData : {} 			,
			publicClass : ""			,
			set: function( options )
			{
				
				var setting = $.extend({ 
						box			 		: ["#sel1", "#sel2"]
					, 	masterCode	 	: "A015"
					, 	initMsg			 	: ["대분류", "중분류"]
					, 	setClassName	: "faqSelectBox"
					,	initValue			: ["",""]
					, 	onChange   		: function( row, that ){ }
				} , options );
				
				
				var param = {};
				
				param.search_master = setting.masterCode;
				param.search_level     = 0;
				param.search_useyn   = "Y";
				
				
				$.ajax({  
	                url      			 : "/admin/interface/selectCodeDetailNoRoot"
	               ,data 				 : param
	               ,type    			 : "POST"
	               ,dataType 		 : "json"
	               ,success  : function(response) {
	            	  console.log(response);
	            	   
	            	   /** 서버통신후 selectbox initMsg설정 하기 **/
	            	   
	            	  var rndClassName = "combo_" + randomString(3);
	            	  this.publicClass = rndClassName;
	            	  
	            	  for ( var i=0; i <= setting.box.length - 1; i++ )
	            	  {
	            		  $( setting.box[i] ).html("");
	            		  $( setting.box[i] ).html( '<option value="">'+setting.initMsg[i]+'</option>' );
	            		  $( setting.box[i] ).addClass(setting.setClassName);
	            	  }

	            	   if ( response.rows.length > 0 )
	            	  {
	            		   var rootData = response.rows;
	            		   var setLevel  = 0;
	            		   
	            		   $.each( response.rows, function(x,y){
	            			   var html = '';
	            			   var selected = "";
	            			   
	            			   if ( setting.initValue[0] == y.tcd_code )
	            			   {
	            				   selected = "selected";
	            			   }
	            			   html = ' <option value="'+y.tcd_code+'" '+selected+' data-attr1="'+y.tcd_attr1+'" data-attr2="'+y.tcd_attr2+'" data-attr3="'+y.tcd_attr3+'">'+y.tcd_title+'</option>';
	            			   $(setting.box[0]).append(html);
	            		   });
	            		   
	            		   
	            		   var  $target  				= $("." + setting.setClassName );
	            		   var  $childRows			= {};
	            		   		  
	            		   
	            		   $target.off("change");
	            		   $target.on("change", function(){
	            			   var index = $target.index(this);
	            			   var setVal = $(this).val();
            				   var $nextData;
            				   
	            			   if ( index > 0 )
	            			   {
	            				   var $parent 		= $("." + setting.setClassName ).eq( index - 1);
	            				   var $parentVal 	= $parent.find("option:selected").val();
	            				   
	            				   $.each(  $childRows[setting.setClassName+"_"+ (index-1) ] , function(x,y){
	            					   if ( y.tcd_code  ==  setVal  )
	            					   {
	            						   $childRows[setting.setClassName+"_"+index]= y.children;
	            					   }
	            				   });          				   
	            			   }
	            			   else
	            			   {
	            				   $.each( response.rows , function(x,y){
	            					   if ( y.tcd_code  ==  setVal )
	            					   {
	            						   $childRows[setting.setClassName+"_"+index]  = y.children;
	            					   }
	            				   });
	            				   
	         	            	  for ( var i=1; i <= setting.box.length - 1; i++ )
	        	            	  {
	        	            		  $( setting.box[i] ).html("");
	        	            		  $( setting.box[i] ).html( '<option value="">'+setting.initMsg[i]+'</option>' );
	        	            	  }	            				   
	            			   }
	            			   
	            			   console.log($childRows);
	            			   
	            			   var childIndex = index + 1;
	            			   var $nextData = $childRows[setting.setClassName+"_"+index];
	            			   
	            			   
	            			   if ( childIndex <= setting.box.length -1  )
	            			   {
		            			   var $targetSelect = $("." + setting.setClassName ).eq(childIndex);
		            			   
		            			   $targetSelect.html('');
		            			   $targetSelect.html( '<option value="">'+setting.initMsg[childIndex]+'</option>' );

		            			   $.each( $nextData  , function(x,y){
		            					   
			            			   var html = '';
			            			   var selected = "";
			            			   
			            			   if ( setting.initValue[childIndex] == y.tcd_code )
			            			   {
			            				   selected = "selected";
			            			   }
			            			   html = ' <option value="'+y.tcd_code+'" '+selected+' data-attr1="'+y.tcd_attr1+'" data-attr2="'+y.tcd_attr2+'" data-attr3="'+y.tcd_attr3+'">'+y.tcd_title+'</option>';
			            			   $targetSelect.append(html);		            				   
		            			   });
		            			   
		            			   
		            			   if ( setting.initValue[childIndex]  != "" )
		            			  {
		            				   $("." + setting.setClassName ).eq(childIndex).trigger("change");
		            			  }
		            			   
		            			   
	            			   }
	            			   setting.onChange( index, this );
	            		   });
	            		   
	            		   if ( setting.initValue[0]  != "" )
	            		   {
	            			   console.log("trigger select box");
	            			   $("." + setting.setClassName ).eq(0).trigger("change");
	            		   }
	            		   
	            		   
	            	  }
	               }
	            });					
				
				
				
			}
			
			
	};
	
	var commonFnc = {
			
			setDataCombo : function( target, master, level, value, initMessage, changs )
			{
				
				var param = {};
				
				param.search_master 	= master;
				param.search_level     = level;
				param.search_useyn   = "Y";
				
				
				$.ajax({  
	                url      			 : "/admin/interface/selectCodeDetailNoRoot"
	               ,data 				 : param
	               ,type    			 : "POST"
	               ,dataType 		 : "json"
	               ,success  : function(response) {
	            	  	            	  
	                	  $(target).combobox({
		            		  valueField : 'tcd_code'	,
		            		  textField  : 'tcd_title'	,
		            		  data : response.rows  ,
		            		  onLoadSuccess : function(){
		            			  
			                	  if ( value != "")
			                	  {
			                		 $(target).combobox('setValue', value);
			                	  }		            			  
		            			  
		            		  }
	                	  	  ,
	                	  	onChange : function(nv,ov){
	                	  		changs(nv);
	                	  	}
		            	  });
	                	  $(target).combobox("textbox").prop('placeholder', initMessage);
	            	  	  

	            	  
	               }
	            });				
				
				
				
			},
			fnCommonCode(appendId, code, level, type, initMsg) {
				var treePrm = {};
				treePrm.search_master = code;
				treePrm.tcd_useyn = "Y";
				if(level != null) {
					treePrm.search_level = level;
				}
				if(initMsg == null && initMsg == "") {
					initMsg = "선택"
				}
				$('#code_'+appendId).empty();
								
				$.ajax({  
		               url      		 : "/admin/interface/selectCodeDetail"
		              ,data 			 : treePrm
		              ,type    			 : "POST"
		              ,dataType 		 : "json"
		              ,success  : function(data) {
							var html ="";
				           	var y = data.rows[0].children;
				           	if(type == "select") {
				           		html ='<option value="" selected="selected">'+initMsg+'</option>';
				           		$.each(y , function (index, item) { 
									html += '<option value="'+item.tcd_code+'">'+item.tcd_title+'</option>'
								});
				            	$('#code_'+appendId).append(html);
				            	$('#code_'+appendId).combobox({
					            	   
				            	});
				           	} else if(type == "checkbox" || type == "radio") {
				           		$.each(y , function (index, item) { 
				           			if (type == "checkbox") {
						           		html += '<input type="checkbox" name="'+appendId+'" id="'+appendId+index+'" value="'+item.tcd_code+'" /><label>'+item.tcd_title+'</label>'
						           	} else {
						           		html += '</li>';
			            				html += '	<label>';
		            					html += '		<input type="radio" name="'+appendId+'" class="'+appendId+'" value="'+item.tcd_code+'">';
		            					html += '		<span class="icon_radio">'+item.tcd_title+'</span>';
		            					html += '	</label>';
		            					html += '</li>';		
						           	}
								});
				            	$('#code_'+appendId).html(html);
				           	}
				           
		              }
	       		});
			}
			
			
			
	}


	var _prefix = "${_prefix}";
	
	if ( _prefix == "")
	{
		alert('GRAND 관리페이지 연동을 위한 전역 prefix가 해당 페이지에 세팅되지 않았습니다.');
		document.open();
		document.write("Error, Please prefix Setting!");
		document.close();
	}

	
	function randomString( size ) {
	    var chars = "0123456789ABCDEFGHIKLMNOPQRSTUVWXYZ";
	    var string_length = size;
	    var randomstring = '';
	    for (var i=0; i<string_length; i++) {
	        var rnum = Math.floor(Math.random() * chars.length);
	        randomstring += chars.substring(rnum,rnum+1);
	    }
	    return randomstring;
	}
	


	
	function imgBigSetOriginSize()
	{
		  $("img").each( function(x,y){
			  if ( $(y).hasClass("bigImgStart") )
			 {
				$(this).off("click");
				$(this).on("click", function(){
					var img_src = $(this).attr("src");
					 var img=new Image();
					       img.src = img_src;

					  var img_width=img.width;
					  var win_width=img.width+25;
					  var height=img.height+30;
					  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+height+', menubars=no, scrollbars=auto');
					        OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+img_src+"' width='"+win_width+"'>");				
				});
			 }
		  });
	}

	$.extend($.fn.datagrid.defaults, {
		loader: function(param, success, error){
			var opts = $(this).datagrid('options');
			if (!opts.url) return false;
			$.ajax({
				type: opts.method,
				url: opts.url,
				data: param,
				dataType: 'json',
				success: function(data){
					success(data);
				},
				error: function( xhr , status, error  ){
					console.log(xhr);
					console.log(status);
					console.log(error);
					
					if(xhr.status=="404")
					{
						alert('요청한 서버정보가 존재하지 않습니다.<br />시스템 관리자에게 문의하세요');
						return;
					}
					
					if(xhr.status=="403")
					{
						alert('보안에러 입니다.<br />다시 로그인 후 이용해주세요.');
						return;
					}
					
					if(xhr.status=="500")
					{
						alert('서버 에러가 발생하였습니다.<br />시스템 관리자에게 문의하세요');
						return;
					}			
				}
			});
		}
	})	

	
	$.extend($.fn.validatebox.defaults.rules, {
	    equals: {
	        validator: function(value,param){
	            return value == $(param[0]).val();
	        },
	        message: 'Field do not match.'
	    }
		, 
		empty : {
	        validator: function(value, param){
	        		var nidB = value.indexOf(" ");

	                if (nidB > 0 )
	                {
	                    return false;
	                }	  
	                else
	                {
			        	return true;                	
	                }

	        },
	        message : "해당 입력값은 빈값을 허용하지 않습니다."
	    } 
		,
		pattern : {
	        validator: function(value, param){
	            return  !value.match(param[0]);
	        },
	        message : "{1}"
	    } 
		,
	    minLength: {
	        validator: function(value, param){
	            return value.length >= param[0];
	        },
	        message: '최소  {0} 이상 글자를 입력하셔야 합니다.'
	    }
		,
		basic : {  
			   validator: function(value, param){  
			         return !value.match(/^[A-Za-z0-9+]*$/);
			   },  
			   message: '해당 항목은 영어/한글만 입력하실 수 있습니다.'  
		}
		
		,
		basic2 : {  
			   validator: function(value, param){  
			         return !value.match(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*-_.]+$/);
			   },  
			   message: '해당 항목은 숫자/영어/한글만 입력하실 수 있습니다.'  
		}
		,
		onlynum : {  
			   validator: function(value, param){  
			         return !value.match(/^[0-9]+$/);
			   },  
			   message: '해당 항목은 숫자만 asfasdfaf입력하실 수 있습니다.'
		}
		,
		number : {  
			   validator: function(value, param){  
			         return !value.match(/^[0-9.,]+$/);
			   },  
			   message: '해당 항목은 숫자 , .만 입력하실 수 있습니다.'
		}	
		,
		ajax_check : {  
			   validator: function(value, param){  
					var booleanCode = null;
					var oParam = {};
					oParam[ param[1] ] = value;

					$.ajax({  
		                url      			 : param[0]
		               ,async    		 : false
		               ,data 				 : oParam
		               ,type    			 : "POST"
		               ,dataType 		 : "json"
		               ,success  : function(data) {
		            	   if ( data.resultCode == "Y")
		            	   {
		            		   booleanCode = true;
		            	   }
		            	   else
		            		{
		            		   booleanCode = false;
		            		}
		               }
		            });
					
					return booleanCode;
				   
			   },  
			   message: ' {2} '
		}	
		
		,
		ajax_check_bot : {  
			   validator: function(value, param){  
					var booleanCode = null;
					var oParam = {};

					oParam.tm_name = value;
					oParam.tm_category = param[1];

					$.ajax({  
		                url      			 : param[0]
		               ,async    		 : false
		               ,data 				 : oParam
		               ,type    			 : "POST"
		               ,dataType 		 : "json"
		               ,success  : function(data) {
		            	   if ( parseInt(  data.resultCode )  > 0 )
		            	   {
		            		   booleanCode = false;
		            	   }
		            	   else
		            		{
		            		   booleanCode = true;
		            		}
		               }
		            });
					
					return booleanCode;
				   
			   },  
			   message: ' {2} '
		}		

	});
	
	if( $("body").find(".root_daum_roughmap") == true ) {
		
		new daum.roughmap.Lander({
			"timestamp" : "1561357851905",
			"key" : "u2qa",
			"mapWidth" : "645",
			"mapHeight" : "450"
		}).render();
	}
	
	jQuery.fn.serializeObject = function() { 
		var obj = null; try { if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" )
		{ var arr = this.serializeArray(); if(arr){ obj = {}; jQuery.each(arr, function() { obj[this.name] = this.value; }); } } }
		catch(e) { alert(e.message); }finally {} return obj; }

</script>