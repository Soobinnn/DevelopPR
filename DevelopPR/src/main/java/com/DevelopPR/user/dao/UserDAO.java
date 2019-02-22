package com.DevelopPR.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.DevelopPR.user.dto.UserVO;

public interface UserDAO 
{
	   //01. 회원 목록 
	   public List<UserVO> listUser();
	   //02. 회원 입력 ++ 이메일 추가
	   public void insertUser(UserVO vo) throws Exception;
	   
	   // 회원 로그인 체크
	   public boolean loginCheck(UserVO vo);
	   // 회원 로그인 정보
	   public UserVO viewlogin(UserVO vo);  
	   //회원 로그아웃
	   public void logout(HttpSession session);

	   // 회원 이메일, 이름, 닉네임 (팔로우)
	   public UserVO viewId(String email);

	// 이메일 찾기 -- 준형
	   public List findId(String phone) throws Exception;
	// 이메일 찾기 -- 준형
	   
	   
	   // 이메일 인증확인
	   public void userAuth(String userEmail) throws Exception;
	   // 이메일 인증키 생성
	   public void createAuthKey(String userEmail, String userAuthCode) throws Exception;
	   
	   // 로그인시 이메일 인증 여부 체크
	   public boolean checkAuthStatus(String userEmail);
	   
	   // ajax 이메일 중복체크
	   public int checkMail(String userEmail);
	   
	   // ajax 닉네임 중복체크
	   public int checkNick(String userNick);
	   
	   // 회원가입 - 이메일 인증 에러시 재전송
	   // 인증키 변경
	   public void updateAuthKey(String reUserEmail, String userAuthCode);
	   
	/*   //03. 회원 정보 상세보기
	   public UserVO viewUser(String userId);
	   //04. 회원정보 수정
	   public void updateUser(UserVO vo);
	   //05. 회원삭제
	   public void deleteUser(String userId);
	   //06. 비밀번호 체크
	   public boolean checkPw(String userId, String userPw);
	  */
 	
	//비밀번호 재설정 - 준형
	   public void updatePasswd(UserVO vo);
	
	//회원 정보 수정 폼- 준형
	   public UserVO modifyform(String userEmail);
	   
	 //회원 정보 수정
	   public void modifyInfo(UserVO vo);   
	   
	 //회원 탈퇴 비밀번호 확인 - 준형
	   public String checkPw(String userEmail);
	  
	 //회원 탈퇴 - 준형 
	   public void deleteUser(String userEmail);
	    
	 //장기 미접속 인원 가져오기
	  public List<UserVO> longUnAccess();
	//이메일 찾기 Ajax 핸드폰 번호인증 추가 :: 준형
	   public int checkphone(String phone);
	  
}


