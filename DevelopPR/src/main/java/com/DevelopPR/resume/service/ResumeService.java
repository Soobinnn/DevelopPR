package com.DevelopPR.resume.service;

import java.util.List;

import com.DevelopPR.resume.model.dto.ResumeVO;

public interface ResumeService {

	//이력서 목록보기
	public List<ResumeVO> resumeList(int start, int end, String searchOption, String keyword) throws Exception;
	//이력서 목록보기에서 레코드 갯수  메서드 추가 (검색된 자료의 갯수 출력)
    public int countArticle(String searchOption, String keyword) throws Exception;
	
	
	//이력서 등록 처리
	public void resumeRegistConfirm(ResumeVO vo) throws Exception;
	//이력서 상세보기
	public ResumeVO resumeDetail(String email) throws Exception;
	
	//이력서 수정 처리
	public void resumeModify(ResumeVO vo) throws Exception;
	
	
	//메인에서 이미지 가져오기
	public List<ResumeVO> mainList() throws Exception;
}
