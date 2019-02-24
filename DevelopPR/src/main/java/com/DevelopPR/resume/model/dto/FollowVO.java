package com.DevelopPR.resume.model.dto;

public class FollowVO {
	private String follower_nick;
	private String following_nick;
	private String profile;
	private String name;
	
	public String getFollower_nick() {
		return follower_nick;
	}

	public void setFollower_nick(String follower_nick) {
		this.follower_nick = follower_nick;
	}

	public String getFollowing_nick() {
		return following_nick;
	}

	public void setFollowing_nick(String following_nick) {
		this.following_nick = following_nick;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
