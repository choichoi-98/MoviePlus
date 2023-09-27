package com.hta.movieplus.domain;

import java.util.Random;

public class MailVO {
	private Random random = new Random();
	int verificationcode = 100000 + random.nextInt(900000);
	private String from="j2sunnn@naver.com";
	private String to;
	private String subject="[MoviePlus] 이메일 인증번호";
	private String content="고객님의 인증번호는 다음과 같습니다. [" + verificationcode + "]";
	
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
	public int getVerificationcode() {
		return verificationcode;
	}
	public void setVerificationcode(int verificationcode) {
		this.verificationcode = verificationcode;
	}
	

}
