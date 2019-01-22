package com.DevelopPR.meet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.DevelopPR.meet.service.MeetingService;
import com.DevelopPR.user.dto.UserVO;
import com.DevelopPR.user.service.UserService;

@Controller
public class MeetingController 
{
	@Inject
	MeetingService meetingService;
	@Inject
	UserService userService;
	
	@RequestMapping("/meeting")
	public String meeting(Model model, HttpSession session)
	{
		return "meet/meeting";
	}
	
	@RequestMapping("/meeting/{userNick}")
	public String chatRoom(Model model, @PathVariable String userNick, HttpSession session)
	{
		System.out.println(userNick);
		
		UserVO viewId = userService.viewId(userNick);
		
		model.addAttribute("viewId", viewId);
		return "meet/meeting";	
	}
	
	/*
	//채팅방생성
	@RequestMapping("chat.do/{userId}")
	public String chatRoom(Model model, @PathVariable("userId") String receiver_user_id, ChatRoomVO chatroom)
	{
		//해당 정보로 방을 DB에 생성( 이미 방이 존재한다면 생성하지 않는다 )
		ChatDto dto = projectChatService.checkRoom(chat.getName());
		ChatRoomVO chatroomvo =  projectChatService.checkRoom(chatroom.getSend_user_id());
		if(dto ==null) 
		{
			projectChatService.createChatRoom(chat);
		}
		ChatRoomVO chatroomvo = new ChatRoomVO();
		chatroomvo.setReceiver_user_id(receiver_user_id);
		model.addAttribute("startChat",chatroomvo);
		return "chat";
	}*/
}
