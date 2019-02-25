package com.DevelopPR.project.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	private MultipartFile file;      // 프로젝트 업로드 파일의 주소를 담는 매개변수
	private String pr_file_name;
	private String download_name;    // view에서 상대경로로 다운로드 하기 위해 절대경로를 제외하고 파일명만 담아서 전달할 매개변수.
	private String project_image;    // 프로젝트 관련 이미지 경로를 담을 매개변수.
	private String email;
	
	
	
	
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProject_image() {
		return project_image;
	}

	public void setProject_image(String project_image) {
		this.project_image = project_image;
	}

	public String getDownload_name() {
		return download_name;
	}

	public void setDownload_name(String download_name) {
		this.download_name = download_name;
	}






	public int getPno() {
		return pno;
	}






	public void setPno(int pno) {
		this.pno = pno;
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






	public String getTech_name_input() {
		return tech_name_input;
	}






	public void setTech_name_input(String tech_name_input) {
		this.tech_name_input = tech_name_input;
	}






	public String getNick() {
		return nick;
	}






	public void setNick(String nick) {
		this.nick = nick;
	}






	public MultipartFile getFile() {
		return file;
	}






	public void setFile(MultipartFile file) {
		this.file = file;
	}






	public String getPr_file_name() {
		return pr_file_name;
	}






	public void setPr_file_name(String pr_file_name) {
		this.pr_file_name = pr_file_name;
	}






	// toString()
    @Override
    public String toString() 
    {
        return "ProjectVO [pno=" + pno + ", project_name=" + project_name + ", project_content=" + project_content + ", project_term1="
                + project_term1 +", project_term2=" +project_term2+ ", techstack=" + techstack + ", project_grade=" + project_grade + ", tech_name_input=" 
              + tech_name_input + ", nick=" + nick+ ",file=" +file + ",pr_file_name=" + pr_file_name + ", project_image=" + project_image + "]";
    }  
     	
	
	
	
}