package com.grand.admin.common.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.grand.util.common.DateUtil;
import com.grand.web.test.vo.TestVO;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	@Value("#{file['mail_idpw']}")
	private String mail_idpw;
	
	
	@Value("#{file['mail_regist']}")
	private String mail_regist;
	
	
	private String smtp_username = "rmfosem3620@naver.com"; //"grandeye3620@gmail.com";
	private String smtp_password = "rmfosem2121!@";//"rmfosem2121!@";
	private String smtp_host =  "smtp.naver.com"; //"smtp.gmail.com";
	private int smtp_port =  465;
	
	/*
	 * private String smtp_username = "grand.help@gmail.com"; private String
	 * smtp_password = "qwert09123"; private String smtp_host = "smtp.gmail.com";
	 * private int smtp_port = 587;
	 */
	
    private Session mailConnect() {
    	
    	Properties props = new Properties();
        Session session = null;

        props.put("mail.smtp.host", smtp_host); // SMTP Host
        props.put("mail.smtp.port", smtp_port); // TLS Port
        props.put("mail.smtp.auth", true); // enable authentication
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", smtp_host);

        Authenticator auth = new SMTPAuthenticator();
        session = Session.getDefaultInstance(props, auth);
        session.setDebug(true); 

        return session;
    }

    private class SMTPAuthenticator extends javax.mail.Authenticator {
        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(smtp_username, smtp_password);
        }
    }

	@Override
	public Map<String, Object> mainSendService(TestVO vo) throws Exception {
    	Map<String, Object> map = new HashMap<String, Object>();
        Session mailSession = mailConnect();
        
        Message mimeMessage = new MimeMessage(mailSession);
        mimeMessage.setFrom(new InternetAddress(smtp_username));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress( vo.getMail() ));
        mimeMessage.setReplyTo(InternetAddress.parse(smtp_username, false));
        
        int caseBy = vo.getCaseBy();
        String subject = "";
        String content = "";
        
		if(caseBy == 1) {
			subject = "[강남그랜드안과] 회원가입 확인 메일입니다.";
			
			DateUtil du = new DateUtil();
			String nowDate = du.getDate2();

			content = mail_idpw;
			content = content.replaceAll("@ETC1@"		, "회원님은 <font color='#000000'>"+nowDate+"</font> 웹 회원이 되셨습니다." );
			content = content.replaceAll("@ID@"			, vo.getId() );
			content = content.replaceAll("@NAME@"		, vo.getName()  );
		}else if(caseBy == 2) {
			subject = "[강남그랜드안과] 비밀번호 확인 메일입니다.";
			
			content = mail_idpw;
			content = content.replaceAll("@NAME@"		, vo.getName()  );
			content = content.replaceAll("@ID@"			, vo.getId() );
			content = content.replaceAll("@PASS@"		, vo.getTempPassword()  );
		}	        
        
        Multipart mp = new MimeMultipart();
        MimeBodyPart mbp1 = new MimeBodyPart();
        mbp1.setContent(content , "text/html; charset=UTF-8" );
        mp.addBodyPart(mbp1);
        
        mimeMessage.setSubject( subject );
        mimeMessage.setContent(mp);
        Transport.send(mimeMessage);
        
        map.put("result", "success");
    	
		return map;
	}	
    
    
    
	
    
    
}
