package com.DevelopPR.meet.model.dto;

public class ChatRoomVO 
{
	private String chatroom_id;
	private String send_user_id;
	private String receiver_user_id;
	
	public String getChatroom_id() {
		return chatroom_id;
	}
	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}
	public String getSend_user_id() {
		return send_user_id;
	}
	public void setSend_user_id(String send_user_id) {
		this.send_user_id = send_user_id;
	}
	public String getReceiver_user_id() {
		return receiver_user_id;
	}
	public void setReceiver_user_id(String receiver_user_id) {
		this.receiver_user_id = receiver_user_id;
	}
	
	
}