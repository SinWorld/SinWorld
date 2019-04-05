package com.hmp.entity;

/**
 * 用户实体类，用于测试框架
 * 
 * @author NingCG
 *
 */
public class User {
	private Long id;
	private String userName;
	private String passworld;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassworld() {
		return passworld;
	}

	public void setPassworld(String passworld) {
		this.passworld = passworld;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", passworld=" + passworld + "]";
	}

}
