package com.DevelopPR.resume.model.dto;

public class ResumeVO {
	private String motto;
	private int is_work;
	private String profile_photo;
	private String name;
	private String birthday;
	private String cell_num;
	private int cnum_is_open; 
	private String email; 
	private int email_is_open; 
	private String blog; 
	private String address; 
	private int address_is_open;
	private String prefer_place; 
	private String acq_date;
	private String acq_name;
	private String gradu_year;
	private String edu_info;
	private String career_year;
	private String career_info;
	private String abb;
	private String tech_name;
	private String tech_percent;
	private int age;
	private int followCount;
	private int goodCount;
	private String color;
	
	
	
	
	public String getColor() {
		return color;
	}



	public void setColor(String color) {
		this.color = color;
	}



	public int getFollowCount() {
		return followCount;
	}



	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}



	public int getGoodCount() {
		return goodCount;
	}



	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}



	public String getMotto() {
		return motto;
	}



	public void setMotto(String motto) {
		this.motto = motto;
	}



	public int getIs_work() {
		return is_work;
	}



	public void setIs_work(int is_work) {
		this.is_work = is_work;
	}



	public String getProfile_photo() {
		return profile_photo;
	}



	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getBirthday() {
		return birthday;
	}



	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}



	public String getCell_num() {
		return cell_num;
	}



	public void setCell_num(String cell_num) {
		this.cell_num = cell_num;
	}



	public int getCnum_is_open() {
		return cnum_is_open;
	}



	public void setCnum_is_open(int cnum_is_open) {
		this.cnum_is_open = cnum_is_open;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public int getEmail_is_open() {
		return email_is_open;
	}



	public void setEmail_is_open(int email_is_open) {
		this.email_is_open = email_is_open;
	}



	public String getBlog() {
		return blog;
	}



	public void setBlog(String blog) {
		this.blog = blog;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public int getAddress_is_open() {
		return address_is_open;
	}



	public void setAddress_is_open(int address_is_open) {
		this.address_is_open = address_is_open;
	}



	public String getPrefer_place() {
		return prefer_place;
	}



	public void setPrefer_place(String prefer_place) {
		this.prefer_place = prefer_place;
	}



	public String getAcq_date() {
		return acq_date;
	}



	public void setAcq_date(String acq_date) {
		this.acq_date = acq_date;
	}



	public String getAcq_name() {
		return acq_name;
	}



	public void setAcq_name(String acq_name) {
		this.acq_name = acq_name;
	}



	public String getGradu_year() {
		return gradu_year;
	}



	public void setGradu_year(String gradu_year) {
		this.gradu_year = gradu_year;
	}



	public String getEdu_info() {
		return edu_info;
	}



	public void setEdu_info(String edu_info) {
		this.edu_info = edu_info;
	}



	public String getCareer_year() {
		return career_year;
	}



	public void setCareer_year(String career_year) {
		this.career_year = career_year;
	}



	public String getCareer_info() {
		return career_info;
	}



	public void setCareer_info(String career_info) {
		this.career_info = career_info;
	}



	public String getAbb() {
		return abb;
	}



	public void setAbb(String abb) {
		this.abb = abb;
	}



	public String getTech_name() {
		return tech_name;
	}



	public void setTech_name(String tech_name) {
		this.tech_name = tech_name;
	}




	public String getTech_percent() {
		return tech_percent;
	}



	public void setTech_percent(String tech_percent) {
		this.tech_percent = tech_percent;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	@Override
	public String toString() {
		return motto+","+is_work+","+profile_photo+","+name+","+birthday+","+cell_num+","+cnum_is_open+","
				+email+","+email_is_open+","+blog+","+address+","+address_is_open+","+prefer_place+","
				+acq_date+","+acq_name+","+gradu_year+","+edu_info+","+career_year+","+career_info+","+abb+","+tech_name+","+tech_percent;
	}
	
	
	
}
