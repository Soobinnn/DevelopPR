package com.DevelopPR.resume.service;

import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.model.dto.ResumeVO;

public interface ResumeService {
	
	//이력서 등록 처리
	public void resumeRegistConfirm(ResumeVO vo) throws Exception;
	//이력서 상세보기
	public ResumeVO resumeDetail(String email) throws Exception;
	//팔로잉
	public void following(FollowVO vo) throws Exception;
	/*//팔로잉 중인지 체크
	public FollowVO chkFollowing(FollowVO vo) throws Exception;*/
	
}
