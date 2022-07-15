package com.grand.admin.common;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.grand.admin.file.service.FileService;
import com.grand.admin.file.vo.FileVO;
import com.grand.util.common.DateUtil;
import com.grand.web.test.vo.TestVO;


@Controller
public class CommonControler {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="fileService")
	private FileService fileService;
	
	@Value("#{file['rootPath']}")
	private String rootPath;
	
	@Value("#{file['mail_idpw']}")
	private String mail_idpw;
	
	
	@Value("#{file['mail_regist']}")
	private String mail_regist;
	
	
	private String smtp_username = "rmfosem3620@naver.com"; //"grandeye3620@gmail.com";
	private String smtp_password = "rmfosem2121!@";//"rmfosem2121!@";
	private String smtp_host =  "smtp.naver.com"; //"smtp.gmail.com";
	private int smtp_port =  465;
	
	
	
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
	
	
	@RequestMapping(value = "/bot/manager/", method = RequestMethod.GET)
	public String Botmanager(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		
		return "admin/Botlayout";
	}	
	
	
	
	@RequestMapping(value = "/admin/manager/", method = RequestMethod.GET)
	public String manager(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "admin/layout";
	}	
	
	
	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public String managerlogin(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "admin/login";
	}	
		
	
	@RequestMapping(value = "/admin/manager/tab01", method = RequestMethod.GET)
	public String tab01(Locale locale, Model model, HttpServletRequest request) {
		logger.info("parameter ==> {}", request.getParameter("ui_id"));
		model.addAttribute("param",  request.getParameter("ui_id"));
		return "admin/tab_test";
	}		
	
	@RequestMapping(value = "/admin/photo_uploader")
	public String photo_uploader(Locale locale, Model model, HttpServletRequest request) {
		model.addAttribute("param",  request.getParameter("ui_id"));
		model.addAttribute("_prefix", "_editor");
		
		return "admin/photo_uploader";
	}	
	
	@RequestMapping(value = "/admin/download") 
	public ModelAndView download(HttpServletRequest req, HttpServletRequest res, ModelAndView mav, FileVO vo) throws Exception { 

		String filePath = "";
		List<FileVO> fileInfo = fileService.selectDownloadFile(vo);
		if(fileInfo.size() > 0) {
			filePath = rootPath + fileInfo.get(0).getFilePath() + fileInfo.get(0).getFileName();
		}
		File file =  new File(filePath);
		ModelAndView mav1 = new ModelAndView("fileDownload", "downloadFile",file);
		mav1.addObject("fileInfo",fileInfo);
		return mav1; 
	}

	
		/** 자바 메일 발송 
		 * @throws MessagingException 
		 * @throws AddressException **/ 
		@RequestMapping(value = "/mailSender")
		@ResponseBody
		public Map<String, Object> mailSender(HttpServletRequest request, ModelMap mo,TestVO vo) throws Exception {
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

				content = mail_regist;
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
	    	
			return map;
		}
	
	

	}
