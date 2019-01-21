package com.DevelopPR.meet.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocket extends TextWebSocketHandler 
{

	//서버에 연결된 사용자들을 저장하기위해 선언
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	private List<WebSocketSession> sessionList = new ArrayList<>(); //메세지를 날려주기위한 웹소켓전용 세션
	private Map<WebSocketSession, String> mapList = new HashMap<>(); //실제session의 아이디정보, web소켓정보
	private Map<WebSocketSession,String> roomList = new HashMap<>(); //실제 session의 아이디정보,  room정보
	private List<String> userList = new ArrayList<>(); //접속자 명단을 개개인별로 뿌려주기위해 선언한 일반리스트

	//연결되었을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception 
	{
		log(session.getId() + " 연결 됨");
		users.put(session.getId(), session);
	}
	
	//통신 연결끊었을때실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception 
	{
		log(session.getId() + " 연결 종료됨");
		users.remove(session.getId());
	}
	
	//서버가 클라이언트로부터 메시지를 받았을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception 
	{
		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		for (WebSocketSession s : users.values()) 
		{
			s.sendMessage(message);
			log(s.getId() + "에 메시지 발송: " + message.getPayload());
		}
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
	