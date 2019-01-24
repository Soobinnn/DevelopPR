package com.DevelopPR.resume.service;

import java.util.List;

import com.DevelopPR.resume.model.dto.ResumeVO;

public interface ResumeService {

	//이력서 목록보기
	public List<ResumeVO> resumeList() throws Exception;
	//이력서 등록 처리
	public void resumeRegistConfirm(ResumeVO vo) throws Exception;
	//이력서 상세보기
	public ResumeVO resumeDetail(String email) throws Exception;
	
}
