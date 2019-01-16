package com.DevelopPR.resume.model.dao;

import com.DevelopPR.resume.model.dto.ResumeVO;

public interface ResumeDAO {
	
	//이력서 등록 처리
	public void resumeRegistConfirm(ResumeVO vo) throws Exception;
	
	//이력서 상세보기 
	public ResumeVO resumeDetail(String email) throws Exception;
	
}
