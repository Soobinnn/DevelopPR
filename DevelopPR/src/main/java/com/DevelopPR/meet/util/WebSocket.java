package com.DevelopPR.meet.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.DevelopPR.meet.model.dto.ChatRoomVO;
import com.DevelopPR.meet.model.dto.MessageVO;
import com.DevelopPR.meet.service.MeetingService;
import com.DevelopPR.user.dto.UserVO;
import com.google.gson.Gson;


public class WebSocket extends TextWebSocketHandler 
{
	@Inject
	MeetingService meetService;
	
	//서버에 연결된 사용자들을 저장하기위해 선언
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>(); //메세지를 날려주기위한 웹소켓전용 세션
	private Map<WebSocketSession, String> mapList = new HashMap<WebSocketSession, String>(); //실제session의 아이디정보, web소켓정보
	private Map<WebSocketSession,String> roomList = new HashMap<WebSocketSession, String>(); //실제 session의 아이디정보,  room정보
	private List<String> userList = new ArrayList<String>(); //접속자 명단을 개개인별로 뿌려주기위해 선언한 일반리스트

	//연결되었을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception 
	{
		log(session.getId() + " 연결 됨");
		users.put(session.getId(), session);
		sessionList.add(session);
	}
	
	//통신 연결끊었을때실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception 
	{
		log(session.getId() + " 연결 종료됨");
		users.remove(session.getId());
		sessionList.remove(session);
	}
	
	//서버가 클라이언트로부터 메시지를 받았을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception 
	{
		System.out.println("메시지페이로더 : "+ message.getPayload());
		
		Map<String, Object> map = null;
		/*메시지 담기*/
		MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
		
		ChatRoomVO roomVO  = new ChatRoomVO();
		
		roomVO.setSend_user_id(messageVO.getMessage_sender()); // 전송인
		roomVO.setReceiver_user_id(messageVO.getMessage_receiver()); //발송인
		
		ChatRoomVO croom = null;
		
		if(!messageVO.getMessage_sender().equals(messageVO.getMessage_receiver())) 
		{
		    	  System.out.println("a");
		    	  //채팅방목록에 없다면 방생성
		    	  if(meetService.isRoom(roomVO) == null ) 
		    	  {
		    		  System.out.println("b");
		    		  meetService.createRoom(roomVO);
		    		  System.out.println("d");
		    		  croom = meetService.isRoom(roomVO);
		    	  }
		    	  // 채팅방목록 있다면
		    	  else 
		    	  {
		    		  System.out.println("C");
		    		  croom = meetService.isRoom(roomVO);
		    	  }
		}
		else 
		{
			croom = meetService.isRoom(roomVO);
		}
		
		messageVO.setChatroom_chatroom_id(croom.getChatroom_id());
		if(croom.getSend_user_id().equals(messageVO.getMessage_sender())) 
	     {
	    	  messageVO.setMessage_receiver(roomVO.getReceiver_user_id());
	     }
	     else 
	     {
	    	  messageVO.setMessage_receiver(roomVO.getSend_user_id());
	     }
		
		for (WebSocketSession websocketSession : sessionList) 
	    {
	         map = websocketSession.getAttributes();
	         System.out.println(map);
	         System.out.println(map.toString());
	         UserVO login = (UserVO) map.get("login");

	         //받는사람
	         if (login.getUserNick().equals(messageVO.getMessage_sender())) 
	         {
	            Gson gson = new Gson();
	            String msgJson = gson.toJson(messageVO);
	            websocketSession.sendMessage(new TextMessage(msgJson));
	         }
	    }
		/*log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		for (WebSocketSession s : users.values()) 
		{
			s.sendMessage(message);
			log(s.getId() + "에 메시지 발송: " + message.getPayload());
		}*/
	}

	//전송시 에러 발생했을때
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception 
	{
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) 
	{
		System.out.println(new Date() + " : " + logmsg);
	}

}
	