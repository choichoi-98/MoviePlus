package com.hta.movieplus.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ChatMessageVO {
    private Long message_id;
    private String message_from;
    private String content;
    private Timestamp create_at;
    private String chat_room;
    
    public String getDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(create_at); // 날짜를 문자열로 변환
    }

    public String getTime() {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        return timeFormat.format(create_at); // 시간을 문자열로 변환
    }
    
    
    
	public Long getMessage_id() {
		return message_id;
	}
	public void setMessage_id(Long message_id) {
		this.message_id = message_id;
	}
	public String getMessage_from() {
		return message_from;
	}
	public void setMessage_from(String message_from) {
		this.message_from = message_from;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Timestamp create_at) {
		this.create_at = create_at;
	}
	public String getChat_room() {
		return chat_room;
	}
	public void setChat_room(String chat_room) {
		this.chat_room = chat_room;
	}
    
    
}
