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
	/* 메시지 전송 내용 저장 */
	@Override
	public void insertMessage(MessageVO vo) throws Exception
	{
		meetingDao.insertMessage(vo);
	}
	
	/* 개인 채팅방 입장 */
	@Override
	public List<MessageVO> getRoom(String chatroom_id)
	{
		return meetingDao.getRoom(chatroom_id);
	}
	
	/*개인 채팅방 전체 목록*/
	@Override
	public List<ChatRoomVO> listChatRoom(String userNick) throws Exception
	{
		return meetingDao.listChatRoom(userNick);
	}
	
	/* 읽은메시지 변경 */
	@Override
	public void readUpdate(String chatroom_id,String userNick)
	{
		meetingDao.readUpdate(chatroom_id, userNick);
	}
	
	/* 실시간 알람*/
	@Override
	public int alarm(String userNick)
	{
		return meetingDao.alarm(userNick);
	}
	
	/* 채팅방 나가기*/
	@Override
	public void exitRoom(String chatroom_id, String userNick)
	{
		meetingDao.exitRoom(chatroom_id, userNick);
	}
}
