package com.DevelopPR.resume.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.DevelopPR.resume.model.dto.ResumeVO;

@Repository
public class ResumeDAOImpl implements ResumeDAO{
	@Inject
	   SqlSession SqlSession;
	 
	@Override
	public List<ResumeVO> resumeList() throws Exception {
		return SqlSession.selectList("resume.resumeList");
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

	
}
