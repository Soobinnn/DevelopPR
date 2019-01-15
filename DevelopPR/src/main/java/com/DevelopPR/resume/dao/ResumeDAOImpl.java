package com.DevelopPR.resume.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOImpl implements ResumeDAO{
	@Inject
	   SqlSession SqlSession;
	 
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception {
		 SqlSession.insert("resume.registConfirm", vo);
	}

}
