package com.DevelopPR.resume.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.DevelopPR.resume.model.dao.ResumeDAO;
import com.DevelopPR.resume.model.dto.ResumeVO; 

@Service
public class ResumeServiceImpl implements ResumeService{
	@Inject
	ResumeDAO resumeDAO;
	
	@Override
	public List<ResumeVO> resumeList() throws Exception {
		return resumeDAO.resumeList();
	}
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception {
		   System.out.println(vo.toString());
	       resumeDAO.resumeRegistConfirm(vo);
	}
	@Override
	public ResumeVO resumeDetail(String email) throws Exception {
		return resumeDAO.resumeDetail(email);
	}
	
	

}
