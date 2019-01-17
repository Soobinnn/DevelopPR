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
	
	  /* //03. 회원 정보 상세보기
	   public UserVO viewUser(String userId);
	   //04. 회원정보 수정
	   public void updateUser(UserVO vo);
	   //05. 회원삭제
	   public void deleteUser(String userId);
	   

	   
	   // 이메일 인증
	   public void userAuth(String userEmail) throws Exception;*/
}
