package com.DevelopPR.project.service;

import java.util.List;

import com.DevelopPR.project.dto.ProjectVO;

public interface ProjectService
{

// 프로젝트 등록
	public void regist(ProjectVO vo) throws Exception;
	
// 프로젝트 수정
	public ProjectVO modifyForm(int pno) throws Exception;
	public void modify(ProjectVO vo) throws Exception;
	
//프로젝트 삭제
	public void remove(int pno) throws Exception;

//프로젝트명 찾기
	public List<ProjectVO> lookup(String tech_name_input) throws Exception;

//프로젝트 목록
	public List<ProjectVO> projectList(String nick) throws Exception;

}
