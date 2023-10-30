package com.hta.movieplus.task;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

	public void SendMail(MailVO vo) { // 회원가입 인증번호

		MimeMessagePreparator mp = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {

				/*
				 * MimeMessageHelper를 이용하면 첨부 파일이나 특수 문자 인코딩으로 작업할 때 전달된 MimeMessage를 채우는데
				 * 편리합니다.
				 */
				// 두 번째 인자 true는 멀티 파트 메시지를 사용하겠다는 의미입니다.
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); // 메일서버이용
				helper.setFrom(vo.getFrom()); // SET으로 보내는사람 메일주소
				helper.setTo(vo.getTo()); // 받는사람 메일주소

				String subject = "[MoviePlus] 가입 이메일 인증번호";
				String content = "고객님의 인증번호는 다음과 같습니다. [ " + vo.getVerifycode() + " ]";

				
				String content2 = "<div class=''><div class='aHl'></div><div id=':n7' tabindex='-1'></div>";
				content2 += "<div id=':mw' class='ii gt' jslog='20277; u014N:xr6bB; 1:WyIjdGhyZWFkLWY6MTc4MDA4NTc3MDEzNjYwMjc3OSIsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsW11d; 4:WyIjbXNnLWY6MTc4MDA4NTc3MDEzNjYwMjc3OSIsbnVsbCxbXSxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxbXSxbXSxbXSxudWxsLG51bGwsbnVsbCxudWxsLFtdXQ..'>";
				content2 +=  "<div id=':mv' class='a3s aiL ' style='margin-left: 50px; margin-top: 50px;'>";
				content2 +=  "<table border='0' cellpadding='0' cellspacing='0' style='font-family:Malgun Gothic,dotum,verdana,serif;border:1px solid #dde1e5;background-color:#ffffff' width='620'>";
				content2 +=  "<tbody><tr><td style='padding-left:59px;font-family:Malgun Gothic,dotum,verdana,serif'>";
				content2 +=  "<table border='0' cellpadding='0' cellspacing='0' style='width:500px;padding-top:60px; padding-bottom:50px'>";
				content2 +=  "<tbody><tr><td style='padding-top:25px;font:bold 32px Malgun Gothic,dotum,verdana,serif;color:#17191d;letter-spacing:-1.5px'>MoviePlus<br>인증번호 안내</td>";
				content2 +=  "</tr><tr><td style='padding:20px 0 30px;font:14px Malgun Gothic,dotum,verdana,serif;color:#4a4e57;letter-spacing:-0.7px;line-height:1.71'><span style='color:#4a4e57'>안녕하세요,<br>";
				content2 +=  "저희 <strong>MoviePlus</strong>를 이용해 주셔서 감사드립니다.<br>회원가입 인증번호를 알려드립니다.<br><br></span>";
				content2 +=  "<span style='color:red; font-size:25px'>[ "; 
				content2 +=  vo.getVerifycode();
				content2 +=  " ]</span><br>홈페이지에서 인증번호를 입력하여 주세요.</td></tr></tbody></table></td></tr></tbody></table>";
				content2 +=  "<div style='display:none'></div></div><div class='yj6qo'></div><div class='yj6qo'></div>";
				content2 +=  "</div><div id=':nb' class='ii gt' style='display:none'><div id=':nc' class='a3s aiL '></div>";
				content2 +=  "</div><div class='hi'></div><div class='WhmR8e' data-hash='0'></div></div>";
					
				// 1. 문자로만 전송하는 경우
				// true는 html을 사용하겠다는 뜻입니다.
				helper.setSubject(subject); // 메일 제목
				helper.setText(content2, true); // 메일 내용 (값을받아서 쓰면됨)

				// 2. 이미지를 내장해서 보내는 경우
				// cid(content id)
				// String content = "<img src='cid:Home'>" + vo.getContent();
				// helper.setText(content, true);

				// FileSystemResource file = new FileSystemResource(new File(sendfile));
				// addInline메서드의 첫번째 매개변수에는 cid(content id)를 지정합니다.
				// helper.addInline("Home", file);
				
				// 3.파일을 첨부해서 보내는 경우
				// 첫번째 인자 : 첨부될 파일의 이름입니다.
				// 두번째 인자 : 첨부파일
				// helper.addAttachment("딸기.jpg", file);
			}
		}; // newMimeMessagePreparator() end

		mailSender.send(mp); // 메일 전송합니다.
		logger.info("회원가입 인증번호 전송했습니다.");

	}

	public void MypagechgMail(MailVO vo) { // 마이페이지 이메일변경 인증번호

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
		}; // newMimeMessagePreparator() end

		mailSender.send(mp); // 메일 전송합니다.
		logger.info("마이페이지 이메일변경 인증번호 전송했습니다.");
	}

	public void FindpassMail(MailVO vo) { // 마이페이지 이메일변경 인증번호

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
		}; // newMimeMessagePreparator() end

		mailSender.send(mp); // 메일 전송합니다.
		logger.info("마이페이지 이메일변경 인증번호 전송했습니다.");
	}

	public void sendAnswer(MailVO vo) {
		
		MimeMessagePreparator mp = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {

				/*
				 * MimeMessageHelper를 이용하면 첨부 파일이나 특수 문자 인코딩으로 작업할 때 전달된 MimeMessage를 채우는데
				 * 편리합니다.
				 */
				// 두 번째 인자 true는 멀티 파트 메시지를 사용하겠다는 의미입니다.
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); // 메일서버이용
				helper.setFrom(vo.getFrom()); // SET으로 보내는사람 메일주소
				helper.setTo(vo.getTo()); // 받는사람 메일주소

				String subject = "[MoviePlus] 문의내역 답변입니다.";
				String pluscontent = "안녕하세요 MoviePlus 입니다.<br>고객님께서 문의하신 내용에 대하여<br> 답변드립니다.<br>";
						
				
				helper.setSubject(subject); // 메일 제목
				helper.setText(pluscontent + vo.getContent(), true); // 메일 내용 (값을받아서 쓰면됨)

			}
		}; 

		mailSender.send(mp); // 메일 전송합니다.
		logger.info("답변 전송이 완료되었습니다.");

	}

}// class end
