package com.kosa.hrsystem.utils;

import java.io.Reader;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.io.Resources;


public class NaverSMTP {
	
	private final Properties serverInfo; // 서버정보
	private final Authenticator auth; 	 // 인증정보
	private static Properties props;

	
	public NaverSMTP() {
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.naver.com");
		serverInfo.put("mail.smtp.port", "465");
		serverInfo.put("mail.smtp.starttls.enable", "true");
		serverInfo.put("mail.smtp.auth", "true");
		serverInfo.put("mail.smtp.debug", "true");
		serverInfo.put("mail.smtp.socketFactory.port", "465");
		serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		serverInfo.put("mail.smtp.socketFactory.fallback", "false");
		serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2");
		String resource = "email.properties";
		props = new Properties();
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			props.load(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
		auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(props.getProperty("id"), props.getProperty("pw"));
			}
		};
	}
	
	// 주어진 메일 내용을 네이버 SMTP 서버를 통해 전송한다.
	public void emailSending(Map<String, String> mailInfo) throws MessagingException {
		// 1. 세션 생성
		Session session = Session.getInstance(serverInfo, auth);
		session.setDebug(true);
		
		// 2. 메시지 작성
		MimeMessage msg = new MimeMessage(session); 
		msg.setFrom(new InternetAddress(props.getProperty("id"))); // 보내는 사람
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.get("to"))); // 받는 사람
		msg.setSubject(mailInfo.get("subject")); // 제목
		msg.setContent(mailInfo.get("content"),mailInfo.get("format")); // 내용
		
		Transport.send(msg);
	}
}
