package com.DevelopPR.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.DevelopPR.user.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO
{
	 @Inject
	 SqlSession sqlSession;
	   
	 @Inject
	 BCryptPasswordEncoder passwordEncoder;
	 
	 // 회원 목록
	 @Override
	 public List<UserVO>listUser() 
	 {
	     return sqlSession.selectList("user.listUser");
	 }
	 
	 // 회원 등록
	 @Override
	 public void insertUser(UserVO vo) 
	 {
	     sqlSession.insert("user.insertUser", vo);
	 }
	// 이메일 찾기 ----- 준형
	 @Override
	 public String findId(String phone)
	 {
		//DB에서 phone번호에 매칭되는 email을 하나 리턴(가입할때 폰번호 중복허용하려면 selectList로..)
		return sqlSession.selectOne("user.findEmail", phone);
	 }
	// 이메일 찾기 ------ 준형
	 
	 
	 // 회원 로그인체크
	 @Override
	 public boolean loginCheck(UserVO vo) 
	 {
		 // 로그인 비밀번호 db매칭
	     String checkPw = sqlSession.selectOne("user.loginCheck", vo);
	     boolean matchPw = passwordEncoder.matches(vo.getUserPw(), checkPw);
	     // 로그인 정보 맞으면 최근시간업데이트
	     if(matchPw)
	     {
	    	 sqlSession.update("user.updateRecent", vo.getUserEmail());
	     }
	     return matchPw;
	 }
	// 회원 로그인 정보
	@Override
	public UserVO viewlogin(UserVO vo) 
	{
	    return sqlSession.selectOne("user.viewlogin", vo);
	}
	
	 //회원 로그아웃
	@Override
	public void logout(HttpSession sessin) 
	{
		
	}
	
	 // 회원 이메일, 이름, 닉네임 (팔로우)
	 @Override
	 public UserVO viewId(String userNick)
	 {
		 return sqlSession.selectOne("user.viewId", userNick);
	 }
	 
	 // 회원가입시 이메일 인증 키 생성
	 @Override
	 public void createAuthKey(String userEmail, String userAuthCode) throws Exception 
	 {
	   		// TODO Auto-generated method stub
		UserVO vo = new UserVO();
	   	
	   	vo.setUserAuthCode(userAuthCode);
	   	vo.setUserEmail(userEmail);

	   	sqlSession.selectOne("user.createAuthKey", vo);
	 }
	 // 인증 시 접근권한
	 @Override
	 public void userAuth(String user_email) throws Exception 
	 {
		 // TODO Auto-generated method stub
		 sqlSession.update("user.userAuth", user_email);
	 }
	   
	 // 로그인시 이메일 인증 여부 체크
	 @Override
	 public boolean checkAuthStatus(String userEmail)
	 {
		 int userAuth = sqlSession.selectOne("user.checkAuthStatus", userEmail);
		 System.out.println(userAuth);
		 return (userAuth == 1 ? true : false);
	 }
	 
	  // ajax 이메일 중복체크
	  @Override
	  public int checkMail(String userEmail)
	  {
	 		return sqlSession.selectOne("user.checkMail", userEmail);
	  }
	  
	   // ajax 닉네임 중복체크
	  @Override
	  public int checkNick(String userNick)
	  {
		  return sqlSession.selectOne("user.checkNick", userNick);
	  }
	  
	  // 회원가입 - 이메일 인증 에러시 재전송
	   // 인증키 변경
	   public void updateAuthKey(String reUserEmail, String userAuthCode)
	   {
			UserVO vo = new UserVO();   	
		   	vo.setUserAuthCode(userAuthCode);
		   	vo.setUserEmail(reUserEmail);
		   	sqlSession.update("user.updateAuthKey", vo);
	   }
//----------------------------------------------------------------------------------------------------------------------  
	 //비밀번호 재설정 - 준형 
	   
	   public void updatePasswd(UserVO vo) {
		   sqlSession.update("user.updatePasswd",vo);
	   }
	   
	 //회원정보 수정 폼- 준형
	   public UserVO modifyform(String userEmail) {
		   return sqlSession.selectOne("user.modifyform", userEmail);
	   }
	   
	 //회원 정보 수정
	   public void modifyInfo(UserVO vo) {
		  sqlSession.update("modifyInfo",vo);
	   }
	 //회원 탈퇴 비밀번호 확인 - 준형
	   public String checkPw(String userEmail) {
		   
		   return sqlSession.selectOne("user.checkPw",userEmail);
	   }
	 
	  //회원 탈퇴 - 준형
	   public void deleteUser(String userEmail) {
		   sqlSession.delete("user.deleteUser", userEmail);
	   }
	   
	   
//----------------------------------------------------------------------------------------------------------------------  
}
