<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>


<script type="text/x-jquery-tmpl" id="optionField">
			<option value="\${tcd_code}">\${tcd_title}</option>
</script>

<script type="text/x-jquery-tmpl" id="registField">
			<option value="\${tcd_title}">\${tcd_title}</option>
</script>

<script type="text/x-jquery-tmpl" id="arrayField">
			<li><input type="checkbox" value="\${tcd_code}" class="sr_only" id="category\${tcd_code}"><label for="category\${tcd_code}">\${tcd_title}</label></li>
</script>
      
<script type="text/javascript">

	var $comboFnc = {
			
			set: function( options )
			{
				
				var setting = $.extend({ 
						box			 			: ""
					, 	masterCode	 			: ""
					, 	setClassName			: ""
					,	initValue				: ["",""]
					,   templeat				: ""
					,   attr1					: ""
					,   attr2					: ""
					,   attr3					: ""
					,   attr4					: ""
					,   attr5					: ""								
					,   attr6					: ""
					,	codeOpt					: ""
					,	afterProc				: ""
					, 	onChange   		: function( row, that ){ }
					,	onCompleate	: function(){}
				} , options );
				
				var param = {};
				
				param.search_master = setting.masterCode;
				param.search_level     = 0;
				param.search_useyn   = "Y";
				
				param.s_attr_1 = setting.attr1;
				param.s_attr_2 = setting.attr2;
				param.s_attr_3 = setting.attr3;
				param.s_attr_4 = setting.attr4;
				param.s_attr_5 = setting.attr5;
				param.s_attr_6 = setting.attr6;
				param.codeOpt = setting.codeOpt;
				
				$.ajax(
				
						{  
			                	url      		 : "/interface/selectCodeDetailNoRoot"
			               ,	data 			 : param
			               ,	type    		 : "POST"
			               ,	dataType 		 : "json"
			               ,	success  		 : function(response) {
			            	   	 
			            		  var $tmpleat = $( setting.templeat ); // $("#intField")
			            		  var $html = $tmpleat.tmpl(response.rows); // $("#intField").tmpl(response.rows);
			            		  $(setting.box).append($html);
			            		  
			            		  if(setting.afterProc != 0){
			            				  $(setting.box).val(setting.afterProc);
			            				  console.log(setting.afterProc);
			            		  }
			            		  
			            	   	 
			            		  // start
			            	   	  
				            	  
				            	  /* for ( var i=0; i <= setting.box.length - 1; i++ )
				            	  {
									  if( $( setting.box[i] ).prop("tagName").toLowerCase()=="select")
									 {
					            		  $( setting.box[i] ).html("");
					            		  $( setting.box[i] ).html( '<option value="">'+setting.initMsg[i]+'</option>' );
					            		  $( setting.box[i] ).addClass(setting.setClassName);										  
									 }
				            	  }	
				            	  
				            	  if ( response.rows.length > 0 )
				            	  {
				            		  var $tmpleat = $( setting.templeat );
				            		  
				            		  var $html = $tmpleat.tmpl( response.rows, $tmplCodeFnc );
				            		  $(setting.box[0]).append( $html );
				            		  setting.onCompleate();
				            		  
				            		  if( $( setting.box[0] ).prop("tagName").toLowerCase()=="select")
				            		  {

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
				            		  
				            		  
				            		  
				            		  
				            	  } */
				            	  
				            	   // end
				            	  
			               },
							complete : function() {
			            	   setting.onCompleate();
			               }
						}						
				
				);				

		    }
			
	};		

	
</script>