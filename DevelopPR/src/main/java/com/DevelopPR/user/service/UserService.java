package com.DevelopPR.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.DevelopPR.user.dto.UserVO;

public interface UserService 
{
	   // 회원 목록 
	   public List<UserVO> listUser();
	   // 회원 입력 ++ 이메일 추가
	   public void insertUser(UserVO vo) throws Exception;
	   
	   // 회원 로그인 체크
	   public boolean loginCheck(UserVO vo, HttpSession session);
	   
	   // 회원 로그인 정보
	   public UserVO viewlogin(UserVO vo);
	   
	   // 회원 로그아웃
	   public void logout(HttpSession session);
	   
	  // 회원 아이디 찾기
	   public String findId(String phone) throws Exception;
	
	   // 회원 이메일, 이름, 닉네임 (팔로우)
	   public UserVO viewId(String email);
	   
	   // 이메일 인증
	   public void userAuth(String userEmail) throws Exception;
	   // 휴대폰 인증
	   public String authCheck(String phone) throws Exception;
	   
	   // 로그인시 이메일 인증 여부 체크
	   public boolean checkAuthStatus(String userEmail);
	   
	   
	   // ajax 이메일 중복체크
	   public int checkMail(String userEmail);
	   // ajax 닉네임 중복체크
	   public int checkNick(String userNick);
	   
	   // 회원가입 - 이메일 인증 에러시 재전송
	   // 이메일체크 후 메일 재전송
	   public void reJoining(String reUserEmail) throws Exception;
	  /* //03. 회원 정보 상세보기
	   public UserVO viewUser(String userId);
	   //04. 회원정보 수정
	   public void updateUser(UserVO vo);
	   //05. 회원삭제
	   public void deleteUser(String userId);
	   */

	   
	  
}
