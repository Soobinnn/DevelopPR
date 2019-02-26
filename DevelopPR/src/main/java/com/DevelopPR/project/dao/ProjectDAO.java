package com.DevelopPR.project.dao;

import java.util.List;

import com.DevelopPR.project.dto.ProjectVO;

public interface ProjectDAO
{
	
	// 프로젝트 등록
		public void regist(ProjectVO vo) throws Exception;
		
	// 프로젝트 수정
		public ProjectVO modifyForm(int pno) throws Exception;
		public void modify(ProjectVO vo) throws Exception;
		
	//프로젝트 삭제
		public void remove(int pno) throws Exception;

    //프로젝트명 검색
		public List<ProjectVO> lookup(String tech_name_input) throws Exception;
		
	//프로젝트 목록
		public List<ProjectVO> projectList(String email) throws Exception;
		
		public ProjectVO detail(int pno) throws Exception;
}
