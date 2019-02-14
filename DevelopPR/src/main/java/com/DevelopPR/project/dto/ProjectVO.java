package com.DevelopPR.project.dto;

import java.sql.Date;

public class ProjectVO 
{
	//파일 업로드 관련 변수 및 클래스는 따로 작성
	 
	
	private int pno;
	private String project_name;
	private String project_content;    //프로젝트 내용 소개란
    private Date project_term1;        //프로젝트 시작일
	private Date project_term2;        //프로젝트 종료일
    private String techstack;          //테크스택(사용가능 언어)
	private String project_grade;      //프로젝트 등급 (상용화, 팀프로젝트...)
	private String tech_name_input;    //검색어 ajax 통신에 이용되는 변수, 검색어 값을 담는다.
	private String nick;               //닉네임, 세션값을 받아서 UserVO형태로 담아온다.
	
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getTech_name_input() 
	{
		return tech_name_input;
	}
	public void setTech_name_input(String tech_name_input) {
		this.tech_name_input = tech_name_input;
	}
	
	public String getProject_name() {
	return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getProject_content() {
		return project_content;
	}
	public void setProject_content(String project_content) {
		this.project_content = project_content;
	}
	public Date getProject_term1() {
		return project_term1;
	}
	public void setProject_term1(Date project_term1) {
		this.project_term1 = project_term1;
	}
	public Date getProject_term2() {
		return project_term2;
	}
	public void setProject_term2(Date project_term2) {
		this.project_term2 = project_term2;
	}
	public String getTechstack() {
		return techstack;
	}
	public void setTechstack(String techstack) {
		this.techstack = techstack;
	}
	public String getProject_grade() {
		return project_grade;
	}
	public void setProject_grade(String project_grade) {
		this.project_grade = project_grade;
	}
	
	
	
	
	
	
}