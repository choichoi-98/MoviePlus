package com.hta.movieplus.domain;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class MailVO {
	Random random = new Random();
	int verifycode = 100000 + random.nextInt(900000);
	private String from="j2sunnn@naver.com";
	private String to;
	private String subject="[MoviePlus] 이메일 인증번호";
	private String content="고객님의 인증번호는 다음과 같습니다. [" + verifycode + "]";
	
	
	public Random getRandom() {
		return random;
	}
	public void setRandom(Random random) {
		this.random = random;
	}
	public int getVerifycode() {
		return verifycode;
	}
	public void setVerifycode(int verifycode) {
		this.verifycode = verifycode;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
