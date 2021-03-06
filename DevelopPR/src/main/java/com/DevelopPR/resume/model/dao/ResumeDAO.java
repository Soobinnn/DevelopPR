package com.DevelopPR.resume.model.dao;

import java.util.List;

import com.DevelopPR.resume.model.dto.ResumeVO;


import java.util.Map;

import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.model.dto.GoodVO;

public interface ResumeDAO {
	
	//이력서 목록보기
	public List<ResumeVO> resumeList(int start, int end, String searchOption, String keyword) throws Exception;
	//이력서 목록보기에서 레코드 갯수  메서드 추가 (검색된 자료의 갯수 출력)
	public int countArticle(String searchOption, String keyword) throws Exception;
	//메인에서 이미지 가져오기
	public List<ResumeVO> mainList() throws Exception;

	
	//이력서 등록 처리
	public void resumeRegistConfirm(ResumeVO vo) throws Exception;	
	//이력서 상세보기 
	public ResumeVO resumeDetail(String email) throws Exception;
	//이력서 수정 처리
	public void resumeModify(ResumeVO vo) throws Exception;
	

	//팔로우
	public void following(FollowVO vo) throws Exception;
	//언팔로우
	public void unfollowing(FollowVO vo) throws Exception;
	//팔로우, 언팔로우 체크
	public String is_following(Map<String, Object> map) throws Exception;
	//팔로잉 목록
	public List<FollowVO> followingList(String follower_nick) throws Exception;
	//팔로워 목록
	public List<FollowVO> followerList(String following_nick) throws Exception;
	
	
	//좋아요
	public void good(GoodVO vo) throws Exception;
	//좋아요 취소
	public void ungood(GoodVO vo) throws Exception;
	//팔로잉 중인지 체크
	public String is_good(GoodVO vo) throws Exception;
		
	public int is_regist(String email) throws Exception;
}
