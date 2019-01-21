package com.DevelopPR.meet.util;

import java.util.Date;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocket extends TextWebSocketHandler 
{
	//연결되었을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception 
	{
		log(session.getId() + " 연결 됨");
		/*users.put(session.getId(), session);*/
	}
	
	//통신 연결끊었을때실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception 
	{
		log(session.getId() + " 연결 종료됨");
		/*users.remove(session.getId());*/
	}
	
	//서버가 클라이언트로부터 메시지를 받았을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception 
	{
		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		/*for (WebSocketSession s : users.values()) 
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
	