/**
 * 네이버 스마트 에디터 유투브 로더
 */


nhn.husky.SE2M_YoutubeLoader = jindo.$Class({

    name : "SE2M_YoutubeLoader",

    $init : function(elAppContainer){

        this._assignHTMLObjects(elAppContainer);

    },

    _assignHTMLObjects : function(elAppContainer){

        this.oDropdownLayer 	 =  cssquery.getSingle("DIV.husky_seditor_YoutubeLoader_layer", elAppContainer);
        this.oInputYtbUrl		 	 =  cssquery.getSingle("#ytb_url", elAppContainer);
        this.oInputYtbWidth		 =  cssquery.getSingle("#ytb_width", elAppContainer);
        this.oInputYtbHeight		 =  cssquery.getSingle("#ytb_height", elAppContainer);
        this.oButtonSetOk	 	 =  cssquery.getSingle(".se2_apply_ytb", elAppContainer);
        this.oButtonSetCncle 	 =  cssquery.getSingle(".se2_cancel_ytb", elAppContainer);
        
        //div 레이어안에 있는 input button을 cssquery로 찾는 부분.
        //this.oInputButton = cssquery.getSingle(".se_button_time", elAppContainer);

    },

    $ON_MSG_APP_READY : function(){
    	
        this.oApp.exec("REGISTER_UI_EVENT",                ["YoutubeLoader", "click", "SE_TOGGLE_YOUTUBELOADER_LAYER"]);
        //input button에 click 이벤트를 할당.
        
        this.oApp.registerBrowserEvent(this.oButtonSetCncle	, 'click','SET_YTB_CANCLE');
        this.oApp.registerBrowserEvent(this.oButtonSetOk		, 'click','SET_YTB_OK');
        this.oApp.registerBrowserEvent(this.oInputYtbWidth		, 'keyup'		,	'KEYUP_NUMBER_ONLY_WIDTH');
        this.oApp.registerBrowserEvent(this.oInputYtbHeight		, 'keyup'		,	'KEYUP_NUMBER_ONLY_HEIGHT');        
    },


    $ON_SE_TOGGLE_YOUTUBELOADER_LAYER : function(){
    	console.log("AAA");
        this.oApp.exec("TOGGLE_TOOLBAR_ACTIVE_LAYER", [this.oDropdownLayer]);
    },

    $ON_SET_YTB_OK : function(){
    	
    	var widthV 	= this.oInputYtbWidth.value;
    	var heightV 	= this.oInputYtbHeight.value;
    	var ytbV	  	= this.oInputYtbUrl.value; 
    	if ( widthV =="" )
    	{
    		widthV = "100%";
    	}
    	
    	if ( heightV =="" )
    	{
    		heightV = "300px";
    	}    	
    	
    	
    	if  ( ytbV == "" )
    	{
    		return;
    	}
    	
    	var ytbHtml = '<iframe width="'+widthV+'" height="'+heightV+'" src="//www.youtube.com/embed/'+ytbV+'?rel=0&autoplay=1&showinfo=0&controls=1&wmode=transparent" frameborder="0" allowfullscreen></iframe>';
    	
    	//this.oApp.exec("HIDE_ACTIVE_LAYER");
         this.oApp.exec("PASTE_HTML", [ ytbHtml ]);
         
     	this.oInputYtbWidth.value  = "";
    	this.oInputYtbHeight.value = "";
    	this.oInputYtbUrl.value = ""; 
    	
    	
         this.oApp.exec("HIDE_ACTIVE_LAYER");

    }
    ,

    $ON_SET_YTB_CANCLE : function(){

    	this.oApp.exec("HIDE_ACTIVE_LAYER");
        //this.oApp.exec("PASTE_HTML", [new Date()]);

    }
    
    ,

    $ON_KEYUP_NUMBER_ONLY_WIDTH : function(){
    	if(ne_number_check( this.oInputYtbWidth )==false){return;} 
    }    

    ,

    $ON_KEYUP_NUMBER_ONLY_HEIGHT : function(){
    	if(ne_number_check( this.oInputYtbHeight )==false){return;} 
    }        
});


function ne_number_check(wjd){
    var   wjdV = wjd.value;
    var   wjdL = wjdV.length;

    for(i=0;i<wjdL;i++) {
        var val = "0123456789%px";
        if(parseInt(val.indexOf(wjdV.substring(i,i+1))) < 0) {
            wjd.value = '';
            return false;
        }
    }
}
 	