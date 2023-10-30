package com.hta.movieplus.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ChatRoomVO {
	private String chat_Room_num;
	private String chat_Subject;
	private String chat_Object;
	private String message_from;
	private Timestamp create_at;
	private String content;
	private String member_name;
	private String relative_id;//상대 id
	
    public String getMember_name() {
		return member_name;
	}

	public String getRelative_id() {
		return relative_id;
	}

	public void setRelative_id(String relative_id) {
		this.relative_id = relative_id;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(create_at); // 날짜를 문자열로 변환
    }

    public String getTime() {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        return timeFormat.format(create_at); // 시간을 문자열로 변환
    }
	
	
	public String getMessage_from() {
		return message_from;
	}
	public void setMessage_from(String message_from) {
		this.message_from = message_from;
	}
	public Timestamp getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Timestamp create_at) {
		this.create_at = create_at;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getChat_Room_num() {
		return chat_Room_num;
	}
	public void setChat_Room_num(String chat_Room_num) {
		this.chat_Room_num = chat_Room_num;
	}
	public String getChat_Subject() {
		return chat_Subject;
	}
	public void setChat_Subject(String chat_Subject) {
		this.chat_Subject = chat_Subject;
	}
	public String getChat_Object() {
		return chat_Object;
	}
	public void setChat_Object(String chat_Object) {
		this.chat_Object = chat_Object;
	}
	
	
//	int roomNumber;
//	String roomName;
//	public int getRoomNumber() {
//		return roomNumber;
//	}
//	public void setRoomNumber(int roomNumber) {
//		this.roomNumber = roomNumber;
//	}
//	public String getRoomName() {
//		return roomName;
//	}
//	public void setRoomName(String roomName) {
//		this.roomName = roomName;
//	}
//	
//	public String toString() {
//		return "Room [roomNumber=" + roomNumber + ", roomName=" + roomName + "]";
//	}
}
