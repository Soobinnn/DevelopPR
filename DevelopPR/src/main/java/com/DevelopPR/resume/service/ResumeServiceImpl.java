package com.DevelopPR.resume.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.DevelopPR.resume.model.dao.ResumeDAO;
import com.DevelopPR.resume.model.dto.FollowVO;
import com.DevelopPR.resume.model.dto.ResumeVO; 

@Service
public class ResumeServiceImpl implements ResumeService{
	@Inject
	ResumeDAO resumeDAO;
	@Override
	public void resumeRegistConfirm(ResumeVO vo) throws Exception {
		   System.out.println(vo.toString());
	       resumeDAO.resumeRegistConfirm(vo);
	}
	@Override
	public ResumeVO resumeDetail(String email) throws Exception {
		return resumeDAO.resumeDetail(email);
	}
	@Override
	public void following(FollowVO vo) throws Exception {
		resumeDAO.following(vo);
	}
	/*@Override
	public FollowVO chkFollowing(FollowVO vo) throws Exception {
		return resumeDAO.chkFollowing(vo);
	}*/
	
	

}
