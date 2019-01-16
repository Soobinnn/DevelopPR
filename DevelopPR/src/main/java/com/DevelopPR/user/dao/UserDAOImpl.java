package com.DevelopPR.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.user.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO
{
	 @Inject
	 SqlSession sqlSession;
	   
	 // 01. 회원 목록
	 @Override
	 public List<UserVO>listUser() 
	 {
	     return sqlSession.selectList("user.listUser");
	 }
	 
	 // 02. 회원 등록
	 @Override
	 public void insertUser(UserVO vo) 
	 {
	     sqlSession.insert("user.insertUser", vo);
	 }
}
