package com.DevelopPR.user.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.user.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO
{
	 @Inject
	 SqlSession sqlSession;
	   
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
	 
	 // 회원 로그인체크
	 @Override
	 public boolean loginCheck(UserVO vo) 
	 {
	     String name = sqlSession.selectOne("user.loginCheck", vo);
	     return (name == null) ? false : true;
	 }
	// 회원 로그인 정보
	@Override
	public UserVO viewlogin(UserVO vo) 
	{
	    return sqlSession.selectOne("user.viewlogin", vo);
	}
	
	 /*  // 09. 회원 로그아웃
	   @Override
	   public void logout(HttpSession sessin) 
	   {
	   }*/
	   
}
