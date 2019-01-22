package com.DevelopPR.user.dto;

import java.sql.Date;

public class UserVO 
{
	  private String userEmail;
	  private int userIs_seek;
	  private String userNick; 
	  private String userPw;
	  private String userName;
	  private String userJob; // java.sql.Date
	  private String userJob_detail;
	  private Date userRecent_access;
	  private int userAuthStatus;
	  private String userAuthCode;
	  private String userPhone;
	  
	public String getUserPhone() 
	{
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() 
	{
		return userEmail;
	}
	public void setUserEmail(String userEmail) 
	{
		this.userEmail = userEmail;
	}
	public int getUserIs_seek() 
	{
		return userIs_seek;
	}
	public void setUserIs_seek(int userIs_seek) 
	{
		this.userIs_seek = userIs_seek;
	}
	public String getUserNick() 
	{
		return userNick;
	}
	public void setUserNick(String userNick) 
	{
		this.userNick = userNick;
	}
	public String getUserPw() 
	{
		return userPw;
	}
	public void setUserPw(String userPw) 
	{
		this.userPw = userPw;
	}
	public String getUserName() 
	{
		return userName;
	}
	public void setUserName(String userName) 
	{
		this.userName = userName;
	}
	public String getUserJob() 
	{
		return userJob;
	}
	public void setUserJob(String userJob) 
	{
		this.userJob = userJob;
	}
	public String getUserJob_detail() 
	{
		return userJob_detail;
	}
	public void setUserJob_detail(String userJob_detail) 
	{
		this.userJob_detail = userJob_detail;
	}
	public Date getUserRecent_access() 
	{
		return userRecent_access;
	}
	public void setUserRecent_access(Date userRecent_access) 
	{
		this.userRecent_access = userRecent_access;
	}
	public int getUserAuthStatus() 
	{
		return userAuthStatus;
	}
	public void setUserAuthStatus(int userAuthStatus) 
	{
		this.userAuthStatus = userAuthStatus;
	}
	public String getUserAuthCode() 
	{
		return userAuthCode;
	}
	public void setUserAuthCode(String userAuthCode) 
	{
		this.userAuthCode = userAuthCode;
	}
	  
	// toString()
    @Override
    public String toString() 
    {
        return "UserVO [userEmail=" + userEmail + ", userIs_seek=" + userIs_seek + ", userNick=" + userNick + ", userPw="
                + userPw +", userName=" +userName+ ", userJob=" + userJob + ", userJob_detail=" + userJob_detail + ", userRecent_access=" 
        		+ userRecent_access + ", userAuthStatus=" + userAuthStatus+ ",userAuthCode=" +userAuthCode +"]";
    }  
	  
}
