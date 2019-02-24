package com.DevelopPR.resume.service;

import java.util.List;

import java.util.Map;


import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.DevelopPR.resume.model.dao.ResumeDAO;
import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.model.dto.GoodVO;
import com.DevelopPR.resume.model.dto.ResumeVO; 

@Service
public class ResumeServiceImpl implements ResumeService{
	@Inject
	ResumeDAO resumeDAO;
	
	//이력서 목록보기
	@Override
	public List<ResumeVO> resumeList(int start, int end, String searchOption, String keyword) throws Exception {
		return resumeDAO.resumeList(start, end, searchOption, keyword);
	}	
	//이력서 목록보기에서 레코드 갯수  메서드 추가 (검색된 자료의 갯수 출력)
	@Override
    public int countArticle(String searchOption, String keyword) throws Exception {
        return resumeDAO.countArticle(searchOption, keyword);
    }
	//목록에서 이미지 가져오기
	@Override
	public List<ResumeVO> mainList() throws Exception {
		return resumeDAO.mainList();
	}
	
	
	//이력서 등록 처리
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception 
	{
	       resumeDAO.resumeRegistConfirm(vo);
	}
	//이력서 상세보기
	@Override
	public ResumeVO resumeDetail(String email) throws Exception 
	{
		return resumeDAO.resumeDetail(email);
	}
	//이력서 수정하기
	@Override
	public void resumeModify(ResumeVO vo) throws Exception {
		resumeDAO.resumeModify(vo);
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
	

	@Override
	public void good(GoodVO vo) throws Exception{
		resumeDAO.good(vo);
	}
	@Override
	public void ungood(GoodVO vo) throws Exception{
		resumeDAO.ungood(vo);
	}
	@Override
	public String is_good(GoodVO vo) throws Exception {
		return resumeDAO.is_good(vo);
	}
	
}
