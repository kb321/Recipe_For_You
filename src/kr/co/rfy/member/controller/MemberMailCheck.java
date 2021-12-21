package kr.co.rfy.member.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MemberMailCheck {

	public void emailSend(String userEmail) {
		
		//인증코드 생성
		//String AuthenticationKey = authCodeMaker();
		
		// mail server 설정
		String host = "smtp.gmail.com";
		String admin = "recipe.for.you.email@gmail.com"; // 관리자 메일
		String password = "qqqq1111!";// 관리자 메일 패스워드
		
		// 메일 받을 주소
		String to_email = userEmail;
		System.out.println("userEmail : " + userEmail);

		// SMTP 서버 정보를 설정한다.
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", host);
		//google - TLS : 587, SSL: 465
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.debug", "true");
        
		//메일을 전송하기 위한 세션생성
		Session mailSession = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(admin, password);
			}
		});
		
		// 메일관련 내용 생성을 위해 MimeMessage 생성
		MimeMessage msg = new MimeMessage(mailSession);
		
		// email 전송
		try {
			// 보내는 사람 / 받은 사람 설정
			msg.setFrom(new InternetAddress(admin)); // 보내는 사람
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email)); // 받는 사람

			// 메일 제목
			msg.setSubject("냉장고를 부탁해 이메일 인증입니다.", "UTF-8");
			// 메일 내용
			//msg.setText("인증 번호 :" + AuthenticationKey );

			// 메일 전송	
			Transport.send(msg);
			// 확인
			//System.out.println("이메일 전송 : " + AuthenticationKey);
			//ShareVar_login sv = ShareVar_login.getInstance();
			//sv.authEamilCode = AuthenticationKey;

		} catch (AddressException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} catch (MessagingException e) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
		}
	}
		
	

}
