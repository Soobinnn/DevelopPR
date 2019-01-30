package com.DevelopPR.meet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.DevelopPR.meet.model.dto.ChatRoomVO;
import com.DevelopPR.meet.model.dto.MessageVO;
import com.DevelopPR.meet.service.MeetingService;
import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.service.ResumeService;
import com.DevelopPR.user.dto.UserVO;
import com.DevelopPR.user.service.UserService;

@Controller
public class MeetingController 
{
	@Inject
	MeetingService meetingService;
	@Inject
	UserService userService;
	@Inject
	ResumeService resumeService;
	
	@RequestMapping("/meeting")
	public String meeting(Model model, HttpSession session) throws Exception
	{
		UserVO userVo = (UserVO)session.getAttribute("login");
		String userNick = userVo.getUserNick();
		// userVO에서 본인의 닉네임(임시로 이름)을 가져온다.
		String follow_nick = userVo.getUserName();
		
		// 본인 닉네임과 매칭되어 DB에서 가져온다.
		List<ChatRoomVO> listChatRoom = meetingService.listChatRoom(userNick);
		// 자신의 아이디로 팔로잉 하는 사람들의 목록을 가지고온다.
		List<FollowVO> followingList = resumeService.followingList(follow_nick);
		// 자신을 팔로우 하는 사람들의 목록을 가지고온다.
		List<FollowVO> followerList = resumeService.followerList(follow_nick);
		
		model.addAttribute("list", listChatRoom);
		model.addAttribute("followingList", followingList);
		model.addAttribute("followerList", followerList);
		// 모델에 넣어서 전송합니다.
		return "basic/meet/meeting";
	}
	
	// 채팅방의 메시지 불러오기
	@RequestMapping(value="/getRoom",method = RequestMethod.POST)
	@ResponseBody
	public List<MessageVO> getRoom(Model model, @ModelAttribute MessageVO messageVO)
	{
		List<MessageVO> messageList = meetingService.getRoom(messageVO.getChatroom_id());
		return messageList;
	}
	
	@RequestMapping(value="/getList", method =RequestMethod.POST)
	@ResponseBody
	public List<ChatRoomVO> getList(Model model,  @RequestParam("userNick") String userNick) throws Exception
	{
		/*System.out.println("받아왔능가?" + userNick);*/
		String _userNick = userNick;
		List<ChatRoomVO> listChatRoom = meetingService.listChatRoom(_userNick);
		return listChatRoom; 
	}
	
	//메시지 읽음 표시
	@RequestMapping(value="/readUpdate", method =RequestMethod.POST)
	@ResponseBody
	public String readUpdate(@RequestParam("chatroom_id") String chatroom_id,  @RequestParam("userNick") String userNick) throws Exception
	{
		
		meetingService.readUpdate(chatroom_id, userNick);
		String msg = "success";
		/*	List<ChatRoomVO> listChatRoom = meetingService.listChatRoom(_userNick);*/
		return msg; 
	}
	
	//실시간 알림
	@RequestMapping(value="/alarm", method =RequestMethod.POST)
	@ResponseBody
	public int alarm(@RequestParam("userNick") String userNick) throws Exception
	{
		int _alarm = meetingService.alarm(userNick);
		/*	List<ChatRoomVO> listChatRoom = meetingService.listChatRoom(_userNick);*/
		return _alarm; 
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
