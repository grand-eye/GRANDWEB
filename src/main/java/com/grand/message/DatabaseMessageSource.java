package com.grand.message;

import java.text.MessageFormat;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

import com.ctc.wstx.util.StringUtil;
import com.grand.message.service.MessageService;
import com.grand.message.vo.MessageVO;
import com.grand.web.test.service.TestService;

public class DatabaseMessageSource extends ReloadableResourceBundleMessageSource {

	@Inject
	private MessageService messageService;
	
	
	@Value("#{config['GRAND_URL']}") private String GRAND_URL;
	

    protected MessageFormat resolveCode(String code, Locale locale) {
    	MessageFormat format = null;
  	
    	MessageVO vo = new MessageVO();
    	
    	vo.setMsg_code(code);
    	/*String strLocale = locale.getCountry();
    	if (strLocale == null || "".equals(strLocale)) {
    		strLocale = "KR";
    	}    		
    	vo.setMsg_locale( strLocale );*/
    	vo.setMsg_locale( "KR" );
    	
        //MyObj myObj = myDao.findByCode(code);
    	
    	String messageDbString     = "";
    	
    	try {
			messageDbString = messageService.getMsg(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
    	

        if ( messageDbString != null && !( messageDbString.equals("") ) ) {

            format = new MessageFormat(messageDbString , locale);

        } else {

            format = super.resolveCode(code, locale);

        }

 
    	
    	return format;
    }

    protected String resolveCodeWithoutArguments(String code, Locale locale) {

        //MyObj myObj = myDao.findByCode(code);

        String format = "";
    	MessageVO vo = new MessageVO();
    	
    	vo.setMsg_code(code);
    	/*String strLocale = locale.getCountry();
    	if (strLocale == null || "".equals(strLocale)) {
    		strLocale = "KR";
    	}    		
    	vo.setMsg_locale( strLocale );*/
    	vo.setMsg_locale( "KR" );
    	
        //MyObj myObj = myDao.findByCode(code);
    	
    	String messageDbString     = "";
    	
    	try {
			messageDbString = messageService.getMsg(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
    	
    	if ( messageDbString != null && !( messageDbString.equals("") ) ) 
    	{
    		format = messageDbString;
    	}
    	else
    	{
    		format = super.resolveCodeWithoutArguments(code, locale);
    	}
        

        return format;

    }

}