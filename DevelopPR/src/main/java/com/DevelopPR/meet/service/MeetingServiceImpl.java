package com.DevelopPR.meet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.DevelopPR.meet.model.dao.MeetingDAO;
import com.DevelopPR.meet.model.dto.ChatRoomVO;
import com.DevelopPR.meet.model.dto.MessageVO;

@Service
public class MeetingServiceImpl implements MeetingService
{
	@Inject
	MeetingDAO meetingDao;
	
	/*채팅방 생성 */
	@Override
	public void createRoom(ChatRoomVO vo) throws Exception
	{
		meetingDao.createRoom(vo);
	}
	/*채팅방 목록 */
	@Override
	public ChatRoomVO isRoom(ChatRoomVO vo) throws Exception
	{
		return meetingDao.isRoom(vo);
	}
	/* 메시지 전송 */
	@Override
	public void insertMessage(MessageVO vo) throws Exception
	{
		meetingDao.insertMessage(vo);
	}
	
	/* 개인 채팅방 입장 */
	@Override
	public String getRoom(ChatRoomVO vo) throws Exception
	{
		return meetingDao.getRoom(vo);
	}
	
	/*개인 채팅방 전체 목록*/
	@Override
	public List<ChatRoomVO> listChatRoom(String userNick) throws Exception
	{
		return meetingDao.listChatRoom(userNick);
	}
}
