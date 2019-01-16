package com.DevelopPR.resume.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
