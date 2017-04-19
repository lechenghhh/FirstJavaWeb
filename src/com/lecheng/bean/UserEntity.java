package com.lecheng.bean;

import java.io.Serializable;

public class UserEntity implements Serializable {
	private String userName, passWord;

	public UserEntity() {
		super();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

}
