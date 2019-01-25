package com.DevelopPR.resume.service;

import java.util.List;

import java.util.Map;


import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.DevelopPR.resume.model.dao.ResumeDAO;
import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.model.dto.ResumeVO; 

@Service
public class ResumeServiceImpl implements ResumeService{
	@Inject
	ResumeDAO resumeDAO;
	
	@Override
	public List<ResumeVO> resumeList() throws Exception {
		return resumeDAO.resumeList();
	}
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception {
		   System.out.println(vo.toString());
	       resumeDAO.resumeRegistConfirm(vo);
	}
	@Override
	public ResumeVO resumeDetail(String email) throws Exception {
		return resumeDAO.resumeDetail(email);
	}
	@Override
	public void following(FollowVO vo) throws Exception {
		resumeDAO.following(vo);
	}
	@Override
	public void unfollowing(FollowVO vo) throws Exception {
		resumeDAO.unfollowing(vo);
	}
	@Override
	public String is_following(Map<String, Object> map) throws Exception {
		return resumeDAO.is_following(map);
	}
	@Override
	public List<FollowVO> followingList(String follower_nick) throws Exception {
		return resumeDAO.followingList(follower_nick);
	}
	@Override
	public List<FollowVO> followerList(String following_nick) throws Exception {
		return resumeDAO.followerList(following_nick);
	}
	
	

}
