package com.DevelopPR.meet.model.dto;

import java.util.Date;

public class ChatRoomVO 
{
	private String chatroom_id;
	private String send_user_id;
	private String receiver_user_id;
	private Date lastTime;
	private String lastMessage;
	private int unReadCount;
	private String get_room;
	private String send_profile;
	private String receiver_profile;
	
	public String getChatroom_id() 

	{
		return chatroom_id;
	}
	public void setChatroom_id(String chatroom_id) 
	{
		this.chatroom_id = chatroom_id;
	}
	public String getSend_user_id() 
	{
		return send_user_id;
	}
	public void setSend_user_id(String send_user_id) 
	{
		this.send_user_id = send_user_id;
	}
	public String getReceiver_user_id() 
	{
		return receiver_user_id;
	}
	public void setReceiver_user_id(String receiver_user_id) 
	{
		this.receiver_user_id = receiver_user_id;
	}
	public Date getLastTime() 
	{
		return lastTime;
	}
	public void setLastTime(Date lastTime) 
	{
		this.lastTime = lastTime;
	}
	public String getLastMessage() {
		return lastMessage;
	}
	public void setLastMessage(String lastMessage) 
	{
		this.lastMessage = lastMessage;
	}
	public int getUnReadCount() {
		return unReadCount;
	}
	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}
	public String getGet_room() {
		return get_room;
	}
	public void setGet_room(String get_room) {
		this.get_room = get_room;
	}
	public String getSend_profile() {
		return send_profile;
	}
	public void setSend_profile(String send_profile) {
		this.send_profile = send_profile;
	}
	public String getReceiver_profile() {
		return receiver_profile;
	}
	public void setReceiver_profile(String receiver_profile) {
		this.receiver_profile = receiver_profile;
	}
	


}
