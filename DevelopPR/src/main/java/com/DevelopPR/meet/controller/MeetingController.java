package com.DevelopPR.meet.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		/*String follow_nick = userVo.getUserName();*/
		
		// 본인 닉네임과 매칭되어 DB에서 가져온다.
		List<ChatRoomVO> listChatRoom = meetingService.listChatRoom(userNick);
		// 자신의 아이디로 팔로잉 하는 사람들의 목록을 가지고온다.
		List<FollowVO> followingList = resumeService.followingList(userNick);
		// 자신을 팔로우 하는 사람들의 목록을 가지고온다.
		List<FollowVO> followerList = resumeService.followerList(userNick);
		
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
	// 채팅방목록불러오기
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
		/*List<ChatRoomVO> listChatRoom = meetingService.listChatRoom(userNick);*/
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
	
	//팔로우 선택시 이미 방이 있는지 확인
	@RequestMapping(value="/checkRoom", method =RequestMethod.POST)
	@ResponseBody
	public List<MessageVO> checkRoom(@ModelAttribute ChatRoomVO chatRoomVo) throws Exception
	{
		ChatRoomVO checkRoom = meetingService.isRoom(chatRoomVo);
		System.out.println("후움"+checkRoom);
		/*System.out.println("가꼬온나 : "+checkRoom.getChatroom_id());*/
		List<MessageVO> msgList = new ArrayList<MessageVO>();
		if(checkRoom==null)
		{
			MessageVO msg = new MessageVO();
			msg.setChatroom_id(chatRoomVo.getSend_user_id()+","+chatRoomVo.getReceiver_user_id());
			msg.setMessage_sender(chatRoomVo.getSend_user_id());
			msg.setMessage_receiver(chatRoomVo.getReceiver_user_id());
			msg.setMessage_content(chatRoomVo.getReceiver_user_id()+" 님과 연결합니다.");;
			msgList.add(msg);
		}
		else
		{
			msgList  = meetingService.getRoom(checkRoom.getChatroom_id());
		}
		
		return msgList;
	}
	
	//채팅방 나가기
	@RequestMapping(value="/exitRoom", method =RequestMethod.POST)
	@ResponseBody
	public List<ChatRoomVO> exitRoom(@RequestParam("chatroom_id") String chatroom_id,  @RequestParam("userNick") String userNick) throws Exception
	{
		System.out.println("닉확인 "+userNick);
		meetingService.exitRoom(chatroom_id, userNick);
		List<ChatRoomVO> listChatRoom = meetingService.listChatRoom(userNick);
		return listChatRoom; 
	}
	
	
}
