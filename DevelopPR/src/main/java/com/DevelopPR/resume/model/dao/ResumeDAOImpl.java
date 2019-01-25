package com.DevelopPR.resume.model.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.model.dto.ResumeVO;

@Repository
public class ResumeDAOImpl implements ResumeDAO{
	@Inject
	   SqlSession SqlSession;
	 
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception {
		System.out.println(vo.toString());
		 SqlSession.insert("resume.registConfirm", vo);
	}

	@Override
	public ResumeVO resumeDetail(String email) throws Exception {
		return SqlSession.selectOne("resume.resumeDetail", email);
	}
	
	// 팔로우
	@Override
	public void following(FollowVO vo) throws Exception {
		SqlSession.insert("resume.followMember", vo);
	}
	
	// 언팔로우
	@Override
	public void unfollowing(FollowVO vo) throws Exception {
		SqlSession.delete("resume.unfollowMember", vo);
	}
	
	// 해당 계정이 팔로우 계정인지 체크
	@Override
	public String is_following(Map<String, Object> map) throws Exception {
		return SqlSession.selectOne("resume.is_follow", map);
	}
	
	// 팔로잉 하는 유저 리스트
	@Override
	public List<FollowVO> followingList(String follower_nick) throws Exception {
		return SqlSession.selectList("resume.followingList", follower_nick);
	}
	
	// 나를 팔로우 하는 유저 리스트
	@Override
	public List<FollowVO> followerList(String following_nick) throws Exception {
		return SqlSession.selectList("resume.followerList", following_nick);
	}

	
}
