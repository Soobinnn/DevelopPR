package com.DevelopPR.meet.model.dto;

import java.util.Date;
import com.google.gson.Gson;

public class MessageVO 
{
	private String message_sender;
	private String message_receiver;
	private String message_content;
	private Date message_sendTime;
	private Date message_readTime;
	private String chatroom_id;
	private String send_user_id;
	private String receiver_user_id;
	private String user_profileImagePath;
	private String receiver_user_profileImagePath;
	private String send_user_name;
	private String receiver_user_name;
	private int unReadCount;
	
	public static MessageVO convertMessage(String source) 
	{
		MessageVO message = new MessageVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  MessageVO.class);
		return message;
	}


	public String getChatroom_id() {
		return chatroom_id;
	}


	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}


	public String getMessage_sender() {
		return message_sender;
	}

	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}

	public String getMessage_receiver() {
		return message_receiver;
	}

	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Date getMessage_sendTime() {
		return message_sendTime;
	}

	public void setMessage_sendTime(Date message_sendTime) {
		this.message_sendTime = message_sendTime;
	}

	public Date getMessage_readTime() {
		return message_readTime;
	}

	public void setMessage_readTime(Date message_readTime) {
		this.message_readTime = message_readTime;
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

	public String getUser_profileImagePath() {
		return user_profileImagePath;
	}

	public void setUser_profileImagePath(String user_profileImagePath) {
		this.user_profileImagePath = user_profileImagePath;
	}

	public String getReceiver_user_profileImagePath() {
		return receiver_user_profileImagePath;
	}

	public void setReceiver_user_profileImagePath(String receiver_user_profileImagePath) {
		this.receiver_user_profileImagePath = receiver_user_profileImagePath;
	}

	public String getSend_user_name() {
		return send_user_name;
	}

	public void setSend_user_name(String send_user_name) {
		this.send_user_name = send_user_name;
	}

	public String getReceiver_user_name() {
		return receiver_user_name;
	}

	public void setReceiver_user_name(String receiver_user_name) {
		this.receiver_user_name = receiver_user_name;
	}

	public int getUnReadCount() {
		return unReadCount;
	}

	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}
	@Override
	public String toString()
	{
		return "MessageVO [chatroom_id=" + chatroom_id + ", message_sender" + message_sender +", message_receiver" + message_receiver + ", message_content" + message_content +
				", message_sendTime" + message_sendTime + ",  message_readTime : "+  message_readTime +"send_user_id" + send_user_id +
				", receiver_user_id" + receiver_user_id + ", user_profileImagePath" + user_profileImagePath + ", receiver_user_profileImagePath" + receiver_user_profileImagePath +
				", send_user_name" + send_user_name + ", receiver_user_name" + receiver_user_name + ", unReadCount" + unReadCount+"]";
	}

}
