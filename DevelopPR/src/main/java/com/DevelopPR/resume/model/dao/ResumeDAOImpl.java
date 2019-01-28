package com.DevelopPR.resume.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.resume.model.dto.ResumeVO;

@Repository
public class ResumeDAOImpl implements ResumeDAO{
	@Inject
	   SqlSession SqlSession;
	 
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
	
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception 
	{
	   // 검색옵션, 키워드 맵에 저장
	   Map<String, String> map = new HashMap<String, String>();
	   map.put("searchOption", searchOption);
	   map.put("keyword", keyword);
	   return SqlSession.selectOne("resume.countArticle", map);
	}	
	
	
	
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception {
		System.out.println(vo.toString());
		 SqlSession.insert("resume.registConfirm", vo);
	}

	@Override
	public ResumeVO resumeDetail(String email) throws Exception {
		return SqlSession.selectOne("resume.resumeDetail", email);
	}

	@Override
	public void resumeModify(ResumeVO vo) throws Exception {
		System.out.println(vo.toString());
		SqlSession.update("resume.modify", vo);
	}

	@Override
	public List<ResumeVO> mainList() throws Exception {
		return SqlSession.selectList("resume.mainList");
	}

	
	
}
