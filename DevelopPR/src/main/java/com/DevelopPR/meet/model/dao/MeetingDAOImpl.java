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
		ChatRoomVO roomVO = null;
		roomVO = session.selectOne("meet.isRoom", vo);
		// 채팅방나갔을 때 다시 문자갔을 경우, 다시 변경
		if(roomVO != null)
		{		
			if(roomVO.getGet_room().indexOf("EXIT") >= 0)
			{
				session.update("meet.reconnectRoom");
			}
		}
		System.out.println("roomVO?"+roomVO);
		return roomVO;
	}
	
	/* 메시지 전송 내용 저장 */
	@Override
	public void insertMessage(MessageVO vo) throws Exception
	{
		session.insert("meet.insertMessage" , vo);
	}
	
	/* 개인 채팅방 입장 */
	@Override
	public List<MessageVO> getRoom(String chatroom_id, String userNick)
	{
		ChatRoomVO roomVO = new ChatRoomVO();
		roomVO.setChatroom_id(chatroom_id);
		roomVO.setSend_user_id(userNick);
		List<MessageVO> mvo = session.selectList("meet.getRoom",roomVO);	
		return mvo;
	}
	
	/* 개인 채팅방 전체 목록*/
	@Override
	public List<ChatRoomVO> listChatRoom(String userNick) throws Exception
	{
		/*List<ChatRoomVO> list = new List<ChatRoomVO>();*/
		return session.selectList("meet.listChatRoom", userNick);
	
	}
	
	/* 읽은메시지 변경 */
	@Override
	public void readUpdate(String chatroom_id,String userNick)
	{
		ChatRoomVO Room = new ChatRoomVO();
		Room.setChatroom_id(chatroom_id);
		Room.setSend_user_id(userNick);
		session.update("meet.readUpdate",Room);
	}
	
	/* 실시간 알람*/
	@Override
	public int alarm(String userNick)
	{
		int _alarm = session.selectOne("meet.alarm", userNick);
		return _alarm;
	}
	
	/* 채팅방 나가기*/
	@Override
	public void exitRoom(String chatroom_id, String userNick)
	{
		ChatRoomVO Room = new ChatRoomVO();
		Room.setChatroom_id(chatroom_id);
		Room.setSend_user_id(userNick);
		
		session.update("meet.exitRoom", Room);
		session.update("meet.exitMessage", Room);
		session.update("meet.readUpdate",Room);
		String _exitCheck = session.selectOne("meet.exitCheck", chatroom_id);
		
		System.out.println("똑똑 다나가셧나요 "+_exitCheck);
		// 다나갔을 경우 채팅방, 메시지 삭제
		if(_exitCheck.equals("EXIT,EXIT"))
		{
			session.delete("meet.deleteRoom", chatroom_id);
		}
	}
	
	/* 개인 프로필가져오기*/
	public String getPic(String Nick)
	{
		return session.selectOne("meet.getPic", Nick);
	}
}
