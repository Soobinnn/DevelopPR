package com.DevelopPR.meet.service;

import java.util.List;

import com.DevelopPR.meet.model.dto.ChatRoomVO;
import com.DevelopPR.meet.model.dto.MessageVO;

public interface MeetingService 
{
	/*채팅방 생성 */
	public void createRoom(ChatRoomVO vo) throws Exception;
	/*채팅방 목록 */
	public ChatRoomVO isRoom(ChatRoomVO vo) throws Exception;
	/* 메시지 전송 */
	public void insertMessage(MessageVO vo) throws Exception;
	
	/* 개인 채팅방 입장 */
	public String getRoom(ChatRoomVO vo) throws Exception;
/*	
	public String getProfile(String str) throws Exception;
	public String getName(String str) throws Exception;
	public List<MessageVO> getMessageList(String str) throws Exception;
	public List<ChatRoomVO> getRoomList(String str) throws Exception;
	public List<ChatRoomVO> getRoomList2(String str) throws Exception;
	public MessageVO getRecentMessage(String str) throws Exception;
	public String getTutorId(String str) throws Exception;
	public List<ChatRoomVO> getRoomListTutor(String str) throws Exception;
	public void updateReadTime(int class_id, String user_id, String TUTOR_USER_user_id) throws Exception;
	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception;
	public int getAllCount(String str);
	public void updateReadTimeTutor(int class_id , String user_id , String TUTOR_USER_user_id) throws Exception;
	public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception;
*/
}