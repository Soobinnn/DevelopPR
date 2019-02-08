package com.DevelopPR.resume.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.model.dto.GoodVO;
import com.DevelopPR.resume.model.dto.ResumeVO;

@Repository
public class ResumeDAOImpl implements ResumeDAO{
	@Inject
	   SqlSession SqlSession;
	//이력서 목록보기 
	@Override
	public List<ResumeVO> resumeList(int start, int end, String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("searchOption", searchOption);
	      map.put("keyword", keyword);
	      // BETWEEN #{start}, #{end}에 입력될 값을 맵에 
	      map.put("start", start);
	      map.put("end", end);
		return SqlSession.selectList("resume.resumeList", map);
	}
	//이력서 목록보기에서 레코드 갯수  메서드 추가 (검색된 자료의 갯수 출력)
    @Override
	public int countArticle(String searchOption, String keyword) throws Exception 
	{
	   // 검색옵션, 키워드 맵에 저장
	   Map<String, String> map = new HashMap<String, String>();
	   map.put("searchOption", searchOption);
	   map.put("keyword", keyword);
	   return SqlSession.selectOne("resume.countArticle", map);
	}	
    //메인에서 이미지 가져오기
	@Override
	public List<ResumeVO> mainList() throws Exception {
		return SqlSession.selectList("resume.mainList");
	}

	//이력서 등록 처리
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception {
		System.out.println(vo.toString());
		 SqlSession.insert("resume.registConfirm", vo);
	}
	//이력서 상세보기
	@Override
	public ResumeVO resumeDetail(String email) throws Exception {
		return SqlSession.selectOne("resume.resumeDetail", email);
	}
	//이력서 수정 처리
	@Override
	public void resumeModify(ResumeVO vo) throws Exception {
		System.out.println(vo.toString());
		SqlSession.update("resume.modify", vo);
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
	
	
	@Override
	public void good(GoodVO vo) throws Exception {
		SqlSession.insert("resume.good", vo);
	}
	@Override
	public void ungood(GoodVO vo) throws Exception {
		SqlSession.delete("resume.ungood", vo);
		
	}
	@Override
	public String is_good(GoodVO vo) throws Exception {
		return SqlSession.selectOne("resume.is_good", vo);
	}
	
}
