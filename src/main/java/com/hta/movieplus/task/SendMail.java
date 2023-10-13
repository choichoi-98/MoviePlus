package com.hta.movieplus.task;

import java.io.File;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.hta.movieplus.domain.MailVO;

@Component
public class SendMail {
	
	private static final Logger logger = LoggerFactory.getLogger(SendMail.class);
	
	@Value("${my.sendfile}")
	private String sendfile;
	
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	public SendMail(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}
	
	public void SendMail(MailVO vo) {	//회원가입 인증번호
		
		MimeMessagePreparator mp = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
			
			/*
			 * MimeMessageHelper를 이용하면 첨부 파일이나 특수 문자 인코딩으로 작업할 때 
			 * 전달된 MimeMessage를 채우는데 편리합니다.
			 */
			//두 번째 인자 true는 멀티 파트 메시지를 사용하겠다는 의미입니다.
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			helper.setFrom(vo.getFrom());
			helper.setTo(vo.getTo());
				
			String subject = "[MoviePlus] 가입 이메일 인증번호"; 
			String content = "고객님의 인증번호는 다음과 같습니다. [ " + vo.getVerifycode() + " ]";
				
			//1. 문자로만 전송하는 경우
			//true는 html을 사용하겠다는 뜻입니다.
			helper.setSubject(subject);
			helper.setText(content, true);
				
			//2. 이미지를 내장해서 보내는 경우
			//cid(content id)
			//String content = "<img src='cid:Home'>" + vo.getContent();
			//helper.setText(content, true);
				
			//FileSystemResource file = new FileSystemResource(new File(sendfile));
			//addInline메서드의 첫번째 매개변수에는 cid(content id)를 지정합니다.
			//helper.addInline("Home", file);
				
			//3.파일을 첨부해서 보내는 경우
			//첫번째 인자 : 첨부될 파일의 이름입니다.
			//두번째 인자 : 첨부파일
			//helper.addAttachment("딸기.jpg", file);
			}
		}; //newMimeMessagePreparator() end
		
	  mailSender.send(mp);  // 메일 전송합니다.
	  logger.info("회원가입 인증번호 전송했습니다.");
	}
	
	
	
	public void MypagechgMail(MailVO vo) {		//마이페이지 이메일변경 인증번호 
			
		MimeMessagePreparator mp = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
			
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			helper.setFrom(vo.getFrom());
			helper.setTo(vo.getTo());
				
			String subject = "[MoviePlus] 마이페이지 이메일 변경 인증번호"; 
			String content = "고객님의 인증번호는 다음과 같습니다. [ " + vo.getVerifycode() + " ]";
				
			helper.setSubject(subject);
			helper.setText(content, true);
				
			}
		}; //newMimeMessagePreparator() end
		
	  mailSender.send(mp);  // 메일 전송합니다.
	  logger.info("마이페이지 이메일변경 인증번호 전송했습니다.");
	}
	
	public void FindpassMail(MailVO vo) {		//마이페이지 이메일변경 인증번호 
		
		MimeMessagePreparator mp = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				
				String subject = "[MoviePlus] 비밀번호 찾기 인증번호"; 
				String content = "고객님의 인증번호는 다음과 같습니다. [ " + vo.getVerifycode() + " ]";
				
				helper.setSubject(subject);
				helper.setText(content, true);
				
			}
		}; //newMimeMessagePreparator() end
		
		mailSender.send(mp);  // 메일 전송합니다.
		logger.info("마이페이지 이메일변경 인증번호 전송했습니다.");
	}
	
	
	
}//class end 
