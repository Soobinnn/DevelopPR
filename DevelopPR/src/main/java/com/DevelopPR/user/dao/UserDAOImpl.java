package com.DevelopPR.user.dao;

import java.util.List;

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
	 
	 @Override
	 public String findId(String phone)
	 {
		return sqlSession.selectOne("user.findId", phone);
	 }
	 
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
	   
}
