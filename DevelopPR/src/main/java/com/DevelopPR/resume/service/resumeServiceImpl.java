package com.DevelopPR.resume.service;

import com.DevelopPR.resume.dao.ResumeVO;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.DevelopPR.resume.dao.ResumeDAO;

@Service
public class ResumeServiceImpl implements ResumeService{
	@Inject
	ResumeDAO resumeDAO;
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception {
	       resumeDAO.resumeRegistConfirm(vo);
	}

}
