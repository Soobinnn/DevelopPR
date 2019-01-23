package com.DevelopPR.resume.model.dao;

import com.DevelopPR.resume.model.dto.ResumeVO;
import com.DevelopPR.resume.model.dto.FollowVO;

public interface ResumeDAO {
	
	//이력서 등록 처리
	public void resumeRegistConfirm(ResumeVO vo) throws Exception;
	
	//이력서 상세보기 
	public ResumeVO resumeDetail(String email) throws Exception;
	
	//팔로우
	public void following(FollowVO vo) throws Exception;
	
	/*//팔로우, 언팔로우 체크
	public FollowVO chkFollowing(FollowVO vo) throws Exception;*/
	
}
