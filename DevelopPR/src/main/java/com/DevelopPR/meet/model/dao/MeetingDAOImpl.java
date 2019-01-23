package com.DevelopPR.meet.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.meet.model.dto.ChatRoomVO;
import com.DevelopPR.meet.model.dto.MessageVO;

@Repository
public class MeetingDAOImpl implements MeetingDAO
{
	@Inject
	private SqlSession session;
	
	/*채팅방 생성 */
	@Override
	public void createRoom(ChatRoomVO vo) throws Exception
	{
		session.insert("meet.createRoom", vo);
	}
	/*채팅방 목록 */
	@Override
	public ChatRoomVO isRoom(ChatRoomVO vo) throws Exception
	{
		ChatRoomVO roomvo = null;
		roomvo = session.selectOne("meet.isRoom", vo);
		return roomvo;
	}
	/* 메시지 전송 */
	@Override
	public void insertMessage(MessageVO vo) throws Exception
	{
		session.insert("meet.insertMessage" , vo);
	}
	
	/* 개인 채팅방 입장 */
	@Override
	public String getRoom(ChatRoomVO vo) throws Exception 
	{
		// TODO Auto-generated method stub
		List<MessageVO> mvo = session.selectList("meet.getRoom", vo);	
		return mvo.get(0).getSend_user_id();
	}
	
	/* 개인 채팅방 전체 목록*/
	@Override
	public List<ChatRoomVO> listChatRoom(String userNick) throws Exception
	{
		return session.selectList("meet.listChatRoom", userNick);
	
	}
}
